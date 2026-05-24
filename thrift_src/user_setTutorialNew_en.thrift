// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /user/setTutorialNew/en/

namespace py tapsonic.user_setTutorialNew_en

include "common.thrift"

struct setTutorialNewDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
    5: optional list<i32> i_ids,
}

struct setTutorialNew {
    1: optional string call,
    2: optional setTutorialNewDataInfo data,
    3: optional common.paramData common_data,
}

struct setTutorialNewRetDataInfo {
    1: optional i32 u_seq,
    2: optional list<common.UserTutorial> tutorial,
}

struct setTutorialNewReturn {
    1: optional common.errorRetCode error,
    2: optional common.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional setTutorialNewRetDataInfo data,
    6: optional common.maintenanceData maintenance,
}
