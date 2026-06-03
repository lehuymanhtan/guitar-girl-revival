// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /user/setPassReward/en/

include "general.thrift"

namespace py tapsonic.user_setPassReward_en


struct setPassRewardDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
    5: optional i32 group,
    6: optional i32 step,
    7: optional i16 type,
    8: optional i32 i_Version,
}

struct setPassReward {
    1: optional string call,
    2: optional setPassRewardDataInfo data,
    3: optional general.paramData common_data,
}

struct setPassRewardRetDataInfo {
    1: optional general.userSubscribePassReward subscribe_pass_reward,
    2: optional list<general.retReward> reward_data,
}

struct setPassRewardReturn {
    1: optional general.errorRetCode error,
    2: optional general.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional setPassRewardRetDataInfo data,
    6: optional general.maintenanceData maintenance,
}

/*======================================================================
 BURP EXAMPLES FOR CALL: setPassReward
======================================================================
 Example 1:
   Request:
     {   1: {'type': 'STRING', 'value': 'setPassReward'},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 7276629},
                             2: {'type': 'STRING', 'value': '1614162043022'},
                             3: {'type': 'STRING', 'value': '315504848'},
                             4: {   'type': 'STRING',
                                    'value': '6057191819962c308248100d62e86ead'},
                             5: {'type': 'I32', 'value': 5},
                             6: {'type': 'I32', 'value': 1},
                             7: {'type': 'I16', 'value': 0},
                             8: {'type': 'I32', 'value': 5}}},
         3: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 800},
                             2: {'type': 'STRING', 'value': 'real'},
                             3: {'type': 'I16', 'value': 1}}}}
   Response:
     {   1: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 0},
                             2: {'type': 'STRING', 'value': ''}}},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 1767189379},
                             2: {'type': 'I64', 'value': 20251231225619}}},
         3: {'type': 'STRING', 'value': 'user'},
         4: {'type': 'STRING', 'value': 'setPassReward'},
         5: {   'type': 'STRUCT',
                'value': {   1: {   'type': 'STRUCT',
                                    'value': {   1: {'type': 'I64', 'value': 5},
                                                 2: {'type': 'I64', 'value': 0},
                                                 3: {'type': 'I64', 'value': 1},
                                                 4: {   'type': 'I64',
                                                        'value': 1767189379},
                                                 5: {'type': 'I32', 'value': 5}}},
                             2: {   'type': 'LIST',
                                    'value': [   {   1: {'type': 'I16', 'value': 1},
                                                     2: {'type': 'I32', 'value': 4},
                                                     3: {   'type': 'DOUBLE',
                                                            'value': 1000.0}}]}}},
         6: {'type': 'STRUCT', 'value': {}}}

======================================================================*/
