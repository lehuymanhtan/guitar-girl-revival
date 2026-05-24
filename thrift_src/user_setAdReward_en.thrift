// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /user/setAdReward/en/

namespace py tapsonic.user_setAdReward_en

include "common.thrift"

struct setAdRewardDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
    5: optional i32 i_id,
    6: optional string param1,
    7: optional string param2,
    8: optional string param3,
}

struct setAdReward {
    1: optional string call,
    2: optional setAdRewardDataInfo data,
    3: optional common.paramData common_data,
}

struct retReward {
    1: optional i16 reward_type,
    2: optional i32 reward_id,
    3: optional i64 reward_value,
}

struct setAdRewardRetDataInfo {
    1: optional i32 i_id,
    2: optional common.UserAdList user_ad_list,
    3: optional list<retReward> reward_data,
    4: optional common.UserFollowerProfile user_follower_profile,
}

struct setAdRewardReturn {
    1: optional common.errorRetCode error,
    2: optional common.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional setAdRewardRetDataInfo data,
    6: optional common.maintenanceData maintenance,
}
