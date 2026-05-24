// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /user/setEventReward/en/

namespace py tapsonic.user_setEventReward_en

include "common.thrift"

struct setEventRewardDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
    5: optional i32 event_idx,
}

struct setEventReward {
    1: optional string call,
    2: optional setEventRewardDataInfo data,
    3: optional common.paramData common_data,
}

struct retReward {
    1: optional i16 reward_type,
    2: optional i32 reward_id,
    3: optional i64 reward_value,
}

struct setEventRewardRetDataInfo {
    1: optional i64 u_cp,
    2: optional double u_candy,
    3: optional double u_like,
    4: optional i64 u_fans,
    5: optional i16 reward_type,
    6: optional i32 reward_id,
    7: optional i32 reward_value,
    8: optional string status,
    9: optional list<retReward> reward_data,
}

struct setEventRewardReturn {
    1: optional common.errorRetCode error,
    2: optional common.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional setEventRewardRetDataInfo data,
    6: optional common.maintenanceData maintenance,
}
