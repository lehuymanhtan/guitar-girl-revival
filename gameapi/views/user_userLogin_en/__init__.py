from datetime import datetime

from django.http import HttpRequest, HttpResponse

import thrift_gen.tapsonic.common.ttypes as common_type
import thrift_gen.tapsonic.user_userLogin_en.ttypes as user_userLogin_en

from gameapi import models
from .. import _helper as helper

@helper.wrapper_helper
def userLogin(request: HttpRequest):
    raw_data = request.POST.get("tapsonic_data", None)
    if not raw_data:
        return HttpResponse("Bad Request", status=400)
    
    req= user_userLogin_en.userLogin()
    req.read(helper.decodeToBinary(raw_data))
    
    
    u_seq = req.data.u_seq
    
    if not u_seq:
        uuid = req.data.uuid
        if not uuid:
            return user_userLogin_en.userLoginReturn(
                error=common_type.errorRetCode(code=900, errmsg="[userLogin] Invalid parameters."),
                server_time=helper.auto_response_time(),
                mode="main",
                call="userLogin",
                data=None,
                maintenance=common_type.maintenanceData()
            )
        
        user:models.Player = models.Player.objects.filter(uuid=uuid).first()
        if user is None:
            return user_userLogin_en.userLoginReturn(
                error=common_type.errorRetCode(code=998, errmsg="Sorry. Not a registered user."),
                server_time=helper.auto_response_time(),
                mode="main",
                call="userLogin",
                data=None,
                maintenance=common_type.maintenanceData()
            )
            
        return user_userLogin_en.userLoginReturn(
                error=common_type.errorRetCode(code=0, errmsg=""),
                server_time=helper.auto_response_time(),
                mode="main",
                call="userLogin",
                data=user_userLogin_en.userLoginRetDataInfo(
                    user=user_userLogin_en.userData(
                        u_seq=user.u_seq,
                        u_id=user.u_id
                    )
                ),
                maintenance=common_type.maintenanceData()
            )
    
    user:models.Player = models.Player.objects.filter(u_seq=u_seq).first()
    if user is None:
        return user_userLogin_en.userLoginReturn(
            error=common_type.errorRetCode(code=998, errmsg="Sorry. Not a registered user."),
            server_time=helper.auto_response_time(),
            service="main",
            method="userLogin",
            data=None,
            maintenance=common_type.maintenanceData()
        )
    
    ch1_data:models.UserAreaInfo = user.areas.filter(u_area_num=1).first()
    ch2_data:models.UserAreaInfo = user.areas.filter(u_area_num=2).first()
    data = user_userLogin_en.userLoginReturn(
        error=common_type.errorRetCode(code=0, errmsg=""),
        server_time=helper.auto_response_time(),
        service="main",
        method="userLogin",
        data=user_userLogin_en.userLoginRetDataInfo(
            user=user_userLogin_en.userData(
                u_seq=user.u_seq,
                u_id=user.u_id,
                u_name=f'Player{user.u_seq}',
                u_nick=f'Player{user.u_seq}',
                u_cp=user.u_cp,
                u_candy=user.u_candy,
                u_like=0,
                u_fans=0,
                u_fans_grade=0,
                u_selected_costume_id=0,
                u_selected_music_id=0,
                u_retain_continuous_tap=0,
                u_join_type=1,
                u_last_login=(user.u_last_login if user.u_last_login else user.created_at).strftime("%Y-%m-%d %H:%M:%S"),
                u_last_communication=user.u_last_communication.strftime("%Y-%m-%d %H:%M:%S") if user.u_last_communication else "",
                u_save_date=str(helper.datetime_to_unix_sec(user.u_save_date)) if user.u_save_date else None,
                u_create_time=str(helper.datetime_to_unix_sec(user.created_at)),
                u_tutorial_step=user.u_tutorial_step,
                u_review_popup=user.u_review_popup,
                device_uuid="",
                numberOfFreeChoco=user.u_cp,
                numberOfPaidChoco=0
            ),
            area_data={
                1: user_userLogin_en.userAreaData(
                    u_area_num=1,
                    d_Candy=0,
                    d_Like=0,
                    i_UserFanCount=ch1_data.i_UserFanCount,
                    i_UserFanGrade=ch1_data.i_UserFanGrade,
                    i_SelectedCostumeId=ch1_data.i_SelectedCostumeId,
                    i_SelectedMusicId=ch1_data.i_SelectedMusicId,
                    i_SelectedGuitarId=ch1_data.i_SelectedGuitarId,
                    s_TutorialList=ch1_data.s_TutorialList,
                    s_Gp1=ch1_data.s_Gp1,
                    s_Gp1=ch1_data.s_Gp1
                ),
                2: user_userLogin_en.UserLoginResponseGeneralUserDataMap(
                    u_area_num=2,
                    d_Candy=0,
                    d_Like=0,
                    i_UserFanCount=ch2_data.i_UserFanCount,
                    i_UserFanGrade=ch2_data.i_UserFanGrade,
                    i_SelectedCostumeId=ch2_data.i_SelectedCostumeId,
                    i_SelectedMusicId=ch2_data.i_SelectedMusicId,
                    i_SelectedGuitarId=ch2_data.i_SelectedGuitarId,
                    s_TutorialList=ch2_data.s_TutorialList,
                    s_Gp1=ch2_data.s_Gp1,
                    s_Gp1=ch2_data.s_Gp1
                ),
            },
            user_contents=common_type.userContentsData(
                user_achievement=[
                    common_type.userAchievement(
                        i_id=ach.i_id,
                        i_Level=ach.level,
                        d_Quantity=ach.d_Quantity,
                        s_Quantity=ach.progress
                    ) for ach in user.achievements.all()
                ],
                user_buff=[
                    common_type.userBuff(
                        i_id = buff.i_id,
                        i_Level = buff.i_Level,
                        i_ActiveTime = buff.i_ActiveTime,
                        i_EndTime = buff.i_EndTime
                    ) for buff in user.buffs.all()
                ] if user.buffs.exists() else None,
                user_candy_shop=[
                    common_type.userCandyShop(
                        i_id=shop.i_id,
                        i_CurrentBuyCount=shop.i_CurrentBuyCount,
                        i_TotalBuyCount=shop.i_TotalBuyCount,
                        l_LastBuyTick=shop.l_LastBuyTick
                    ) for shop in user.candy_shops.all()
                ] if user.candy_shops.exists() else None,
                user_character=[
                    common_type.userCharacter(
                        i_id=char.i_id,
                        i_Level=char.i_Level,
                        i_BonusLevel=char.i_BonusLevel
                    ) for char in user.characters.all()
                ],
                user_costume=[
                    common_type.userCostume(
                        i_id=outfit.i_id,
                        i_Level=outfit.i_Level,
                        i_BonusLevel=outfit.i_BonusLevel
                    ) for outfit in user.costumes.all()
                ],
                user_daily_mission=[
                    common_type.userDailyMission(
                        i_id=mission.i_id,
                        i_Level=mission.i_Level,
                        d_Quantity=mission.d_Quantity,
                        upd_date=mission.upd_date
                    ) for mission in user.daily_missions.all()
                ],
                user_follower=[
                    common_type.userFollower(
                        i_id=char.i_id,
                        i_Level=char.i_Level,
                        i_BonusLevel=char.i_BonusLevel
                    ) for char in user.followers.all()
                ] if user.followers.exists() else None,
                user_music=[
                    common_type.userMusic(
                        i_id=song.i_id,
                        i_Level=song.i_Level,
                        i_BonusLevel=song.i_BonusLevel,
                        b_EncoreBonusAppear=song.b_EncoreBonusAppear,
                        l_EncoreBonusActivateTime=song.l_EncoreBonusActivateTime,
                        i_EncoreBonusFollowerId=song.i_EncoreBonusFollowerId,
                        i_ChThirdActiveTime=song.i_ChThirdActiveTime
                    ) for song in user.musics.all()
                ],
                user_prop=[
                    common_type.userProp(
                        i_id=item.i_id,
                        i_Level=item.i_Level
                    ) for item in user.props.all()
                ],
                user_unit=[
                    common_type.userUnit(
                        i_id=item.i_id,
                        i_Level=item.i_Level
                    ) for item in user.units.all()
                ],
                user_skill=[
                    common_type.userSkill(
                        i_id=skill.i_id,
                        i_Level=skill.i_Level,
                        b_Activate=skill.b_Activate,
                        l_ActivateOnTicks=skill.l_ActivateOnTicks,
                        l_ActivateOffTicks=skill.l_ActivateOffTicks
                    ) for skill in user.skills.all()
                ],
                user_shop=[
                    common_type.userShop(
                        i_id=shop.i_id,
                        i_Count=shop.i_Count,
                        i_TotalCount=shop.i_TotalCount,
                        i_PurchaseTime=shop.i_PurchaseTime,
                        upd_day=shop.upd_day
                    ) for shop in user.shops.all()
                ],
                user_messenger=[
                    common_type.userMessenger(
                        i_MessengerChatRoomId=msg.i_MessengerChatRoomId,
                        i_LastConfirmIndex=msg.i_LastConfirmIndex,
                        s_UnlockGroupList=msg.s_UnlockGroupList,
                        l_UpdateTimeTicks=msg.l_UpdateTimeTicks
                    ) for msg in user.messengers.all()
                ],
                user_guitar=[
                    common_type.userGuitar(
                        i_id=guitar.i_id,
                        i_Level=guitar.i_Level,
                        i_BonusLevel=guitar.i_BonusLevel
                    ) for guitar in user.guitars.all()
                ],
                user_event_point=[
                    common_type.userEventPoint(
                        s_EventType=point.s_EventType,
                        i_DataID=point.i_DataID,
                        i_Point=point.i_Point,
                        i_Step=point.i_Step,
                        i_ADViewTime=point.i_ADViewTime,
                        i_Version=point.i_Version
                    ) for point in user.event_points.all()
                ],
                user_subscribe_list=[
                    common_type.userSubscribeList(
                        i_SubscribeID=sub.i_SubscribeID,
                        i_ActiveTime=sub.i_ActiveTime,
                        i_isActive=sub.i_isActive
                    ) for sub in user.subscribe_lists.all()
                ],
                user_subscribe_pass_reward=[
                    common_type.userSubscribePassReward(
                        i_SubscribeID=reward.i_SubscribeID,
                        i_Type=reward.i_Type,
                        i_Step=reward.i_Step,
                        i_UpdateTime=reward.i_UpdateTime,
                        i_Version=reward.i_Version
                    ) for reward in user.subscribe_pass_rewards.all()  
                ],
                user_ticketcollection=[
                    common_type.userTicketCollection(
                        i_id=ticket.i_id
                    ) for ticket in user.ticket_collections.all()
                ],
                user_follower_quest=[
                    common_type.userFollowerQuest(
                        i_id=task.i_id,
                        i_CurrentID=task.i_CurrentID,
                        i_CompleteID=task.i_CompleteID,
                        d_ConditionValue1=task.d_ConditionValue1,
                        d_ConditionValue2=task.d_ConditionValue2,
                        d_ConditionValue3=task.d_ConditionValue3,
                        i_RewardReceived1=task.i_RewardReceived1,
                        i_RewardReceived2=task.i_RewardReceived2,
                        i_RewardReceived3=task.i_RewardReceived3,
                        fieldi_isInfinity10=task.i_isInfinity
                    ) for task in user.follower_quests.all()
                ],
                user_follower_profile_reward=[
                    common_type.UserFollowerProfileReward(
                        i_id=reward.i_id,
                        i_RewardLevel=reward.i_RewardLevel
                    ) for reward in user.follower_profile_rewards.all()
                ],
                user_follower_profile=[
                    common_type.UserFollowerProfile(
                        i_id=profile.i_id,
                        i_Level=profile.i_Level,
                        d_Exp=profile.d_Exp,
                        i_AddCandy=profile.i_AddCandy
                    ) for profile in user.follower_profiles.all()
                ],
                user_follower_giftitem=[
                    common_type.UserFollowerGiftItem(
                        i_id=gift.i_id,
                        i_Value=gift.i_Value,
                    ) for gift in user.follower_gift_items.all()
                ],
                user_ad_list=[
                    common_type.UserAdList(
                        i_id=ad.i_id,
                        i_Count=ad.i_Count,
                        i_TotalCount=ad.i_TotalCount,
                        i_LastViewTime=ad.i_LastViewTime
                    ) for ad in user.ad_lists.all()
                ],
                user_chthird_stage=[
                    common_type.UserChThirdStage(
                        i_id=stage.i_id,
                        i_ChapterId=stage.i_ChapterId,
                        i_StageIndex=stage.i_StageIndex,
                        i_Star=stage.i_Star
                    ) for stage in user.ch_third_stages.all()
                ],
                user_tutorial=[
                    common_type.UserTutorial(
                        i_id=tutorial.i_id
                    ) for tutorial in user.tutorials.all()
                ],
                user_ad_level=[
                    common_type.UserAdLevel(
                        i_id=ad_level.i_id,
                        i_Level=ad_level.i_Level,
                        i_EXP=ad_level.i_EXP
                    ) for ad_level in user.ad_levels.all()
                ],
                user_select_reward=[
                    common_type.UserSelectReward(
                        i_GroupId=reward.i_GroupId,
                        i_RewardGroupId=reward.i_RewardGroupId,
                        i_AltRewardGroupId=reward.i_AltRewardGroupId
                    ) for reward in user.select_rewards.all()
                ]
            )
        ),
        maintenance=common_type.maintenanceData()
    )
    
    user.u_last_login = datetime.now()
    user.save()
    return data