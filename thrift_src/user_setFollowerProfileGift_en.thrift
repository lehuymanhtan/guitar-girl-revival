// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /user/setFollowerProfileGift/en/

namespace py tapsonic.user_setFollowerProfileGift_en

include "common.thrift"

struct setFollowerProfileGiftDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
    5: optional i32 profile_id,
    6: optional i32 gift_id,
    7: optional i32 use_gitf_value,
}

struct setFollowerProfileGift {
    1: optional string call,
    2: optional setFollowerProfileGiftDataInfo data,
    3: optional common.paramData common_data,
}

struct setFollowerProfileGiftRetDataInfo {
    1: optional i32 i_gift_type,
    2: optional common.UserFollowerGiftItem user_follower_giftitem,
    3: optional common.UserFollowerProfile user_follower_profile,
}

struct setFollowerProfileGiftReturn {
    1: optional common.errorRetCode error,
    2: optional common.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional setFollowerProfileGiftRetDataInfo data,
    6: optional common.maintenanceData maintenance,
}
