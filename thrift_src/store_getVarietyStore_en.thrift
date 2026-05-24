// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /store/getVarietyStore/en/

namespace py tapsonic.store_getVarietyStore_en

include "common.thrift"

struct getVarietyStoreDataInfo {
    1: optional string device_uuid,
}

struct getVarietyStore {
    1: optional string call,
    2: optional getVarietyStoreDataInfo data,
    3: optional common.paramData common_data,
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

struct getVarietyStoreReturn {
    1: optional common.errorRetCode error,
    2: optional common.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional list<getVarietyStoreRetDataInfo> data,
    6: optional common.maintenanceData maintenance,
}
