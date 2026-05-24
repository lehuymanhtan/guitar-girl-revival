// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /user/completeLog/en/

namespace py tapsonic.user_completeLog_en

include "common.thrift"

struct completeLogDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
    5: optional string type,
    6: optional i32 id,
    7: optional string value,
}

struct completeLog {
    1: optional string call,
    2: optional completeLogDataInfo data,
    3: optional common.paramData common_data,
}

struct completeLogRetDataInfo {
    1: optional string status,
}

struct completeLogReturn {
    1: optional common.errorRetCode error,
    2: optional common.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional completeLogRetDataInfo data,
    6: optional common.maintenanceData maintenance,
}
