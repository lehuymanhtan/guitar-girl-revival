// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /eventMode/getSamSeckReward/en/

namespace py tapsonic.eventMode_getSamSeckReward_en

include "common.thrift"

struct getSamSeckRewardDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
    5: optional i32 i_id,
}

struct getSamSeckReward {
    1: optional string call,
    2: optional getSamSeckRewardDataInfo data,
    3: optional common.paramData common_data,
}

struct getSamSeckRewardRetDataInfo {
    1: optional i16 step,
}

struct getSamSeckRewardReturn {
    1: optional common.errorRetCode error,
    2: optional common.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional getSamSeckRewardRetDataInfo data,
    6: optional common.maintenanceData maintenance,
}
