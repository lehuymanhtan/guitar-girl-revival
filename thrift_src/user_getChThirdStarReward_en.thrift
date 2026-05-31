// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /user/getChThirdStarReward/en/

include "general.thrift"

namespace py tapsonic.user_getChThirdStarReward_en



struct getChThirdStarRewardDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
    5: optional i32 i_id,
    6: optional i32 reward_num,
}

struct getChThirdStarReward {
    1: optional string call,
    2: optional getChThirdStarRewardDataInfo data,
    3: optional general.paramData common_data,
}

struct getChThirdStarRewardRetDataInfo {
    1: optional i32 i_id,
    2: optional i32 reward_num,
    3: optional general.UserApData user_ap,
    4: optional list<general.retReward> reward_data,
}

struct getChThirdStarRewardReturn {
    1: optional general.errorRetCode error,
    2: optional general.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional getChThirdStarRewardRetDataInfo data,
    6: optional general.maintenanceData maintenance,
}

/*======================================================================
 BURP EXAMPLES FOR CALL: getChThirdStarReward
======================================================================
 Example 1:
   Request:
     {   1: {'type': 'STRING', 'value': 'getChThirdStarReward'},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 10300460},
                             2: {'type': 'STRING', 'value': '1768405998050'},
                             3: {'type': 'STRING', 'value': '431494216'},
                             4: {   'type': 'STRING',
                                    'value': 'bb06dae7594c5b50fb6a6a4b9d4bd81b'},
                             5: {'type': 'I32', 'value': 1},
                             6: {'type': 'I32', 'value': 1}}},
         3: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 800},
                             2: {'type': 'STRING', 'value': 'real'},
                             3: {'type': 'I16', 'value': 1}}}}
   Response:
     {   1: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 0},
                             2: {'type': 'STRING', 'value': ''}}},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 1769267667},
                             2: {'type': 'I64', 'value': 20260125001427}}},
         3: {'type': 'STRING', 'value': 'user'},
         4: {'type': 'STRING', 'value': 'getChThirdStarReward'},
         5: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 1},
                             2: {'type': 'I32', 'value': 1},
                             3: {   'type': 'STRUCT',
                                    'value': {   1: {'type': 'I32', 'value': 90},
                                                 2: {   'type': 'I32',
                                                        'value': 1769267657},
                                                 3: {'type': 'I32', 'value': 60}}},
                             4: {   'type': 'LIST',
                                    'value': [   {   1: {'type': 'I16', 'value': 11},
                                                     2: {'type': 'I32', 'value': 1},
                                                     3: {   'type': 'DOUBLE',
                                                            'value': 10.0}}]}}},
         6: {'type': 'STRUCT', 'value': {}}}

======================================================================*/
