// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /user/getChThird/en/

namespace py tapsonic.user_getChThird_en

include "common.thrift"

struct getChThirdDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
}

struct getChThird {
    1: optional string call,
    2: optional getChThirdDataInfo data,
    3: optional common.paramData common_data,
}

struct UserApData {
    1: optional i32 i_Ap,
    2: optional i32 i_FullApTime,
    3: optional i32 i_MaxAp,
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
    3: optional list<common.UserChThirdStage> user_ch_third_stage,
    4: optional list<UserChThirdChapterReward> user_ch_third_chapter_reward,
}

struct getChThirdReturn {
    1: optional common.errorRetCode error,
    2: optional common.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional getChThirdRetDataInfo data,
    6: optional common.maintenanceData maintenance,
}
