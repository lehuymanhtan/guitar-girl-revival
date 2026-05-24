// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /store/buyContents/en/

namespace py tapsonic.store_buyContents_en

include "common.thrift"

struct buyContentsDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
    5: optional string type,
    6: optional i32 idx,
}

struct buyContents {
    1: optional string call,
    2: optional buyContentsDataInfo data,
    3: optional string sub_mode,
    4: optional common.paramData common_data,
}

struct buyContentsRetDataInfo {
    1: optional i64 u_cp,
    2: optional double u_candy,
    3: optional common.userSkill user_skill,
    4: optional common.userUnit user_unit,
}

struct buyContentsReturn {
    1: optional common.errorRetCode error,
    2: optional common.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional buyContentsRetDataInfo data,
    6: optional common.maintenanceData maintenance,
}
