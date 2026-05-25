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

struct getEventRewardListData {
    1:  optional i64    idx
    2:  optional string event_name
    3:  optional string event_type
    4:  optional i64    reward_idx
    5:  optional i32    reward_num
    6:  optional i32    reward_type
    7:  optional i32    reward_id
    8:  optional i32    reward_value
    9:  optional string reward_flg
    10: optional i32    get_date
    11: optional string s_CustomIconType
    12: optional string s_CustomIconSprite
}

struct getEventRewardListRetDataInfo {
    1: optional list<getEventRewardListData> reward_list
    2: optional i32                          group_idx
}

struct getEventRewardListReturn {
    1: optional common.errorRetCode error,
    2: optional common.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional map<i32, getEventRewardListRetDataInfo> data,
    6: optional common.maintenanceData maintenance,
}
