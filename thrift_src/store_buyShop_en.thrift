// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /store/buyShop/en/

namespace py tapsonic.store_buyShop_en

include "common.thrift"

struct buyShopDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
    5: optional i32 idx,
    6: optional string developer_payload,
    7: optional string pay_id,
    8: optional string purchase_token,
    9: optional string purchase_id,
    10: optional i16 os,
    11: optional string app_id,
    12: optional string member_id,
}

struct buyShop {
    1: optional string call,
    2: optional buyShopDataInfo data,
    3: optional string sub_mode,
    4: optional common.paramData common_data,
}

struct retReward {
    1: optional i16 reward_type,
    2: optional i32 reward_id,
    3: optional i64 reward_value,
}

struct buyShopRetDataInfo {
    1: optional i64 u_cp,
    2: optional double u_candy,
    3: optional list<retReward> reward_data,
    4: optional common.UserAdLevel user_ad_level,
}

struct buyShopReturn {
    1: optional common.errorRetCode error,
    2: optional common.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional buyShopRetDataInfo data,
    6: optional common.maintenanceData maintenance,
}
