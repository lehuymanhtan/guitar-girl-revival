// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /user/paidEventPoint/en/

namespace py tapsonic.user_paidEventPoint_en

include "common.thrift"

struct paidEventPointDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
    5: optional i16 type,
    6: optional i64 i_SubscribeID,
    7: optional i32 i_Version,
}

struct paidEventPoint {
    1: optional string call,
    2: optional paidEventPointDataInfo data,
    3: optional common.paramData common_data,
}

struct paidEventPointRetDataInfo {
    1: optional i64 u_cp,
    2: optional double u_candy,
    3: optional i64 i_SubscribeID,
    4: optional i64 i_Point,
    5: optional i32 i_Version,
}

struct paidEventPointReturn {
    1: optional common.errorRetCode error,
    2: optional common.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional paidEventPointRetDataInfo data,
    6: optional common.maintenanceData maintenance,
}
