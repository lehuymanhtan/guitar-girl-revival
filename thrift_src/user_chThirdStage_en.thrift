// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /user/chThirdStage/en/

namespace py tapsonic.user_chThirdStage_en

include "common.thrift"

struct chThirdStageDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
    5: optional i32 i_id,
    6: optional i32 music_id,
    7: optional string profile_ids,
}

struct chThirdStage {
    1: optional string call,
    2: optional chThirdStageDataInfo data,
    3: optional common.paramData common_data,
}

struct UserApData {
    1: optional i32 i_Ap,
    2: optional i32 i_FullApTime,
    3: optional i32 i_MaxAp,
}

struct retReward {
    1: optional i16 reward_type,
    2: optional i32 reward_id,
    3: optional i64 reward_value,
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
    9: optional common.UserChThirdStage user_ch_third_stage,
    10: optional common.userMusic user_music,
    11: optional list<retReward> reward_data,
    12: optional list<i32> bonus_follower_profile_ids,
    13: optional common.UserFollowerProfile user_follower_profile,
    14: optional i32 bonus_music_score,
    15: optional list<StageFollowerProfileScore> user_follower_profile_score,
}

struct chThirdStageReturn {
    1: optional common.errorRetCode error,
    2: optional common.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional chThirdStageRetDataInfo data,
    6: optional common.maintenanceData maintenance,
}
