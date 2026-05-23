// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /main/getServerTime/en/

namespace py tapsonic

struct mainDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
    5: optional string country_code,
}

struct paramData {
    1: optional i32 client_ver,
    2: optional string type,
    3: optional i16 os,
}

struct getServerTime {
    1: optional string call,
    2: optional mainDataInfo data,
    3: optional string sub_mode,
    4: optional paramData common_data,
}

struct errorRetCode {
    1: optional i32 code,
    2: optional string errmsg,
}

struct serverTimeRet {
    1: optional i32 time,
    2: optional i64 datetime,
}

struct getServerTimeRetDataInfo {
    1: optional i64 time,
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

struct getServerTimeReturn {
    1: optional errorRetCode error,
    2: optional serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional getServerTimeRetDataInfo data,
    6: optional maintenanceData maintenance,
}
