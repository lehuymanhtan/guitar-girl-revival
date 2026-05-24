// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /user/getMusicReward/en/

namespace py tapsonic.user_getMusicReward_en

include "common.thrift"

struct getMusicRewardDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
    5: optional list<i32> i_ids,
    6: optional list<i32> i_levels,
}

struct getMusicReward {
    1: optional string call,
    2: optional getMusicRewardDataInfo data,
    3: optional common.paramData common_data,
}

struct getMusicRewardRetDataInfo {
    1: optional i32 total_reward_value,
    2: optional list<i32> reward_music_id,
    3: optional list<i32> reward_value,
    4: optional list<common.UserFollowerProfile> user_follower_profile,
    5: optional map<i32, common.errorRetCode> error_data,
}

struct getMusicRewardReturn {
    1: optional common.errorRetCode error,
    2: optional common.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional getMusicRewardRetDataInfo data,
    6: optional common.maintenanceData maintenance,
}
