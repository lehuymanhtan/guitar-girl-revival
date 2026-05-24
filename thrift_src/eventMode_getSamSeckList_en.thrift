// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /eventMode/getSamSeckList/en/

namespace py tapsonic.eventMode_getSamSeckList_en

include "common.thrift"

struct getSamSeckListDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
}

struct getSamSeckList {
    1: optional string call,
    2: optional getSamSeckListDataInfo data,
    3: optional common.paramData common_data,
}

struct rewardListData {
    1: optional i64 i_id,
    2: optional i32 i_RewardType,
    3: optional i32 i_RewardId,
    4: optional double d_RewardQuantity,
}

struct getSamSeckListRetDataInfo {
    1: optional string event_type,
    2: optional list<rewardListData> rewardList,
}

struct getSamSeckListReturn {
    1: optional common.errorRetCode error,
    2: optional common.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional getSamSeckListRetDataInfo data,
    6: optional common.maintenanceData maintenance,
}
