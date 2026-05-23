// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /user/chThirdStage/en/

namespace py tapsonic

struct chThirdStageDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
    5: optional i32 i_id,
    6: optional i32 music_id,
    7: optional string profile_ids,
}

struct paramData {
    1: optional i32 client_ver,
    2: optional string type,
    3: optional i16 os,
}

struct chThirdStage {
    1: optional string call,
    2: optional chThirdStageDataInfo data,
    3: optional paramData common_data,
}

struct errorRetCode {
    1: optional i32 code,
    2: optional string errmsg,
}

struct serverTimeRet {
    1: optional i32 time,
    2: optional i64 datetime,
}

struct UserApData {
    1: optional i32 i_Ap,
    2: optional i32 i_FullApTime,
    3: optional i32 i_MaxAp,
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

struct retReward {
    1: optional i16 reward_type,
    2: optional i32 reward_id,
    3: optional i64 reward_value,
}

struct UserFollowerProfile {
    1: optional i32 i_id,
    2: optional i32 i_Level,
    3: optional i64 d_Exp,
    4: optional i32 i_AddCandy,
}

struct StageFollowerProfileScore {
    1: optional i32 i_id,
    2: optional i32 score,
    3: optional i32 bonus_score,
}

struct chThirdStageRetDataInfo {
    1: optional i32 star,
    2: optional i32 character_score,
    3: optional i32 music_score,
    4: optional i32 follower_profile_score,
    5: optional i32 bonus_score,
    6: optional i64 total_score,
    7: optional i32 clear,
    8: optional UserApData user_ap,
    9: optional UserChThirdStage user_ch_third_stage,
    10: optional userMusic user_music,
    11: optional list<retReward> reward_data,
    12: optional list<i32> bonus_follower_profile_ids,
    13: optional UserFollowerProfile user_follower_profile,
    14: optional i32 bonus_music_score,
    15: optional list<StageFollowerProfileScore> user_follower_profile_score,
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

struct chThirdStageReturn {
    1: optional errorRetCode error,
    2: optional serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional chThirdStageRetDataInfo data,
    6: optional maintenanceData maintenance,
}
