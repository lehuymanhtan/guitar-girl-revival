// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /user/userLoad/en/

namespace py tapsonic.user_userLoad_en

include "common.thrift"

struct userLoadDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
    5: optional string type,
}

struct userLoad {
    1: optional string call,
    2: optional userLoadDataInfo data,
    3: optional common.paramData common_data,
}

struct userLoadRetDataInfo {
    1: optional common.userData user,
    2: optional map<i32, common.userAreaData> area_data,
    3: optional common.userContentsData user_contents,
}

struct userLoadReturn {
    1: optional common.errorRetCode error,
    2: optional common.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional userLoadRetDataInfo data,
    6: optional common.maintenanceData maintenance,
}
