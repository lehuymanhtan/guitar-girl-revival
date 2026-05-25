// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /main/getEventRewardList/en/

namespace py tapsonic

struct getEventRewardListDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
    5: optional i32 event_idx,
}

struct paramData {
    1: optional i32 client_ver,
    2: optional string type,
    3: optional i16 os,
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

struct getEventRewardList {
    1: optional string call,
    2: optional getEventRewardListDataInfo data,
    3: optional string sub_mode,
    4: optional paramData common_data,
}

struct errorRetCode {
    1: optional i32 code,
    2: optional string errmsg,
}

struct serverTimeRet {
    1: optional i32 time,
    2: optional i64 datetime,
}

struct maintenanceData {
    1: optional i16 code,
    2: optional string title,
    3: optional string description,
    4: optional i16 utc_time,
    5: optional string facebook_url,
    6: optional string start_datetime,
    7: optional string end_datetime,
}

struct getEventRewardListReturn {
    1: optional errorRetCode error,
    2: optional serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional map<i32, getEventRewardListRetDataInfo> data,
    6: optional maintenanceData maintenance,
}
