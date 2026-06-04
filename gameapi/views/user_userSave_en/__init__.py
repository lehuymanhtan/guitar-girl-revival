from django.http import HttpRequest, HttpResponse

import thrift_gen.tapsonic.general.ttypes as common_type
import thrift_gen.tapsonic.user_userSave_en.ttypes as user_userSave_en

from gameapi import models
from .. import _helper as helper


@helper.wrapper_helper
def userSave(request: HttpRequest):
    raw_data = request.POST.get("tapsonic_data", None)
    if not raw_data:
        return HttpResponse("Bad Request", status=400)

    req = user_userSave_en.userSave()
    req.read(helper.decodeToBinary(raw_data))
    if not req.data:
        return HttpResponse("Bad Request", status=400)

    u_seq = req.data.u_seq
    if not u_seq:
        return HttpResponse("Bad Request", status=400)

    user = models.Player.objects.filter(u_seq=u_seq).first()
    if not user:
        return HttpResponse("Bad Request", status=400)

    # save user area info
    if areas := req.data.user_area_info:
        for area in areas:
            models.UserAreaInfo.objects.update_or_create(
                player=user,
                u_area_num=area.u_area_num,
                defaults={
                    "d_Like": area.d_Like,
                    "i_UserFanCount": area.i_UserFanCount,
                    "i_UserFanGrade": area.i_UserFanGrade,
                    "i_SelectedCostumeId": area.i_SelectedCostumeId,
                    "i_SelectedMusicId": area.i_SelectedMusicId,
                    "i_SelectedGuitarId": area.i_SelectedGuitarId,
                    "d_Candy": area.d_Candy,
                    "s_TutorialList": area.s_TutorialList,
                    "s_Gp1": area.s_Gp1,
                    "s_Gp2": area.s_Gp2,
                },
            )

    # save user achievement info
    if achievements := req.data.user_achievement:
        for achievement in achievements:
            models.UserAchievement.objects.update_or_create(
                player=user,
                i_id=achievement.i_id,
                defaults={
                    "d_Quantity": achievement.d_Quantity,
                    "s_Quantity": achievement.s_Quantity,
                },
            )
    
    # save user character info
    if characters := req.data.user_character:
        for character in characters:
            models.UserCharacter.objects.update_or_create(
                player=user,
                i_id=character.i_id,
                defaults={
                    "i_Level": character.i_Level,
                    "i_BonusLevel": character.i_BonusLevel
                },
            )
    
    # save user costume info
    if costumes := req.data.user_costume:
        for costume in costumes:
            models.UserCostume.objects.update_or_create(
                player=user,
                i_id=costume.i_id,
                defaults={
                    "i_Level": costume.i_Level,
                    "i_BonusLevel": costume.i_BonusLevel
                },
            )
    
    # save user daily mission info
    if daily_missions := req.data.user_daily_mission:
        for daily_mission in daily_missions:
            models.UserDailyMission.objects.update_or_create(
                player=user,
                i_id=daily_mission.i_id,
                defaults={
                    "d_Quantity": daily_mission.d_Quantity
                },
            )
        
    # save user follower info
    if followers := req.data.user_follower:
        for follower in followers:
            models.UserFollower.objects.update_or_create(
                player=user,
                i_id=follower.i_id,
                defaults={
                    "i_Level": follower.i_Level,
                    "i_BonusLevel": follower.i_BonusLevel
                },
            )
    
    # save user music info
    if musics := req.data.user_music:
        for music in musics:
            models.UserMusic.objects.update_or_create(
                player=user,
                i_id=music.i_id,
                defaults={
                    "i_Level": music.i_Level,
                    "i_BonusLevel": music.i_BonusLevel,
                    "b_EncoreBonusAppear": music.b_EncoreBonusAppear,
                    "i_EncoreBonusFollowerId": music.i_EncoreBonusFollowerId
                },
            )
    
    # save user skill info
    if skills := req.data.user_skill:
        for skill in skills:
            models.UserSkill.objects.update_or_create(
                player=user,
                i_id=skill.i_id,
                defaults={
                    "b_Activate": skill.b_Activate,
                    "l_ActivateOnTicks": skill.l_ActivateOnTicks,
                    "l_ActivateOffTicks": skill.l_ActivateOffTicks
                },
            )
    
    # save user messenger info
    if messengers := req.data.user_messenger:
        for messenger in messengers:
            models.UserMessenger.objects.update_or_create(
                player=user,
                i_MessengerChatRoomId=messenger.i_MessengerChatRoomId,
                defaults={
                    "i_LastConfirmIndex": messenger.i_LastConfirmIndex,
                    "s_UnlockGroupList": messenger.s_UnlockGroupList,
                    "l_UpdateTimeTicks": messenger.l_UpdateTimeTicks
                },
            )
    
    # save user guitar info
    if guitars := req.data.user_guitar:
        for guitar in guitars:
            models.UserGuitar.objects.update_or_create(
                player=user,
                i_id=guitar.i_id,
                defaults={
                    "i_Level": guitar.i_Level,
                    "i_BonusLevel": guitar.i_BonusLevel
                },
            )
    
    # save user event point info
    if events := req.data.user_event_point:
        for event in events:
            models.UserEventPoint.objects.update_or_create(
                player=user,
                s_EventType=event.s_EventType,
                i_DataID=event.i_DataID,
                i_Version=event.i_Version,
                defaults={
                    "i_Point": event.i_Point,
                    "i_Step": event.i_Step,
                }
            )
    
    # save follower quest info
    if follower_quests := req.data.user_follower_quest:
        follower_quest = follower_quests[0]
        models.UserFollowerQuest.objects.update_or_create(
            player=user,
            defaults={
                "i_CurrentID": follower_quest.i_CurrentID,
                "d_ConditionValue1": follower_quest.d_ConditionValue1,
                "d_ConditionValue2": follower_quest.d_ConditionValue2,
                "d_ConditionValue3": follower_quest.d_ConditionValue3
            },
        )
    
    return user_userSave_en.userSaveReturn(
        error=common_type.errorRetCode(code=0, errmsg=""),
        server_time=helper.auto_response_time(),
        mode="main",
        call="userSave",
        data=user_userSave_en.userSaveRetDataInfo(status="Y"),
        maintenance=common_type.maintenanceData()
    )