// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /user/setUserFollowerProfileReward/en/

include "general.thrift"

namespace py tapsonic.user_setUserFollowerProfileReward_en



struct setUserFollowerProfileRewardDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
    5: optional i32 i_id,
    6: optional string s_level,
}

struct setUserFollowerProfileReward {
    1: optional string call,
    2: optional setUserFollowerProfileRewardDataInfo data,
    3: optional general.paramData common_data,
}

struct setUserFollowerProfileRewardRetDataInfo {
    1: optional i32 i_id,
    2: optional i32 i_level,
    3: optional list<general.retReward> reward_data,
    4: optional general.UserFollowerProfile user_follower_profile,
}

struct setUserFollowerProfileRewardReturn {
    1: optional general.errorRetCode error,
    2: optional general.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional list<setUserFollowerProfileRewardRetDataInfo> data,
    6: optional general.maintenanceData maintenance,
}

/*======================================================================
 BURP EXAMPLES FOR CALL: setUserFollowerProfileReward
======================================================================
 Example 1:
   Request:
     {   1: {'type': 'STRING', 'value': 'setUserFollowerProfileReward'},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 10300460},
                             2: {'type': 'STRING', 'value': '1768405998050'},
                             3: {'type': 'STRING', 'value': '431494216'},
                             4: {   'type': 'STRING',
                                    'value': 'bb06dae7594c5b50fb6a6a4b9d4bd81b'},
                             5: {'type': 'I32', 'value': 100000},
                             6: {'type': 'STRING', 'value': '1'}}},
         3: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 800},
                             2: {'type': 'STRING', 'value': 'real'},
                             3: {'type': 'I16', 'value': 1}}}}
   Response:
     {   1: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 0},
                             2: {'type': 'STRING', 'value': ''}}},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 1768406122},
                             2: {'type': 'I64', 'value': 20260115005522}}},
         3: {'type': 'STRING', 'value': 'user'},
         4: {'type': 'STRING', 'value': 'setUserFollowerProfileReward'},
         5: {   'type': 'LIST',
                'value': [   {   1: {'type': 'I32', 'value': 100000},
                                 2: {'type': 'I32', 'value': 1},
                                 3: {   'type': 'LIST',
                                        'value': [   {   1: {   'type': 'I16',
                                                                'value': 1},
                                                         2: {   'type': 'I32',
                                                                'value': 1},
                                                         3: {   'type': 'DOUBLE',
                                                                'value': 5.0}}]},
                                 4: {   'type': 'STRUCT',
                                        'value': {   1: {   'type': 'I32',
                                                            'value': 100000},
                                                     2: {'type': 'I32', 'value': 1},
                                                     4: {   'type': 'I32',
                                                            'value': 0}}}}]},
         6: {'type': 'STRUCT', 'value': {}}}

 Example 2:
   Request:
     {   1: {'type': 'STRING', 'value': 'setUserFollowerProfileReward'},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 10300460},
                             2: {'type': 'STRING', 'value': '1768405998050'},
                             3: {'type': 'STRING', 'value': '431494216'},
                             4: {   'type': 'STRING',
                                    'value': 'bb06dae7594c5b50fb6a6a4b9d4bd81b'},
                             5: {'type': 'I32', 'value': 100000},
                             6: {'type': 'STRING', 'value': '2'}}},
         3: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 800},
                             2: {'type': 'STRING', 'value': 'real'},
                             3: {'type': 'I16', 'value': 1}}}}
   Response:
     {   1: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 0},
                             2: {'type': 'STRING', 'value': ''}}},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 1769267396},
                             2: {'type': 'I64', 'value': 20260125000956}}},
         3: {'type': 'STRING', 'value': 'user'},
         4: {'type': 'STRING', 'value': 'setUserFollowerProfileReward'},
         5: {   'type': 'LIST',
                'value': [   {   1: {'type': 'I32', 'value': 100000},
                                 2: {'type': 'I32', 'value': 2},
                                 3: {   'type': 'LIST',
                                        'value': [   {   1: {   'type': 'I16',
                                                                'value': 1},
                                                         2: {   'type': 'I32',
                                                                'value': 1},
                                                         3: {   'type': 'DOUBLE',
                                                                'value': 10.0}}]},
                                 4: {   'type': 'STRUCT',
                                        'value': {   1: {   'type': 'I32',
                                                            'value': 100000},
                                                     2: {'type': 'I32', 'value': 2},
                                                     3: {   'type': 'I64',
                                                            'value': 180},
                                                     4: {   'type': 'I32',
                                                            'value': 0}}}}]},
         6: {'type': 'STRUCT', 'value': {}}}

======================================================================*/
