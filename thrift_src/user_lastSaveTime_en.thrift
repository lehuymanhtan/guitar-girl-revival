// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /user/lastSaveTime/en/

namespace py tapsonic.user_lastSaveTime_en

include "common.thrift"

struct lastSaveTimeDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
}

struct lastSaveTime {
    1: optional string call,
    2: optional lastSaveTimeDataInfo data,
    3: optional common.paramData common_data,
}

struct lastSaveTimeRetDataInfo {
    1: optional i64 last_save_time,
    2: optional string device_uuid,
}

struct lastSaveTimeReturn {
    1: optional common.errorRetCode error,
    2: optional common.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional lastSaveTimeRetDataInfo data,
    6: optional common.maintenanceData maintenance,
}
