// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /user/userJoin/en/

namespace py tapsonic

struct userJoinDataInfo {
    1: optional i16 os,
    2: optional i16 join_type,
    3: optional string uuid,
    4: optional string device_uuid,
    5: optional string device_token,
    6: optional string sns_id,
    7: optional string access_token,
    8: optional string country,
    9: optional string state,
}

struct paramData {
    1: optional i32 client_ver,
    2: optional string type,
    3: optional i16 os,
}

struct userJoin {
    1: optional string call,
    2: optional userJoinDataInfo data,
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

struct userJoinRetDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
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

struct userJoinReturn {
    1: optional errorRetCode error,
    2: optional serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional userJoinRetDataInfo data,
    6: optional maintenanceData maintenance,
}
