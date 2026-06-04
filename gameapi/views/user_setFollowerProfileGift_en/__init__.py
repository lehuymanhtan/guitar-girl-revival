import logging
from django.db import transaction
from django.http import HttpRequest, HttpResponse

import thrift_gen.tapsonic.general.ttypes as common_type
import thrift_gen.tapsonic.user_setFollowerProfileGift_en.ttypes as endpoint_types

from gameapi import models
from .. import _helper as helper

@helper.wrapper_helper
def user_setFollowerProfileGift_en(request: HttpRequest):
    raw_data = request.POST.get('tapsonic_data', None)
    if not raw_data:
        return HttpResponse("Bad Request", status=400)
        
    req_obj = endpoint_types.setFollowerProfileGift()
    req_obj.read(helper.decodeToBinary(raw_data))

    if not req_obj.data or not req_obj.data.u_id:
        return HttpResponse("Bad Request", status=400)

    try:
        with transaction.atomic():
            player = models.Player.objects.get(u_id=req_obj.data.u_id)
            
            profile_id = req_obj.data.profile_id
            gift_id = req_obj.data.gift_id
            use_gift_value = req_obj.data.use_gitf_value
            
            if profile_id is None or gift_id is None or use_gift_value is None:
                return endpoint_types.setFollowerProfileGiftReturn(
                    error=common_type.errorRetCode(code=900, errmsg="Invalid parameters"),
                    server_time=helper.auto_response_time(),
                    mode="user",
                    call="setFollowerProfileGift",
                    data=None,
                    maintenance=common_type.maintenanceData()
                )

            # 1. Deduct Gift Items
            try:
                user_gift, _ = models.UserFollowerGiftItem.objects.get_or_create(
                    player=player,
                    i_id=gift_id,
                    defaults={'i_Value': 0}
                )
            except Exception:
                return endpoint_types.setFollowerProfileGiftReturn(
                    error=common_type.errorRetCode(code=900, errmsg="Could not find/create gift item"),
                    server_time=helper.auto_response_time(),
                    mode="user",
                    call="setFollowerProfileGift",
                    data=None,
                    maintenance=common_type.maintenanceData()
                )
            
            user_gift.i_Value = max(0, user_gift.i_Value - use_gift_value)
            user_gift.save()
            
            # 2. Add EXP to Follower Profile
            try:
                gift_data = models.FollowerGiftItemData.objects.get(i_id=gift_id)
                exp_gain = use_gift_value * gift_data.d_Value
            except models.FollowerGiftItemData.DoesNotExist:
                # Default fallback if DB lacks it
                exp_gain = use_gift_value * 20
                
            user_profile, _ = models.UserFollowerProfile.objects.get_or_create(
                player=player,
                i_id=profile_id,
                defaults={'i_Level': 1, 'd_Exp': 0, 'i_AddCandy': 0}
            )
            
            user_profile.d_Exp += exp_gain
            
            # 3. Calculate New Level
            level_data_qs = models.FollowerProfileLevelData.objects.filter(i_ProfileID=profile_id).order_by('i_Level')
            if level_data_qs.exists():
                new_level = user_profile.i_Level
                add_candy = 0
                for ld in level_data_qs:
                    if user_profile.d_Exp >= ld.d_RequireEXP:
                        new_level = max(new_level, ld.i_Level)
                        if ld.i_Level > user_profile.i_Level and ld.i_AddCandy > 0:
                            add_candy += ld.i_AddCandy
                
                if new_level > user_profile.i_Level:
                    user_profile.i_Level = new_level
                    if add_candy > 0:
                        user_profile.i_AddCandy += add_candy

            user_profile.save()

            # 4. Construct Response
            gift_item_thrift = common_type.UserFollowerGiftItem(
                i_id=user_gift.i_id,
                i_Value=user_gift.i_Value
            )
            
            profile_thrift = common_type.UserFollowerProfile(
                i_id=user_profile.i_id,
                i_Level=user_profile.i_Level,
                d_Exp=user_profile.d_Exp,
                i_AddCandy=user_profile.i_AddCandy
            )
            
            return endpoint_types.setFollowerProfileGiftReturn(
                error=common_type.errorRetCode(code=0, errmsg=""),
                server_time=helper.auto_response_time(),
                mode="user",
                call="setFollowerProfileGift",
                data=endpoint_types.setFollowerProfileGiftRetDataInfo(
                    i_gift_type=gift_id,
                    user_follower_giftitem=gift_item_thrift,
                    user_follower_profile=profile_thrift
                ),
                maintenance=common_type.maintenanceData()
            )
            
    except models.Player.DoesNotExist:
        return endpoint_types.setFollowerProfileGiftReturn(
            error=common_type.errorRetCode(code=900, errmsg="Unregisterd User"),
            server_time=helper.auto_response_time(),
            mode="user",
            call="setFollowerProfileGift",
            data=None,
            maintenance=common_type.maintenanceData()
        )
    except Exception as e:
        return HttpResponse(f"Internal server error: {e}", status=500)
