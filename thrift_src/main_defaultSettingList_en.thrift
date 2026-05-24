// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /main/defaultSettingList/en/

namespace py tapsonic.main_defaultSettingList_en

include "common.thrift"

struct defaultSettingListDataInfo {
    1: optional string device_uuid,
    2: optional i16 os,
}

struct defaultSettingList {
    1: optional string call,
    2: optional defaultSettingListDataInfo data,
    3: optional common.paramData common_data,
}

struct defaultSettingDataList {
    1: optional string setting_key,
    2: optional string setting_value,
}

struct defaultSettingListRetDataInfo {
    1: optional string status,
    2: optional list<defaultSettingDataList> setting_list,
}

struct defaultSettingListReturn {
    1: optional common.errorRetCode error,
    2: optional common.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional defaultSettingListRetDataInfo data,
    6: optional common.maintenanceData maintenance,
}
