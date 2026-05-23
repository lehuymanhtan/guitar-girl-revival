// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /user/getMusicReward/en/

namespace py tapsonic

struct getMusicRewardDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
    5: optional list<i32> i_ids,
    6: optional list<i32> i_levels,
}

struct paramData {
    1: optional i32 client_ver,
    2: optional string type,
    3: optional i16 os,
}

struct getMusicReward {
    1: optional string call,
    2: optional getMusicRewardDataInfo data,
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

struct UserFollowerProfile {
    1: optional i32 i_id,
    2: optional i32 i_Level,
    3: optional i64 d_Exp,
    4: optional i32 i_AddCandy,
}

struct getMusicRewardRetDataInfo {
    1: optional i32 total_reward_value,
    2: optional list<i32> reward_music_id,
    3: optional list<i32> reward_value,
    4: optional list<UserFollowerProfile> user_follower_profile,
    5: optional map<i32, errorRetCode> error_data,
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

struct getMusicRewardReturn {
    1: optional errorRetCode error,
    2: optional serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional getMusicRewardRetDataInfo data,
    6: optional maintenanceData maintenance,
}
