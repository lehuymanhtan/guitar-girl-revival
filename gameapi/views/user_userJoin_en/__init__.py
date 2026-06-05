from django.db import transaction
from django.http import HttpRequest, HttpResponse

import thrift_gen.tapsonic.general.ttypes as common_type
import thrift_gen.tapsonic.user_userJoin_en.ttypes as user_userJoin_en

from gameapi import models
from .. import _helper as helper

@helper.wrapper_helper
def userJoin(request: HttpRequest):
    raw_data = request.POST.get("tapsonic_data", None)
    if not raw_data:
        return HttpResponse("Bad Request", status=400)
    
    req= user_userJoin_en.userJoin()
    req.read(helper.decodeToBinary(raw_data))
    
    uuid = req.data.uuid
    if not uuid:
        return HttpResponse("Bad Request", status=400)
    
    if models.Player.objects.filter(uuid=uuid).exists():
        return user_userJoin_en.userJoinReturn(
                error=common_type.errorRetCode(code=900, errmsg="[userJoin] Already Registered!"),
                server_time=helper.auto_response_time(),
                mode="main",
                call="userJoin",
                data=None,
                maintenance=common_type.maintenanceData()
            )
    
    try:
        with transaction.atomic():
            user = models.Player.objects.create(uuid=uuid)
            user.save()
            
            # create area info
            for i in range(1, 3):
                area_info = models.UserAreaInfo.objects.create(player=user, u_area_num=i)
                area_info.save()
            
            # create achievement info
            for i in range(1, 11):
                achievement_info = models.UserAchievement.objects.create(player=user, i_id=i)
                achievement_info.save()
            for i in range(201, 208):
                achievement_info = models.UserAchievement.objects.create(player=user, i_id=i)
                achievement_info.save()
            
            # create user character info
            character_info = models.UserCharacter.objects.create(player=user, i_id=1)
            character_info.save()
            
            # create user costume info
            costume_info = models.UserCostume.objects.create(player=user, i_id=1)
            costume_info.save()
            
            # create user daily mission info
            for i in range(1, 7):
                daily_mission_info = models.UserDailyMission.objects.create(player=user, i_id=i)
                daily_mission_info.save()
            
            # create user music info
            music_info = models.UserMusic.objects.create(player=user, i_id=1)
            music_info.save()
            
            return user_userJoin_en.userJoinReturn(
                error=common_type.errorRetCode(code=0, errmsg=""),
                server_time=helper.auto_response_time(),
                mode="main",
                call="userJoin",
                data=user_userJoin_en.userJoinRetDataInfo(
                    u_seq=user.u_seq,
                    u_id=str(user.u_id),
                ),
                maintenance=common_type.maintenanceData()
            )
            
    except Exception as e:
        return HttpResponse(f"Internal server error: {e}", status=500)