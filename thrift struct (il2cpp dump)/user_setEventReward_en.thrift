// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /user/setEventReward/en/

namespace py tapsonic

struct setEventRewardDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
    5: optional i32 event_idx,
}

struct paramData {
    1: optional i32 client_ver,
    2: optional string type,
    3: optional i16 os,
}

struct setEventReward {
    1: optional string call,
    2: optional setEventRewardDataInfo data,
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

struct retReward {
    1: optional i16 reward_type,
    2: optional i32 reward_id,
    3: optional i64 reward_value,
}

struct setEventRewardRetDataInfo {
    1: optional i64 u_cp,
    2: optional double u_candy,
    3: optional double u_like,
    4: optional i64 u_fans,
    5: optional i16 reward_type,
    6: optional i32 reward_id,
    7: optional i32 reward_value,
    8: optional string status,
    9: optional list<retReward> reward_data,
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

struct setEventRewardReturn {
    1: optional errorRetCode error,
    2: optional serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional setEventRewardRetDataInfo data,
    6: optional maintenanceData maintenance,
}
