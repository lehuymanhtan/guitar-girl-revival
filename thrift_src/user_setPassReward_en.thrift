// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /user/setPassReward/en/

namespace py tapsonic.user_setPassReward_en

include "common.thrift"

struct setPassRewardDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
    5: optional i32 group,
    6: optional i32 step,
    7: optional i16 type,
    8: optional i32 i_Version,
}

struct setPassReward {
    1: optional string call,
    2: optional setPassRewardDataInfo data,
    3: optional common.paramData common_data,
}

struct retReward {
    1: optional i16 reward_type,
    2: optional i32 reward_id,
    3: optional i64 reward_value,
}

struct setPassRewardRetDataInfo {
    1: optional common.userSubscribePassReward subscribe_pass_reward,
    2: optional list<retReward> reward_data,
}

struct setPassRewardReturn {
    1: optional common.errorRetCode error,
    2: optional common.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional setPassRewardRetDataInfo data,
    6: optional common.maintenanceData maintenance,
}
