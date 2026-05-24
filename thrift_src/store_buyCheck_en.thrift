// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /store/buyCheck/en/

namespace py tapsonic.store_buyCheck_en

include "common.thrift"

struct setGameRewardDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
    5: optional string type,
    6: optional i32 id,
    7: optional i16 level,
    8: optional double quantity,
    9: optional string s_quantity,
}

struct setGameReward {
    1: optional string call,
    2: optional setGameRewardDataInfo data,
    3: optional common.paramData common_data,
}

struct buyCheckRetDataInfo {
    1: optional string result,
}

struct buyCheckReturn {
    1: optional common.errorRetCode error,
    2: optional common.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional buyCheckRetDataInfo data,
    6: optional common.maintenanceData maintenance,
}
