namespace py tapsonic.common

struct paramData {
    1: optional i32 client_ver,
    2: optional string type,
    3: optional i16 os,
}
struct errorRetCode {
    1: optional i32 code,
    2: optional string errmsg,
}
struct serverTimeRet {
    1: optional i32 time,
    2: optional i64 datetime,
}
struct maintenanceData {
    1: optional i16 code,
    2: optional string title,
    3: optional string description,
    4: optional i16 utc_time,
    5: optional string facebook_url,
    6: optional string start_datetime,
    7: optional string end_datetime,
}

struct userAreaData {
    1: optional i16 u_area_num,
    2: optional double d_Like,
    3: optional i64 i_UserFanCount,
    4: optional i16 i_UserFanGrade,
    5: optional i64 i_SelectedCostumeId,
    6: optional i64 i_SelectedMusicId,
    7: optional i64 i_SelectedGuitarId,
    8: optional double d_Candy,
    9: optional string s_TutorialList,
    10: optional string s_Gp1,
    11: optional string s_Gp2,
}

struct userData {
    1: optional i64 u_seq,
    2: optional i64 u_mp,
}

struct userAchievement {
    1: optional i64 i_id,
    2: optional i64 i_Level,
    3: optional double d_Quantity,
    4: optional string s_Quantity,
}

struct userBuff {
    1: optional i64 i_id,
    2: optional i64 i_Level,
    3: optional i64 i_ActiveTime,
    4: optional i64 i_EndTime,
}

struct userCandyShop {
    1: optional i64 i_id,
    2: optional i64 i_CurrentBuyCount,
    3: optional i64 i_TotalBuyCount,
    4: optional double l_LastBuyTick,
    5: optional i64 upd_day,
}

struct userCharacter {
    1: optional i64 i_id,
    2: optional i64 i_Level,
    3: optional i64 i_BonusLevel,
}

struct userCostume {
    1: optional i64 i_id,
    2: optional i64 i_Level,
    3: optional i64 i_BonusLevel,
}

struct userDailyMission {
    1: optional i64 i_id,
    2: optional i64 i_Level,
    3: optional i64 d_Quantity,
    4: optional string upd_date,
}

struct userFollower {
    1: optional i64 i_id,
    2: optional i64 i_Level,
    3: optional i64 i_BonusLevel,
}

struct userMusic {
    1: optional i64 i_id,
    2: optional i64 i_Level,
    3: optional i64 i_BonusLevel,
    4: optional i64 b_EncoreBonusAppear,
    5: optional i64 l_EncoreBonusActivateTime,
    6: optional i64 i_EncoreBonusFollowerId,
    7: optional i64 i_ChThirdActiveTime,
}

struct userProp {
    1: optional i64 i_id,
    2: optional i64 i_Level,
}

struct userUnit {
    1: optional i64 i_id,
    2: optional i64 i_Level,
}

struct userSkill {
    1: optional i64 i_id,
    2: optional i64 i_Level,
    3: optional i16 b_Activate,
    4: optional i64 l_ActivateOnTicks,
    5: optional i64 l_ActivateOffTicks,
}

struct userShop {
    1: optional i64 i_id,
    2: optional i64 i_Count,
    3: optional i64 i_TotalCount,
    4: optional i64 i_PurchaseTime,
    5: optional i64 upd_day,
}

struct userMessenger {
    1: optional i64 i_MessengerChatRoomId,
    2: optional i64 i_LastConfirmIndex,
    3: optional string s_UnlockGroupList,
    4: optional i64 l_UpdateTimeTicks,
}

struct userGuitar {
    1: optional i64 i_id,
    2: optional i64 i_Level,
    3: optional i64 i_BonusLevel,
}

struct userEventPoint {
    1: optional string s_EventType,
    2: optional i64 i_DataID,
    3: optional i64 i_Point,
    4: optional i64 i_Step,
    5: optional i64 i_ADViewTime,
    6: optional i32 i_Version,
}

struct userSubscribeList {
    1: optional i64 i_SubscribeID,
    2: optional i64 i_ActiveTime,
    3: optional i64 i_isActive,
}

struct userSubscribePassReward {
    1: optional i64 i_SubscribeID,
    2: optional i64 i_Type,
    3: optional i64 i_Step,
    4: optional i64 i_UpdateTime,
    5: optional i32 i_Version,
}

struct userTicketCollection {
    1: optional i64 i_id,
}

struct userFollowerQuest {
    1: optional i64 i_id,
    2: optional i64 i_CurrentID,
    3: optional i64 i_CompleteID,
    4: optional double d_ConditionValue1,
    5: optional double d_ConditionValue2,
    6: optional double d_ConditionValue3,
    7: optional i16 i_RewardReceived1,
    8: optional i16 i_RewardReceived2,
    9: optional i16 i_RewardReceived3,
    10: optional i16 i_isInfinity,
}

struct UserFollowerProfileReward {
    1: optional i32 i_id,
    2: optional i32 i_RewardLevel,
}

struct UserFollowerProfile {
    1: optional i32 i_id,
    2: optional i32 i_Level,
    3: optional i64 d_Exp,
    4: optional i32 i_AddCandy,
}

struct UserFollowerGiftItem {
    1: optional i32 i_id,
    2: optional i32 i_Value,
}

struct UserAdList {
    1: optional i32 i_id,
    2: optional i32 i_Count,
    3: optional i32 i_TotalCount,
    4: optional i32 i_LastViewTime,
}

struct UserChThirdStage {
    1: optional i32 i_id,
    2: optional i32 i_ChapterId,
    3: optional i32 i_StageIndex,
    4: optional i32 i_Star,
}

struct UserTutorial {
    1: optional i32 i_id,
}

struct UserAdLevel {
    1: optional i32 i_id,
    2: optional i32 i_Level,
    3: optional i32 i_EXP,
}

struct UserSelectReward {
    1: optional i32 i_GroupId,
    2: optional i32 i_RewardGroupId,
    3: optional i32 i_AltRewardGroupId,
}

struct userContentsData {
    1: optional list<userAchievement> user_achievement,
    2: optional list<userBuff> user_buff,
    3: optional list<userCandyShop> user_candy_shop,
    4: optional list<userCharacter> user_character,
    5: optional list<userCostume> user_costume,
    6: optional list<userDailyMission> user_daily_mission,
    7: optional list<userFollower> user_follower,
    8: optional list<userMusic> user_music,
    9: optional list<userProp> user_prop,
    10: optional list<userUnit> user_unit,
    11: optional list<userSkill> user_skill,
    12: optional list<userShop> user_shop,
    13: optional list<userMessenger> user_messenger,
    14: optional list<userGuitar> user_guitar,
    15: optional list<userEventPoint> user_event_point,
    16: optional list<userSubscribeList> user_subscribe_list,
    17: optional list<userSubscribePassReward> user_subscribe_pass_reward,
    18: optional list<userTicketCollection> user_ticketcollection,
    19: optional list<userFollowerQuest> user_follower_quest,
    20: optional list<UserFollowerProfileReward> user_follower_profile_reward,
    21: optional list<UserFollowerProfile> user_follower_profile,
    22: optional list<UserFollowerGiftItem> user_follower_giftitem,
    23: optional list<UserAdList> user_ad_list,
    24: optional list<UserChThirdStage> user_chthird_stage,
    25: optional list<UserTutorial> user_tutorial,
    26: optional list<UserAdLevel> user_ad_level,
    27: optional list<UserSelectReward> user_select_reward,
}
