// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /user/setAdReward/en/

include "general.thrift"

namespace py tapsonic.user_setAdReward_en


struct setAdRewardDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
    5: optional i32 i_id,
    6: optional string param1,
    7: optional string param2,
    8: optional string param3,
}

struct setAdReward {
    1: optional string call,
    2: optional setAdRewardDataInfo data,
    3: optional general.paramData common_data,
}

struct setAdRewardRetDataInfo {
    1: optional i32 i_id,
    2: optional general.UserAdList user_ad_list,
    3: optional list<general.retReward> reward_data,
    4: optional general.UserFollowerProfile user_follower_profile,
}

struct setAdRewardReturn {
    1: optional general.errorRetCode error,
    2: optional general.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional setAdRewardRetDataInfo data,
    6: optional general.maintenanceData maintenance,
}

/*======================================================================
 BURP EXAMPLES FOR CALL: setAdReward
======================================================================
 Example 1:
   Request:
     {   1: {'type': 'STRING', 'value': 'setAdReward'},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 10300459},
                             2: {'type': 'STRING', 'value': '1768314252002'},
                             3: {'type': 'STRING', 'value': '431375682'},
                             4: {   'type': 'STRING',
                                    'value': 'bb06dae7594c5b50fb6a6a4b9d4bd81b'},
                             5: {'type': 'I32', 'value': 1},
                             6: {'type': 'STRING', 'value': '1'},
                             7: {'type': 'STRING', 'value': ''},
                             8: {'type': 'STRING', 'value': ''}}},
         3: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 800},
                             2: {'type': 'STRING', 'value': 'real'},
                             3: {'type': 'I16', 'value': 1}}}}
   Response:
     {   1: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 0},
                             2: {'type': 'STRING', 'value': ''}}},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 1768314482},
                             2: {'type': 'I64', 'value': 20260113232802}}},
         3: {'type': 'STRING', 'value': 'user'},
         4: {'type': 'STRING', 'value': 'setAdReward'},
         5: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 1},
                             2: {   'type': 'STRUCT',
                                    'value': {   1: {'type': 'I32', 'value': 1},
                                                 2: {'type': 'I32', 'value': 1},
                                                 4: {   'type': 'I32',
                                                        'value': 1768314482}}},
                             4: {   'type': 'STRUCT',
                                    'value': {   1: {'type': 'I32', 'value': 1},
                                                 2: {'type': 'I32', 'value': 2},
                                                 3: {   'type': 'I64',
                                                        'value': 100}}}}},
         6: {'type': 'STRUCT', 'value': {}}}

======================================================================*/
