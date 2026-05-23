// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /main/Request/en/

namespace py tapsonic

struct initDataInfo {
    1: optional string type,
    2: optional i16 os,
    3: optional i32 ver,
    4: optional string device_uuid,
}

struct paramData {
    1: optional i32 client_ver,
    2: optional string type,
    3: optional i16 os,
}

struct Request {
    1: optional string call,
    2: optional initDataInfo data,
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

struct buyCheckRetDataInfo {
    1: optional string result,
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

struct buyCheckReturn {
    1: optional errorRetCode error,
    2: optional serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional buyCheckRetDataInfo data,
    6: optional maintenanceData maintenance,
}
