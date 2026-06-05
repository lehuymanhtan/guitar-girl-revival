import logging
from django.db import transaction
from django.http import HttpRequest, HttpResponse

import thrift_gen.tapsonic.general.ttypes as common_type
import thrift_gen.tapsonic.user_setGameReward_en.ttypes as endpoint_types

from gameapi import models
from .. import _helper as helper

@helper.wrapper_helper
def setGameReward(request: HttpRequest):
    raw_data = request.POST.get('tapsonic_data', None)
    if not raw_data:
        return HttpResponse("Bad Request", status=400)
        
    req_obj = endpoint_types.setGameReward()
    req_obj.read(helper.decodeToBinary(raw_data))

    if not req_obj.data or not req_obj.data.u_seq:
        return HttpResponse("Bad Request", status=400)

    try:
        with transaction.atomic():
            player = models.Player.objects.get(u_seq=req_obj.data.u_seq)
            
            reward_type = req_obj.data.type
            reward_id = req_obj.data.id
            level = req_obj.data.level

            if reward_type is None or reward_id is None or level is None:
                return endpoint_types.setGameRewardReturn(
                    error=common_type.errorRetCode(code=900, errmsg="Invalid parameters"),
                    server_time=helper.auto_response_time(),
                    mode="user",
                    call="setGameReward",
                    data=None,
                    maintenance=common_type.maintenanceData()
                )

            out_reward_type = ""
            out_reward_value = 0

            if reward_type == "daily_mission":
                try:
                    dm_data = models.DailyMissionData.objects.get(i_id=reward_id)
                except models.DailyMissionData.DoesNotExist:
                    return endpoint_types.setGameRewardReturn(
                        error=common_type.errorRetCode(code=900, errmsg="Daily mission not found"),
                        server_time=helper.auto_response_time(),
                        mode="user",
                        call="setGameReward",
                        data=None,
                        maintenance=common_type.maintenanceData()
                    )
                
                out_reward_type = dm_data.s_RewardType
                out_reward_value = dm_data.i_Reward_1

                user_dm, _ = models.UserDailyMission.objects.get_or_create(
                    player=player,
                    i_id=reward_id,
                    defaults={'i_Level': level}
                )
                user_dm.i_Level += 1
                user_dm.save()

            elif reward_type == "achievement":
                try:
                    ach_data = models.AchievementData.objects.get(i_id=reward_id)
                except models.AchievementData.DoesNotExist:
                    return endpoint_types.setGameRewardReturn(
                        error=common_type.errorRetCode(code=900, errmsg="Achievement not found"),
                        server_time=helper.auto_response_time(),
                        mode="user",
                        call="setGameReward",
                        data=None,
                        maintenance=common_type.maintenanceData()
                    )

                user_ach, _ = models.UserAchievement.objects.get_or_create(
                    player=player,
                    i_id=reward_id,
                    defaults={'i_Level': level, 'd_Quantity': 0, 's_Quantity': ''}
                )

                if user_ach.i_Level != level:
                    return endpoint_types.setGameRewardReturn(
                        error=common_type.errorRetCode(code=900, errmsg="Level mismatch or already claimed"),
                        server_time=helper.auto_response_time(),
                        mode="user",
                        call="setGameReward",
                        data=None,
                        maintenance=common_type.maintenanceData()
                    )
                
                out_reward_type = ach_data.s_RewardType
                out_reward_value = getattr(ach_data, f'i_Reward_{level}', 0)

                user_ach.i_Level += 1
                user_ach.save()

            else:
                return endpoint_types.setGameRewardReturn(
                    error=common_type.errorRetCode(code=900, errmsg="Unknown reward type"),
                    server_time=helper.auto_response_time(),
                    mode="user",
                    call="setGameReward",
                    data=None,
                    maintenance=common_type.maintenanceData()
                )

            return endpoint_types.setGameRewardReturn(
                error=common_type.errorRetCode(code=0, errmsg=""),
                server_time=helper.auto_response_time(),
                mode="user",
                call="setGameReward",
                data=endpoint_types.setGameRewardRetDataInfo(
                    type=reward_type,
                    id=reward_id,
                    level=level + 1,
                    reward_type=out_reward_type,
                    reward_value=out_reward_value,
                    status="Y",
                    user_follower_profile=None
                ),
                maintenance=common_type.maintenanceData()
            )

    except models.Player.DoesNotExist:
        return endpoint_types.setGameRewardReturn(
            error=common_type.errorRetCode(code=900, errmsg="Unregisterd User"),
            server_time=helper.auto_response_time(),
            mode="user",
            call="setGameReward",
            data=None,
            maintenance=common_type.maintenanceData()
        )
    except Exception as e:
        return HttpResponse(f"Internal server error: {e}", status=500)
