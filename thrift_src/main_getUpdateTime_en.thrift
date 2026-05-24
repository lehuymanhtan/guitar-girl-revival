// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /main/getUpdateTime/en/

namespace py tapsonic.main_getUpdateTime_en

include "common.thrift"

struct getUpdateTimeDataInfo {
    1: optional string device_uuid,
}

struct getUpdateTime {
    1: optional string call,
    2: optional getUpdateTimeDataInfo data,
    3: optional common.paramData common_data,
}

struct getUpdateTimeRetDataInfo {
    1: optional i64 upd_time,
}

struct getUpdateTimeReturn {
    1: optional common.errorRetCode error,
    2: optional common.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional getUpdateTimeRetDataInfo data,
    6: optional common.maintenanceData maintenance,
}
