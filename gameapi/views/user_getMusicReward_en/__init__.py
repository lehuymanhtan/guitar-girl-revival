import logging
from django.db import transaction
from django.http import HttpRequest, HttpResponse

import thrift_gen.tapsonic.general.ttypes as common_type
import thrift_gen.tapsonic.user_getMusicReward_en.ttypes as endpoint_types

from gameapi import models
from gamedata import models as gd_models
from .. import _helper as helper

logger = logging.getLogger(__name__)

@helper.wrapper_helper
def getMusicReward(request: HttpRequest):
    raw_data = request.POST.get('tapsonic_data', None)
    if not raw_data:
        return HttpResponse("Bad Request", status=400)
        
    req_obj = endpoint_types.getMusicReward()
    req_obj.read(helper.decodeToBinary(raw_data))

    if not req_obj.data or not req_obj.data.u_seq:
        return HttpResponse("Bad Request", status=400)

    try:
        with transaction.atomic():
            player = models.Player.objects.get(u_seq=req_obj.data.u_seq)
            
            i_ids = req_obj.data.i_ids or []
            i_levels = req_obj.data.i_levels or []

            total_reward_value = 0 # total amount of Candy to be rewarded
            reward_music_id = []
            reward_value = []
            updated_profiles = {} # Use dict to avoid duplicates if multiple musics use same follower

            for idx, music_id in enumerate(i_ids):
                # Ensure we have a matching level, else default to 1
                level = i_levels[idx] if idx < len(i_levels) else 1

                try:
                    music_level_data = gd_models.MusicLevelData.objects.get(i_Level=level)
                except gd_models.MusicLevelData.DoesNotExist:
                    logger.warning(f"MusicLevelData with level {level} not found.")
                    continue
                
                try:
                    user_music = models.UserMusic.objects.get(player=player, i_id=music_id)
                except models.UserMusic.DoesNotExist:
                    logger.warning(f"UserMusic with ID {music_id} not found for player {player.u_seq}.")
                    continue

                follower_id = user_music.i_EncoreBonusFollowerId
                
                # Get follower profile
                follower_profile = player.follower_profiles.filter(i_id=follower_id).first()
                if not follower_profile:
                    logger.warning(f"Follower profile with ID {follower_id} not found for player {player.u_seq}.")


                
                # Calculate reward value: base + i_AddCandy
                base_reward = music_level_data.i_EncoreBonusGiftAmount or 0
                candy_bonus = follower_profile.i_AddCandy if follower_profile else 0
                actual_reward = base_reward + candy_bonus

                total_reward_value += actual_reward
                reward_music_id.append(music_id)
                reward_value.append(actual_reward)

                # Add EXP to follower
                exp_gain = music_level_data.i_EncoreFollowerProfileExp
                if exp_gain > 0 and follower_profile:
                    if follower_id in updated_profiles:
                        follower_profile = updated_profiles[follower_id]
                    
                    follower_profile.d_Exp += exp_gain
                    
                    # Check for level up
                    level_data_qs = gd_models.FollowerProfileLevelData.objects.filter(i_ProfileID=follower_id).order_by('i_Level')
                    new_level = follower_profile.i_Level
                    for ld in level_data_qs:
                        if follower_profile.d_Exp >= (ld.d_RequireEXP or 0):
                            new_level = max(new_level, ld.i_Level)
                    
                    if new_level > follower_profile.i_Level:
                        follower_profile.i_Level = new_level

                    follower_profile.save()
                    updated_profiles[follower_id] = follower_profile

                # Consume the bonus
                user_music.b_EncoreBonusAppear = 0
                user_music.save()
                
            # Add to Candy balance (UserProp i_id=1)
            if total_reward_value > 0:
                player.u_candy += total_reward_value
                player.save()

            # Construct response
            user_follower_profiles_thrift = []
            for profile in updated_profiles.values():
                user_follower_profiles_thrift.append(common_type.UserFollowerProfile(
                    i_id=profile.i_id,
                    i_Level=profile.i_Level,
                    d_Exp=profile.d_Exp,
                    i_AddCandy=profile.i_AddCandy
                ))

            ret_data = endpoint_types.getMusicRewardRetDataInfo(
                total_reward_value=total_reward_value,
                reward_music_id=reward_music_id,
                reward_value=reward_value,
                user_follower_profile=user_follower_profiles_thrift,
                error_data={}
            )

            return endpoint_types.getMusicRewardReturn(
                error=common_type.errorRetCode(code=0, errmsg=""),
                server_time=helper.auto_response_time(),
                mode="user",
                call="getMusicReward",
                data=ret_data,
                maintenance=common_type.maintenanceData()
            )

    except models.Player.DoesNotExist:
        return endpoint_types.getMusicRewardReturn(
            error=common_type.errorRetCode(code=909, errmsg="Unregisterd User"),
            server_time=helper.auto_response_time(),
            mode="user",
            call="getMusicReward",
            data=None,
            maintenance=common_type.maintenanceData()
        )
    except Exception as e:
        return HttpResponse(f"Internal server error: {e}", status=500)
