// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /store/buyContents/en/

namespace py tapsonic

struct buyContentsDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
    5: optional string type,
    6: optional i32 idx,
}

struct paramData {
    1: optional i32 client_ver,
    2: optional string type,
    3: optional i16 os,
}

struct buyContents {
    1: optional string call,
    2: optional buyContentsDataInfo data,
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

struct userSkill {
    1: optional i64 i_id,
    2: optional i64 i_Level,
    3: optional i16 b_Activate,
    4: optional i64 l_ActivateOnTicks,
    5: optional i64 l_ActivateOffTicks,
}

struct userUnit {
    1: optional i64 i_id,
    2: optional i64 i_Level,
}

struct buyContentsRetDataInfo {
    1: optional i64 u_cp,
    2: optional double u_candy,
    3: optional userSkill user_skill,
    4: optional userUnit user_unit,
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

struct buyContentsReturn {
    1: optional errorRetCode error,
    2: optional serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional buyContentsRetDataInfo data,
    6: optional maintenanceData maintenance,
}
