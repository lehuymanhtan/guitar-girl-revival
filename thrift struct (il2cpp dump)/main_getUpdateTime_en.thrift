// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /main/getUpdateTime/en/

namespace py tapsonic

struct getUpdateTimeDataInfo {
    1: optional string device_uuid,
}

struct paramData {
    1: optional i32 client_ver,
    2: optional string type,
    3: optional i16 os,
}

struct getUpdateTime {
    1: optional string call,
    2: optional getUpdateTimeDataInfo data,
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

struct getUpdateTimeRetDataInfo {
    1: optional i64 upd_time,
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

struct getUpdateTimeReturn {
    1: optional errorRetCode error,
    2: optional serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional getUpdateTimeRetDataInfo data,
    6: optional maintenanceData maintenance,
}
