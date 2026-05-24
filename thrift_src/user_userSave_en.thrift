// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /user/userSave/en/

namespace py tapsonic.user_userSave_en

include "common.thrift"

struct saveUserInfo {
    1: optional double u_like,
    2: optional i64 u_fans,
    3: optional i16 u_fans_grade,
    4: optional i64 u_selected_costume_id,
    5: optional i64 u_selected_music_id,
}

struct saveUserAreaInfo {
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

struct saveUserAchievement {
    1: optional i64 i_id,
    2: optional double d_Quantity,
    3: optional string s_Quantity,
}

struct saveUserCharacter {
    1: optional i64 i_id,
    2: optional i64 i_Level,
    3: optional i64 i_BonusLevel,
}

struct saveUserCostume {
    1: optional i64 i_id,
    2: optional i64 i_Level,
    3: optional i64 i_BonusLevel,
}

struct saveUserDailyMission {
    1: optional i64 i_id,
    2: optional i64 d_Quantity,
}

struct saveUserFollower {
    1: optional i64 i_id,
    2: optional i64 i_Level,
    3: optional i64 i_BonusLevel,
}

struct saveUserMusic {
    1: optional i64 i_id,
    2: optional i64 i_Level,
    3: optional i64 i_BonusLevel,
    4: optional i64 b_EncoreBonusAppear,
    5: optional i64 i_EncoreBonusFollowerId,
}

struct saveUserSkill {
    1: optional i64 i_id,
    2: optional i16 b_Activate,
    3: optional i64 l_ActivateOnTicks,
    4: optional i64 l_ActivateOffTicks,
}

struct saveUserMessenger {
    1: optional i64 i_MessengerChatRoomId,
    2: optional i64 i_LastConfirmIndex,
    3: optional string s_UnlockGroupList,
    4: optional i64 l_UpdateTimeTicks,
}

struct saveUserGuitar {
    1: optional i64 i_id,
    2: optional i64 i_Level,
    3: optional i64 i_BonusLevel,
}

struct saveUserEventPoint {
    1: optional string s_EventType,
    2: optional i64 i_DataID,
    3: optional i64 i_Point,
    4: optional i64 i_Step,
    5: optional i32 i_Version,
}

struct saveUserFollowerQuest {
    1: optional i32 i_CurrentID,
    2: optional double d_ConditionValue1,
    3: optional double d_ConditionValue2,
    4: optional double d_ConditionValue3,
}

struct userSaveDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
    5: optional string type,
    6: optional list<saveUserInfo> user_info,
    7: optional list<saveUserAreaInfo> user_area_info,
    8: optional list<saveUserAchievement> user_achievement,
    9: optional list<saveUserCharacter> user_character,
    10: optional list<saveUserCostume> user_costume,
    11: optional list<saveUserDailyMission> user_daily_mission,
    12: optional list<saveUserFollower> user_follower,
    13: optional list<saveUserMusic> user_music,
    14: optional list<saveUserSkill> user_skill,
    15: optional list<saveUserMessenger> user_messenger,
    16: optional list<saveUserGuitar> user_guitar,
    17: optional list<saveUserEventPoint> user_event_point,
    18: optional list<saveUserFollowerQuest> user_follower_quest,
}

struct userSave {
    1: optional string call,
    2: optional userSaveDataInfo data,
    3: optional common.paramData common_data,
}

struct userSaveRetDataInfo {
    1: optional string status,
}

struct userSaveReturn {
    1: optional common.errorRetCode error,
    2: optional common.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional userSaveRetDataInfo data,
    6: optional common.maintenanceData maintenance,
}
