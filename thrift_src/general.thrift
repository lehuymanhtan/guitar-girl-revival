// Auto-generated: shared structs extracted from all endpoint thrift files.
// Include this file in every endpoint .thrift that needs these types.
//
//   include "general.thrift"
//
// Then reference types as-is (same namespace).

namespace py tapsonic.general


// ────────────────────────────────────────────────────────────────────
// Universal infrastructure (every endpoint)
// ────────────────────────────────────────────────────────────────────

struct errorRetCode {
    1: optional i32    code,
    2: optional string errmsg,
}

struct serverTimeRet {
    1: optional i32 time,
    2: optional i64 datetime,
}

struct maintenanceData {
    1: optional i16    code,
    2: optional string title,
    3: optional string description,
    4: optional i16    utc_time,
    5: optional string facebook_url,
    6: optional string start_datetime,
    7: optional string end_datetime,
}

struct paramData {
    1: optional i32    client_ver,
    2: optional string type,
    3: optional i16    os,
}


// ────────────────────────────────────────────────────────────────────
// Shared reward types
// ────────────────────────────────────────────────────────────────────

struct retReward {
    1: optional i16 reward_type,
    2: optional i32 reward_id,
    3: optional i64 reward_value,
}

struct buyCheckRetDataInfo {
    1: optional i64 result,
}

struct buyCheckReturn {
    1: optional errorRetCode error,
    2: optional serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional buyCheckRetDataInfo data,
    6: optional maintenanceData maintenance,
}


// ────────────────────────────────────────────────────────────────────
// setGameReward request types (reused by buyCheck / getPostTime)
// ────────────────────────────────────────────────────────────────────

struct setGameRewardDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
    5: optional string type,
    6: optional i32 id,
    7: optional i16 level,
    8: optional double quantity,
    9: optional string s_quantity,
}

struct setGameReward {
    1: optional string call,
    2: optional setGameRewardDataInfo data,
    3: optional paramData common_data,
}


// ────────────────────────────────────────────────────────────────────
// User data structs (userLoad / userLogin and others)
// ────────────────────────────────────────────────────────────────────

struct userData {
    1:  optional i32    u_seq,
    2:  optional string u_id,
    3:  optional string u_name,
    4:  optional string u_nick,
    5:  optional i64    u_cp,
    6:  optional double u_candy,
    7:  optional double u_like,
    8:  optional i64    u_fans,
    9:  optional i16    u_fans_grade,
    10: optional i64    u_selected_costume_id,
    11: optional i64    u_selected_music_id,
    12: optional i16    u_retain_continuous_tap,
    13: optional i16    u_join_type,
    14: optional string u_last_login,
    15: optional string u_last_communication,
    16: optional string u_save_date,
    17: optional string u_create_time,
    18: optional i16    u_tutorial_step,
    19: optional string u_review_popup,
    20: optional string device_uuid,
    21: optional i16    u_samseck_step,
    22: optional i64    u_free_cp,
    23: optional i64    u_charge_cp,
}

struct userAreaData {
    1:  optional i16    u_area_num,
    2:  optional double d_Candy,
    3:  optional double d_Like,
    4:  optional i64    i_UserFanCount,
    5:  optional i16    i_UserFanGrade,
    6:  optional i64    i_SelectedCostumeId,
    7:  optional i64    i_SelectedMusicId,
    8:  optional i64    i_SelectedGuitarId,
    9:  optional string s_TutorialList,
    10: optional string s_Gp1,
    11: optional string s_Gp2,
}

struct userAchievement {
    1: optional i64    i_id,
    2: optional i64    i_Level,
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
    1: optional i64    i_id,
    2: optional i64    i_CurrentBuyCount,
    3: optional i64    i_TotalBuyCount,
    4: optional double l_LastBuyTick,
    5: optional i64    upd_day,
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
    1: optional i64    i_id,
    2: optional i64    i_Level,
    3: optional i64    d_Quantity,
    4: optional string upd_date,
}

struct userFollower {
    1: optional i64 i_id,
    2: optional i64 i_Level,
    3: optional i64 i_BonusLevel,
}

struct userProp {
    1: optional i64 i_id,
    2: optional i64 i_Level,
}

struct userShop {
    1: optional i64 i_id,
    2: optional i64 i_Count,
    3: optional i64 i_TotalCount,
    4: optional i64 i_PurchaseTime,
    5: optional i64 upd_day,
}

struct userMessenger {
    1: optional i64    i_MessengerChatRoomId,
    2: optional i64    i_LastConfirmIndex,
    3: optional string s_UnlockGroupList,
    4: optional i64    l_UpdateTimeTicks,
}

struct userGuitar {
    1: optional i64 i_id,
    2: optional i64 i_Level,
    3: optional i64 i_BonusLevel,
}

struct userEventPoint {
    1: optional string s_EventType,
    2: optional i64    i_DataID,
    3: optional i64    i_Point,
    4: optional i64    i_Step,
    5: optional i64    i_ADViewTime,
    6: optional i32    i_Version,
}

struct userSubscribeList {
    1: optional i64 i_SubscribeID,
    2: optional i64 i_ActiveTime,
    3: optional i64 i_isActive,
}

struct userTicketCollection {
    1: optional i64 i_id,
}

struct userContentsData {
    1:  optional list<userAchievement>           user_achievement,
    2:  optional list<userBuff>                  user_buff,
    3:  optional list<userCandyShop>             user_candy_shop,
    4:  optional list<userCharacter>             user_character,
    5:  optional list<userCostume>               user_costume,
    6:  optional list<userDailyMission>          user_daily_mission,
    7:  optional list<userFollower>              user_follower,
    8:  optional list<userMusic>                 user_music,
    9:  optional list<userProp>                  user_prop,
    10: optional list<userUnit>                  user_unit,
    11: optional list<userSkill>                 user_skill,
    12: optional list<userShop>                  user_shop,
    13: optional list<userMessenger>             user_messenger,
    14: optional list<userGuitar>                user_guitar,
    15: optional list<userEventPoint>            user_event_point,
    16: optional list<userSubscribeList>         user_subscribe_list,
    17: optional list<userSubscribePassReward>   user_subscribe_pass_reward,
    18: optional list<userTicketCollection>      user_ticketcollection,
    19: optional list<userFollowerQuest>         user_follower_quest,
    20: optional list<UserFollowerProfileReward> user_follower_profile_reward,
    21: optional list<UserFollowerProfile>       user_follower_profile,
    22: optional list<UserFollowerGiftItem>      user_follower_giftitem,
    23: optional list<UserAdList>                user_ad_list,
    24: optional list<UserChThirdStage>          user_chthird_stage,
    25: optional list<UserTutorial>              user_tutorial,
    26: optional list<UserAdLevel>               user_ad_level,
    27: optional list<UserSelectReward>          user_select_reward,
}

struct UserChThirdStage {
    1: optional i32 i_id,
    2: optional i32 i_ChapterId,
    3: optional i32 i_StageIndex,
    4: optional i32 i_Star,
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

struct userSkill {
    1: optional i64 i_id,
    2: optional i64 i_Level,
    3: optional i16 b_Activate,
    4: optional i64 l_ActivateOnTicks,
    5: optional i64 l_ActivateOffTicks,
}

struct userUnit {
    1: optional i64 i_id,
    2: optional i64 i_Level,
}

struct UserAdList {
    1: optional i32 i_id,
    2: optional i32 i_Count,
    3: optional i32 i_TotalCount,
    4: optional i32 i_LastViewTime,
}

struct UserAdLevel {
    1: optional i32 i_id,
    2: optional i32 i_Level,
    3: optional i32 i_EXP,
}

struct userFollowerQuest {
    1:  optional i64    i_id,
    2:  optional i64    i_CurrentID,
    3:  optional i64    i_CompleteID,
    4:  optional double d_ConditionValue1,
    5:  optional double d_ConditionValue2,
    6:  optional double d_ConditionValue3,
    7:  optional i16    i_RewardReceived1,
    8:  optional i16    i_RewardReceived2,
    9:  optional i16    i_RewardReceived3,
    10: optional i16    i_isInfinity,
}

struct UserFollowerGiftItem {
    1: optional i32 i_id,
    2: optional i32 i_Value,
}

struct userSubscribePassReward {
    1: optional i64 i_SubscribeID,
    2: optional i64 i_Type,
    3: optional i64 i_Step,
    4: optional i64 i_UpdateTime,
    5: optional i32 i_Version,
}

struct UserTutorial {
    1: optional i32 i_id,
}

struct UserFollowerProfile {
    1: optional i32 i_id,
    2: optional i32 i_Level,
    3: optional i64 d_Exp,
    4: optional i32 i_AddCandy,
}

struct UserFollowerProfileReward {
    1: optional i32 i_id,
    2: optional i32 i_RewardLevel,
}

struct UserSelectReward {
    1: optional i32 i_GroupId,
    2: optional i32 i_RewardGroupId,
    3: optional i32 i_AltRewardGroupId,
}

struct UserApData {
    1: optional i32 i_Ap,
    2: optional i32 i_FullApTime,
    3: optional i32 i_MaxAp,
}

