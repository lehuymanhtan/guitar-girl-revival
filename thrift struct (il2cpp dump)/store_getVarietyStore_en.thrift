// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /store/getVarietyStore/en/

namespace py tapsonic

struct getVarietyStoreDataInfo {
    1: optional string device_uuid,
}

struct paramData {
    1: optional i32 client_ver,
    2: optional string type,
    3: optional i16 os,
}

struct getVarietyStore {
    1: optional string call,
    2: optional getVarietyStoreDataInfo data,
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

struct getVarietyStoreRetDataInfo {
    1: optional i32 i_id,
    2: optional string s_ResourceName,
    3: optional string s_Title_KO,
    4: optional string s_Title_EN,
    5: optional string s_Title_JA,
    6: optional string s_Title_ZH_CHS,
    7: optional string s_Title_ZH_CHT,
    8: optional string s_Title_VI,
    9: optional string s_Title_ES,
    10: optional string s_Title_IT,
    11: optional string s_Title_ID,
    12: optional string s_Title_TH,
    13: optional string s_Title_PT,
    14: optional string s_Title_HI,
    15: optional string s_Description_KO,
    16: optional string s_Description_EN,
    17: optional string s_Description_JA,
    18: optional string s_Description_ZH_CHS,
    19: optional string s_Description_ZH_CHT,
    20: optional string s_Description_VI,
    21: optional string s_Description_ES,
    22: optional string s_Description_IT,
    23: optional string s_Description_ID,
    24: optional string s_Description_TH,
    25: optional string s_Description_PT,
    26: optional string s_Description_HI,
    27: optional i32 i_Cost,
    28: optional i32 i_RewardType,
    29: optional i32 i_RewardId,
    30: optional i32 i_RewardQuantity,
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

struct getVarietyStoreReturn {
    1: optional errorRetCode error,
    2: optional serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional list<getVarietyStoreRetDataInfo> data,
    6: optional maintenanceData maintenance,
}
