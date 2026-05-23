// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /store/buyShop/en/

namespace py tapsonic

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

struct paramData {
    1: optional i32 client_ver,
    2: optional string type,
    3: optional i16 os,
}

struct buyShop {
    1: optional string call,
    2: optional buyShopDataInfo data,
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

struct retReward {
    1: optional i16 reward_type,
    2: optional i32 reward_id,
    3: optional i64 reward_value,
}

struct UserAdLevel {
    1: optional i32 i_id,
    2: optional i32 i_Level,
    3: optional i32 i_EXP,
}

struct buyShopRetDataInfo {
    1: optional i64 u_cp,
    2: optional double u_candy,
    3: optional list<retReward> reward_data,
    4: optional UserAdLevel user_ad_level,
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

struct buyShopReturn {
    1: optional errorRetCode error,
    2: optional serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional buyShopRetDataInfo data,
    6: optional maintenanceData maintenance,
}
