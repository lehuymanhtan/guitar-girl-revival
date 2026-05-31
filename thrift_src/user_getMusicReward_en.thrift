// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /user/getMusicReward/en/

include "general.thrift"

namespace py tapsonic.user_getMusicReward_en



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
    3: optional general.paramData common_data,
}

struct getMusicRewardRetDataInfo {
    1: optional i32 total_reward_value,
    2: optional list<i32> reward_music_id,
    3: optional list<i32> reward_value,
    4: optional list<general.UserFollowerProfile> user_follower_profile,
    5: optional map<i32, general.errorRetCode> error_data,
}

struct getMusicRewardReturn {
    1: optional general.errorRetCode error,
    2: optional general.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional getMusicRewardRetDataInfo data,
    6: optional general.maintenanceData maintenance,
}

/*======================================================================
 BURP EXAMPLES FOR CALL: getMusicReward
======================================================================
 Example 1:
   Request:
     {   1: {'type': 'STRING', 'value': 'getMusicReward'},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 7276629},
                             2: {'type': 'STRING', 'value': '1614162043022'},
                             3: {'type': 'STRING', 'value': '315504848'},
                             4: {   'type': 'STRING',
                                    'value': '6057191819962c308248100d62e86ead'},
                             5: {'type': 'LIST', 'value': [201]},
                             6: {'type': 'LIST', 'value': [10]}}},
         3: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 800},
                             2: {'type': 'STRING', 'value': 'real'},
                             3: {'type': 'I16', 'value': 1}}}}
   Response:
     {   1: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 0},
                             2: {'type': 'STRING', 'value': ''}}},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 1767189390},
                             2: {'type': 'I64', 'value': 20251231225630}}},
         3: {'type': 'STRING', 'value': 'user'},
         4: {'type': 'STRING', 'value': 'getMusicReward'},
         5: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 12},
                             2: {'type': 'LIST', 'value': [201]},
                             3: {'type': 'LIST', 'value': [12]},
                             4: {   'type': 'LIST',
                                    'value': [   {   1: {'type': 'I32', 'value': 5},
                                                     2: {'type': 'I32', 'value': 10},
                                                     3: {   'type': 'I64',
                                                            'value': 9760},
                                                     4: {   'type': 'I32',
                                                            'value': 2}}]},
                             5: {   'type': 'MAP',
                                    'value': {   '_key_type': 'I32',
                                                 '_value_type': 'STRUCT',
                                                 'entries': {}}}}},
         6: {'type': 'STRUCT', 'value': {}}}

======================================================================*/
