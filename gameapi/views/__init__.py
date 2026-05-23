import os
import time

from django.http import HttpRequest, HttpResponse
from gameapi import models


from general import ttypes as generalTypes
from getGameDataList import ttypes as getGameDataListTypes
from getServerTime import ttypes as getServerTimeTypes
from init import ttypes as initTypes
from userLogin import ttypes as userLoginTypes

import _helper as helper

GAME_CONFIG_DATA = None


def _userLoginGetUserId(req: userLoginTypes.UserLoginRequest):
    externalUserId = req.body.externalUserId
    if not externalUserId:
        return userLoginTypes.UserLoginResponse(
            header=generalTypes.ResponseHeader(code=900, message="[userLogin] Invalid parameters."),
            responseTime=helper.auto_response_time(),
            service="main",
            method="userLogin",
            body=None,
            footer=generalTypes.ResponseFooter()
        )
    
    user:models.Player = models.Player.objects.filter(external_user_id=externalUserId).first()
    if user is None:
        # not registered user
        return userLoginTypes.UserLoginResponse(
            header=generalTypes.ResponseHeader(code=998, message="Sorry. Not a registered user."),
            responseTime=helper.auto_response_time(),
            service="main",
            method="userLogin",
            body=None,
            footer=generalTypes.ResponseFooter()
        )
        
    return userLoginTypes.UserLoginResponse(
        header=generalTypes.ResponseHeader(code=0, message=""),
        responseTime=helper.auto_response_time(),
        service="main",
        method="userLogin",
        body=userLoginTypes.UserLoginResponseBody(
            field1=userLoginTypes.UserLoginResponseBody1(
                id=user.id,
                createdAt_unix_sec=str(int(helper.datetime_to_unix_msec(user.created_at))) #unix timestamp in miliseconds
            ),
        ),
        footer=generalTypes.ResponseFooter()
    )
@helper.wrapper_helper
def getServerTime(request: HttpRequest):
    data = getServerTimeTypes.getServerTimeResponse(
        header=generalTypes.responseHeader(code=0, message=""),
        responseTime=helper.auto_response_time(),
        service="main",
        method="getServerTime",
        body=getServerTimeTypes.getServerTimeResponseBody(
            unix_time=int(time.time()),
            local_time=int(time.strftime("%Y%m%d%H%M%S", time.localtime()))
        ),
        footer=generalTypes.responseFooter()
    )
    
    return data

@helper.wrapper_helper
def getGameDataList(request):
    global GAME_CONFIG_DATA
    if GAME_CONFIG_DATA is not None:
        return GAME_CONFIG_DATA
    obj = getGameDataListTypes.GetGameDataListResponse()
    obj.read(helper.loadRawResponse(os.path.join(os.path.dirname(__file__), "_raw", "getGameDataListResponse.txt")))
    
    
    ### Patch response here
    obj.responseTime = helper.auto_response_time()
    obj.footer = generalTypes.ResponseFooter()
    
    
    GAME_CONFIG_DATA = obj
    return GAME_CONFIG_DATA

@helper.wrapper_helper
def init(request: HttpRequest):
    data = initTypes.InitResponse(
        header=generalTypes.ResponseHeader(),
        responseTime=helper.auto_response_time(),
        service="main",
        method="init",
        body=initTypes.InitResponseBody(
            field1=253,
            gameServerBaseUrl="https://game.gtgl.pmang.cloud",
            cdnBaseUrl="https://dl.gtgl.pmang.cloud",
        ),
        footer=generalTypes.ResponseFooter()
    )
    return data

@helper.wrapper_helper
def userLogin(request: HttpRequest):
    raw_data = request.POST.get("tapsonic_data", None)
    if not raw_data:
        return HttpResponse("Bad Request", status=400)
    
    req= userLoginTypes.UserLoginRequest()
    req.read(helper.decodeToBinary(raw_data))
    
    
    user_id = user_id = req.body.id
    create_at = req.body.createdAt_unix_sec
    
    if not user_id:
        # client probably doesn't have user id yet
        return _userLoginGetUserId(req)
    
    user:models.Player = models.Player.objects.filter(id=user_id).first()
    if user is None:
        return userLoginTypes.UserLoginResponse(
            header=generalTypes.ResponseHeader(code=998, message="Sorry. Not a registered user."),
            responseTime=helper.auto_response_time(),
            service="main",
            method="userLogin",
            body=None,
            footer=generalTypes.ResponseFooter()
        )
    
    ch1_data:models.ChannelProgress = user.channel_progress.filter(channel_index=1).first()
    ch2_data:models.ChannelProgress = user.channel_progress.filter(channel_index=2).first()
    return userLoginTypes.UserLoginResponse(
        header=generalTypes.ResponseHeader(code=0, message=""),
        responseTime=helper.auto_response_time(),
        service="main",
        method="userLogin",
        body=userLoginTypes.UserLoginResponseBody(
            field1=userLoginTypes.UserLoginResponseBody1(
                id=user.id,
                createdAt_unix_sec=str(int(helper.datetime_to_unix_msec(user.created_at))), #unix timestamp in miliseconds
                nickname=user.nickname,
                nickname2=user.nickname,
                numberOfTotalChocolates=user.free_choco + user.paid_choco,
                numberOfCandys=user.candy_total,
                lastLogin_date=(user.last_login if user.last_login else user.created_at).strftime("%Y-%m-%d %H:%M:%S"),
                lastSave_date=user.last_save.strftime("%Y-%m-%d %H:%M:%S") if user.last_save else "",
                lastSave_unix_sec=str(int(helper.datetime_to_unix_sec(user.last_save))) if user.last_save else None,
                firstSave_unix_sec=str(int(helper.datetime_to_unix_sec(user.created_at))),
                clientHash=req.body.clientHash,
                numberOfFreeChoco=user.free_choco,
                numberOfPaidChoco=user.paid_choco
            ),
            generalUserData={
                1: userLoginTypes.UserLoginResponseGeneralUserDataMap(
                    index = 1,
                    noOfViews=ch1_data.views,
                    currentRankId=ch1_data.current_rank_id,
                    currentOutfitId=ch1_data.current_outfit_id,
                    currentSongId=ch1_data.current_song_id,
                    currentGuitarId=ch1_data.current_guitar_id,
                    currentNumberOfHeartsOrLike=ch1_data.hearts_or_likes_count,
                    currentNumberOfNotes=ch1_data.notes_count
                ),
                2: userLoginTypes.UserLoginResponseGeneralUserDataMap(
                    index = 2,
                    noOfViews=ch2_data.views,
                    currentRankId=ch2_data.current_rank_id,
                    currentOutfitId=ch2_data.current_outfit_id,
                    currentSongId=ch2_data.current_song_id,
                    currentGuitarId=ch2_data.current_guitar_id,
                    currentNumberOfHeartsOrLike=ch2_data.hearts_or_likes_count,
                    currentNumberOfNotes=ch2_data.notes_count
                ),
            },
            field3=userLoginTypes.UserLoginResponseBody3(
                achivements=[
                    userLoginTypes.UserAchievement(
                        achivementId=ach.achievement_id,
                        achivementLevel=ach.level,
                        achivementProgress=ach.progress
                    ) for ach in user.achievements.all()
                ],
                guitarGirlLevels=[
                    generalTypes.CharacterLevel(
                        index=char.character_index,
                        level=char.level,
                        numberOfX2=char.number_of_x2
                    ) for char in user.character_levels.filter(char_type='MAIN')
                ],
                ownedOutfits=[
                    generalTypes.Outfit(
                        outfitId=outfit.outfit_id,
                    ) for outfit in user.outfits.all()
                ],
                followerLevels=[
                    generalTypes.CharacterLevel(
                        index=char.character_index,
                        level=char.level,
                        numberOfX2=char.number_of_x2
                    ) for char in user.character_levels.filter(char_type='FOLLOWER')
                ],
                ownedSongs=[
                    generalTypes.Song(
                        songId=song.song_id,
                        songLevel=song.level,
                        gifts_boolean=1 if song.has_gift else 0,
                        lastRecivedGiftTime_unix_sec=helper.datetime_to_unix_sec(song.last_received_gift),
                        giftSenderId=song.gift_sender_id,
                        unlockTime_unix_sec=helper.datetime_to_unix_sec(song.unlock_time)
                    ) for song in user.songs.all()
                ],
                generalStoreItems=[
                    generalTypes.ItemLevel(
                        itemId=item.item_id,
                        itemLevel=item.level
                    ) for item in user.items.filter(item_type='GSI')
                ],
                guitarGirlItems=[
                    generalTypes.ItemLevel(
                        itemId=item.item_id,
                        itemLevel=item.level
                    ) for item in user.items.filter(item_type='GGI')
                ],
                guitarGirlSkillLevels=[
                    userLoginTypes.GuitarGirlSkillLevel(
                        id=skill.skill_id,
                        level=skill.level,
                        field3=0,
                        field4=0,
                        field5=0
                    ) for skill in user.skills.all()
                ],
                followerMessages=[
                    userLoginTypes.FollowerMessages(
                        messageId=msg.message_id,
                        field2=msg.field2,
                        field3=msg.field3,
                        field4=msg.field4
                    ) for msg in user.follower_messages.all()
                ],
                ownedGuitars=[
                    generalTypes.Guitar(
                        guitarId=guitar.guitar_id,
                        field2=1,
                        field3=0
                    ) for guitar in user.guitars.all()
                ],
                followerTasks=[
                    userLoginTypes.FollowerTasks(
                        #    1:  i64    id
#    2:  i64    field2
#    3:  i64    field3
#    4:  double task1Progress
#    5:  double task2Progress
#    6:  double task3Progress
#    7:  i16    task1Finished
#    8:  i16    task2Finished
#    9:  i16    task3Finished
#    10: i16    field10
                        id=task.id,
                        field2=task.field2,
                        field3=task.field3,
                        task1Progress=task.task1_progress,
                        task2Progress=task.task2_progress,
                        task3Progress=task.task3_progress,
                        task1Finished=task.task1_finished,
                        task2Finished=task.task2_finished,
                        task3Finished=task.task3_finished,
                        field10=task.field10
                    ) for task in user.follower_tasks.all()
                ],
            )
        ),
        footer=generalTypes.ResponseFooter()
    )