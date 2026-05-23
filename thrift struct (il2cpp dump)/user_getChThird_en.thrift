// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /user/getChThird/en/

namespace py tapsonic

struct getChThirdDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
}

struct paramData {
    1: optional i32 client_ver,
    2: optional string type,
    3: optional i16 os,
}

struct getChThird {
    1: optional string call,
    2: optional getChThirdDataInfo data,
    3: optional paramData common_data,
}

struct errorRetCode {
    1: optional i32 code,
    2: optional string errmsg,
}

struct serverTimeRet {
    1: optional i32 time,
    2: optional i64 datetime,
}

struct UserApData {
    1: optional i32 i_Ap,
    2: optional i32 i_FullApTime,
    3: optional i32 i_MaxAp,
}

struct UserChThirdStage {
    1: optional i32 i_id,
    2: optional i32 i_ChapterId,
    3: optional i32 i_StageIndex,
    4: optional i32 i_Star,
}

struct UserChThirdChapterReward {
    1: optional i32 i_id,
    2: optional i32 i_ReceivedReward1,
    3: optional i32 i_ReceivedReward2,
    4: optional i32 i_ReceivedReward3,
}

struct getChThirdRetDataInfo {
    1: optional i32 u_seq,
    2: optional UserApData user_ap,
    3: optional list<UserChThirdStage> user_ch_third_stage,
    4: optional list<UserChThirdChapterReward> user_ch_third_chapter_reward,
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

struct getChThirdReturn {
    1: optional errorRetCode error,
    2: optional serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional getChThirdRetDataInfo data,
    6: optional maintenanceData maintenance,
}
