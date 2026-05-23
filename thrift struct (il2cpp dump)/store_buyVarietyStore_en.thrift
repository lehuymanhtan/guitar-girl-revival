// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /store/buyVarietyStore/en/

namespace py tapsonic

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

struct paramData {
    1: optional i32 client_ver,
    2: optional string type,
    3: optional i16 os,
}

struct setGameReward {
    1: optional string call,
    2: optional setGameRewardDataInfo data,
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

struct buyVarietyStoreRetDataInfo {
    1: optional i64 u_cp,
    2: optional double u_candy,
    3: optional i16 reward_type,
    4: optional i32 reward_id,
    5: optional i64 reward_value,
    6: optional string status,
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

struct buyVarietyStoreReturn {
    1: optional errorRetCode error,
    2: optional serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional buyVarietyStoreRetDataInfo data,
    6: optional maintenanceData maintenance,
}
