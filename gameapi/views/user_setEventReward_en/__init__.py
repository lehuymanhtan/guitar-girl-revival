from datetime import datetime
from django.db import transaction
from django.http import HttpRequest, HttpResponse

import thrift_gen.tapsonic.general.ttypes as common_type
import thrift_gen.tapsonic.user_setEventReward_en.ttypes as endpoint_types

from gameapi import models
from .. import _helper as helper


@helper.wrapper_helper
def setEventReward(request: HttpRequest):
    raw_data = request.POST.get('tapsonic_data', None)
    if not raw_data:
        return HttpResponse("Bad Request", status=400)

    req_obj = endpoint_types.setEventReward()
    req_obj.read(helper.decodeToBinary(raw_data))

    if not req_obj.data or not req_obj.data.u_seq:
        return HttpResponse("Bad Request", status=400)

    def _error(code, msg):
        return endpoint_types.setEventRewardReturn(
            error=common_type.errorRetCode(code=code, errmsg=msg),
            server_time=helper.auto_response_time(),
            mode="user",
            call="setEventReward",
            data=None,
            maintenance=common_type.maintenanceData()
        )

    try:
        with transaction.atomic():
            player = models.Player.objects.select_for_update().get(
                u_seq=req_obj.data.u_seq
            )

            event_idx = req_obj.data.event_idx
            if event_idx is None:
                return _error(900, "Missing event_idx")

            # 1. Look up event group
            try:
                event = models.Event.objects.get(idx=event_idx)
            except models.Event.DoesNotExist:
                return _error(900, "Event not found")

            # 2. Find next unclaimed reward
            already_claimed_ids = models.UserEventReward.objects.filter(
                player=player,
                event_reward__event=event,
                reward_flg='Y'
            ).values_list('event_reward_id', flat=True)

            next_reward = event.rewards.exclude(
                id__in=already_claimed_ids
            ).order_by('reward_num').first()

            if next_reward is None:
                return _error(900, "All rewards already claimed")

            # 3. Apply reward server-side
            area1 = player.areas.filter(u_area_num=1).first()
            helper.apply_reward(player, area1, next_reward.reward_type, next_reward.reward_id, next_reward.reward_value)

            # 4. Mark as claimed
            get_date = int(datetime.now().strftime("%Y%m%d"))
            models.UserEventReward.objects.create(
                player=player,
                event_reward=next_reward,
                reward_flg='Y',
                get_date=get_date
            )

            # 5. Return updated balances
            # Re-fetch area1 in case Fan was applied
            # area1 = player.areas.filter(u_area_num=1).first()
            # u_fans = area1.i_UserFanCount if area1 else 0
            u_fans = 0

            return endpoint_types.setEventRewardReturn(
                error=common_type.errorRetCode(code=0, errmsg=""),
                server_time=helper.auto_response_time(),
                mode="user",
                call="setEventReward",
                data=endpoint_types.setEventRewardRetDataInfo(
                    u_cp=player.u_cp,
                    u_candy=player.u_candy,
                    u_like=0.0,
                    u_fans=u_fans,
                    reward_type=next_reward.reward_type,
                    reward_id=next_reward.reward_id,
                    reward_value=next_reward.reward_value,
                    status='Y',
                    reward_data=None
                ),
                maintenance=common_type.maintenanceData()
            )

    except models.Player.DoesNotExist:
        return _error(998, "Unregistered user")
    except Exception as e:
        return HttpResponse(f"Internal server error: {e}", status=500)
