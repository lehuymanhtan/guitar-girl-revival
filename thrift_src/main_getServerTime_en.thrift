// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /main/getServerTime/en/

namespace py tapsonic.main_getServerTime_en

include "common.thrift"

struct mainDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
    5: optional string country_code,
}

struct getServerTime {
    1: optional string call,
    2: optional mainDataInfo data,
    3: optional string sub_mode,
    4: optional common.paramData common_data,
}

struct getServerTimeRetDataInfo {
    1: optional i64 time,
    2: optional i64 datetime,
}

struct getServerTimeReturn {
    1: optional common.errorRetCode error,
    2: optional common.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional getServerTimeRetDataInfo data,
    6: optional common.maintenanceData maintenance,
}
