from datetime import datetime
from django.db import transaction
from django.http import HttpRequest, HttpResponse

import thrift_gen.tapsonic.general.ttypes as common_type
import thrift_gen.tapsonic.user_setEventReward_en.ttypes as endpoint_types

from gameapi import models
from .. import _helper as helper


def _apply_reward(player, reward, area1):
    """Apply the reward to the player's server-side state."""
    rtype = reward.reward_type
    rid   = reward.reward_id
    rval  = reward.reward_value

    if rtype == 1:  # consume
        if rid == 1:  # Chocolate (CP / Choco Point)
            player.u_cp += rval
            player.save(update_fields=['u_cp'])
        elif rid == 2:  # Candy
            player.u_candy += rval
            player.save(update_fields=['u_candy'])
        elif rid == 8 and area1:  # Fan
            area1.i_UserFanCount += rval
            area1.save(update_fields=['i_UserFanCount'])
        elif rid == 11:  # Cookie (Ch3 currency)
            player.u_cookie += rval
            player.save(update_fields=['u_cookie'])

    elif rtype == 2:  # music
        models.UserMusic.objects.get_or_create(
            player=player, i_id=rid,
            defaults={'i_Level': 1, 'i_BonusLevel': 0}
        )
    elif rtype == 3:  # costume
        models.UserCostume.objects.get_or_create(
            player=player, i_id=rid,
            defaults={'i_Level': 1, 'i_BonusLevel': 0}
        )
    elif rtype == 9:  # Guitar
        models.UserGuitar.objects.get_or_create(
            player=player, i_id=rid,
            defaults={'i_Level': 1, 'i_BonusLevel': 0}
        )
    elif rtype == 11:  # follower gift item
        gift, _ = models.UserFollowerGiftItem.objects.get_or_create(
            player=player, i_id=rid,
            defaults={'i_Value': 0}
        )
        gift.i_Value += rval
        gift.save(update_fields=['i_Value'])
    elif rtype == 13:  # character — skip (inactive event 202111, no info yet)
        pass
    # rtype == 0 or unknown: skip


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
            _apply_reward(player, next_reward, area1)

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
            area1 = player.areas.filter(u_area_num=1).first()
            u_fans = area1.i_UserFanCount if area1 else 0

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
