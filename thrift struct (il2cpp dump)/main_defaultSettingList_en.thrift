// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /main/defaultSettingList/en/

namespace py tapsonic

struct defaultSettingListDataInfo {
    1: optional string device_uuid,
    2: optional i16 os,
}

struct paramData {
    1: optional i32 client_ver,
    2: optional string type,
    3: optional i16 os,
}

struct defaultSettingList {
    1: optional string call,
    2: optional defaultSettingListDataInfo data,
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

struct defaultSettingDataList {
    1: optional string setting_key,
    2: optional string setting_value,
}

struct defaultSettingListRetDataInfo {
    1: optional string status,
    2: optional list<defaultSettingDataList> setting_list,
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

struct defaultSettingListReturn {
    1: optional errorRetCode error,
    2: optional serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional defaultSettingListRetDataInfo data,
    6: optional maintenanceData maintenance,
}
