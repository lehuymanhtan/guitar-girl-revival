// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /user/setTutorialNew/en/

namespace py tapsonic

struct setTutorialNewDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
    5: optional list<i32> i_ids,
}

struct paramData {
    1: optional i32 client_ver,
    2: optional string type,
    3: optional i16 os,
}

struct setTutorialNew {
    1: optional string call,
    2: optional setTutorialNewDataInfo data,
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

struct UserTutorial {
    1: optional i32 i_id,
}

struct setTutorialNewRetDataInfo {
    1: optional i32 u_seq,
    2: optional list<UserTutorial> tutorial,
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

struct setTutorialNewReturn {
    1: optional errorRetCode error,
    2: optional serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional setTutorialNewRetDataInfo data,
    6: optional maintenanceData maintenance,
}
