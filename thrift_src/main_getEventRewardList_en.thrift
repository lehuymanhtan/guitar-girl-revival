// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /main/getEventRewardList/en/

namespace py tapsonic.main_getEventRewardList_en

include "common.thrift"

struct getEventRewardListDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
    5: optional i32 event_idx,
}

struct getEventRewardList {
    1: optional string call,
    2: optional getEventRewardListDataInfo data,
    3: optional string sub_mode,
    4: optional common.paramData common_data,
}

struct getEventRewardListRetDataInfo {}

struct getEventRewardListReturn {
    1: optional common.errorRetCode error,
    2: optional common.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional map<i32, getEventRewardListRetDataInfo> data,
    6: optional common.maintenanceData maintenance,
}
