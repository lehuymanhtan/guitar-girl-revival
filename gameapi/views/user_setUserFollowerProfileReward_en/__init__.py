from datetime import datetime
from django.db import transaction
from django.http import HttpRequest, HttpResponse

import thrift_gen.tapsonic.general.ttypes as common_type
import thrift_gen.tapsonic.user_setUserFollowerProfileReward_en.ttypes as endpoint_types

from gameapi import models
from .. import _helper as helper


@helper.wrapper_helper
def setUserFollowerProfileReward(request: HttpRequest):
    raw_data = request.POST.get('tapsonic_data', None)
    if not raw_data:
        return HttpResponse("Bad Request", status=400)

    req_obj = endpoint_types.setUserFollowerProfileReward()
    req_obj.read(helper.decodeToBinary(raw_data))

    if not req_obj.data or not req_obj.data.u_seq:
        return HttpResponse("Bad Request", status=400)

    def _error(code, msg):
        return endpoint_types.setUserFollowerProfileRewardReturn(
            error=common_type.errorRetCode(code=code, errmsg=msg),
            server_time=helper.auto_response_time(),
            mode="user",
            call="setUserFollowerProfileReward",
            data=None,
            maintenance=common_type.maintenanceData()
        )

    try:
        with transaction.atomic():
            player = models.Player.objects.select_for_update().get(
                u_seq=req_obj.data.u_seq
            )

            i_id = req_obj.data.i_id
            s_level = req_obj.data.s_level
            
            if i_id is None or s_level is None:
                return _error(900, "Missing profile ID or level")
            
            try:
                i_level = int(s_level)
            except ValueError:
                return _error(900, "Invalid level format")

            # Check if this profile reward was already claimed
            if models.UserFollowerProfileReward.objects.filter(
                player=player, i_id=i_id, i_RewardLevel=i_level
            ).exists():
                return _error(900, "Reward already claimed")

            # Look up FollowerProfileLevelData
            try:
                profile_level_data = models.FollowerProfileLevelData.objects.get(
                    i_ProfileID=i_id, i_Level=i_level
                )
            except models.FollowerProfileLevelData.DoesNotExist:
                return _error(900, "Invalid profile ID or level")

            reward_group_id = profile_level_data.i_RewardGroup

            # Fetch rewards
            rewards = models.RewardGroupData.objects.filter(i_Group=reward_group_id)

            # Apply rewards
            area1 = player.areas.filter(u_area_num=1).first()
            for reward in rewards:
                helper.apply_reward(
                    player, area1, 
                    reward.i_RewardType, reward.i_RewardID, reward.l_RewardQuantity
                )

            # Mark as claimed
            models.UserFollowerProfileReward.objects.create(
                player=player,
                i_id=i_id,
                i_RewardLevel=i_level
            )

            # Fetch the updated UserFollowerProfile to return
            # According to thrift, setUserFollowerProfileRewardRetDataInfo contains list<UserFollowerProfileData> followerprofile
            user_profile, created = models.UserFollowerProfile.objects.get_or_create(
                player=player, i_id=i_id,
                defaults={
                    'i_Level': 1,
                    'd_Exp': 0,
                }
            )

            user_profile_data = common_type.UserFollowerProfile(
                i_id=user_profile.i_id,
                i_Level=user_profile.i_Level,
                d_Exp=user_profile.d_Exp,
                i_AddCandy=user_profile.i_AddCandy
            )

            # Build reward_data
            ret_rewards = []
            for reward in rewards:
                ret_rewards.append(
                    common_type.retReward(
                        reward_type=reward.i_RewardType,
                        reward_id=reward.i_RewardID,
                        reward_value=reward.l_RewardQuantity
                    )
                )

            return endpoint_types.setUserFollowerProfileRewardReturn(
                error=common_type.errorRetCode(code=0, errmsg=""),
                server_time=helper.auto_response_time(),
                mode="user",
                call="setUserFollowerProfileReward",
                data=[endpoint_types.setUserFollowerProfileRewardRetDataInfo(
                    i_id=i_id,
                    i_level=i_level,
                    reward_data=ret_rewards,
                    user_follower_profile=user_profile_data
                )],
                maintenance=common_type.maintenanceData()
            )

    except models.Player.DoesNotExist:
        return _error(998, "Unregistered user")
    except Exception as e:
        return HttpResponse(f"Internal server error: {e}", status=500)
