// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /user/setFollowerProfileGift/en/

namespace py tapsonic

struct setFollowerProfileGiftDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
    5: optional i32 profile_id,
    6: optional i32 gift_id,
    7: optional i32 use_gitf_value,
}

struct paramData {
    1: optional i32 client_ver,
    2: optional string type,
    3: optional i16 os,
}

struct setFollowerProfileGift {
    1: optional string call,
    2: optional setFollowerProfileGiftDataInfo data,
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

struct UserFollowerGiftItem {
    1: optional i32 i_id,
    2: optional i32 i_Value,
}

struct UserFollowerProfile {
    1: optional i32 i_id,
    2: optional i32 i_Level,
    3: optional i64 d_Exp,
    4: optional i32 i_AddCandy,
}

struct setFollowerProfileGiftRetDataInfo {
    1: optional i32 i_gift_type,
    2: optional UserFollowerGiftItem user_follower_giftitem,
    3: optional UserFollowerProfile user_follower_profile,
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

struct setFollowerProfileGiftReturn {
    1: optional errorRetCode error,
    2: optional serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional setFollowerProfileGiftRetDataInfo data,
    6: optional maintenanceData maintenance,
}
