// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /user/userJoin/en/

namespace py tapsonic.user_userJoin_en

include "common.thrift"

struct userJoinDataInfo {
    1: optional i16 os,
    2: optional i16 join_type,
    3: optional string uuid,
    4: optional string device_uuid,
    5: optional string device_token,
    6: optional string sns_id,
    7: optional string access_token,
    8: optional string country,
    9: optional string state,
}

struct userJoin {
    1: optional string call,
    2: optional userJoinDataInfo data,
    3: optional common.paramData common_data,
}

struct userJoinRetDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
}

struct userJoinReturn {
    1: optional common.errorRetCode error,
    2: optional common.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional userJoinRetDataInfo data,
    6: optional common.maintenanceData maintenance,
}
