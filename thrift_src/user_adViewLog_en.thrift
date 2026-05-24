// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /user/adViewLog/en/

namespace py tapsonic.user_adViewLog_en

include "common.thrift"

struct adViewLogDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
    5: optional string ad_type,
    6: optional string ad_name,
}

struct adViewLog {
    1: optional string call,
    2: optional adViewLogDataInfo data,
    3: optional common.paramData common_data,
}

struct adViewLogRetDataInfo {
    1: optional string status,
}

struct adViewLogReturn {
    1: optional common.errorRetCode error,
    2: optional common.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional adViewLogRetDataInfo data,
    6: optional common.maintenanceData maintenance,
}
