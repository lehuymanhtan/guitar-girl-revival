// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /user/general.setGameReward/en/

include "general.thrift"

namespace py tapsonic.user_setGameReward_en



struct setGameRewardRetDataInfo {
    1: optional string type,
    2: optional i32 id,
    3: optional i16 level,
    4: optional string reward_type,
    5: optional i64 reward_value,
    6: optional string status,
    7: optional general.UserFollowerProfile user_follower_profile,
}

struct setGameRewardReturn {
    1: optional general.errorRetCode error,
    2: optional general.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional setGameRewardRetDataInfo data,
    6: optional general.maintenanceData maintenance,
}

/*======================================================================
 BURP EXAMPLES FOR CALL: setGameReward
======================================================================
 Example 1:
   Request:
     {   1: {'type': 'STRING', 'value': 'setGameReward'},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 7276629},
                             2: {'type': 'STRING', 'value': '1614162043022'},
                             3: {'type': 'STRING', 'value': '315504848'},
                             4: {   'type': 'STRING',
                                    'value': '6057191819962c308248100d62e86ead'},
                             5: {'type': 'STRING', 'value': 'daily_mission'},
                             6: {'type': 'I32', 'value': 1},
                             7: {'type': 'I16', 'value': 1},
                             9: {'type': 'STRING', 'value': '1'}}},
         3: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 800},
                             2: {'type': 'STRING', 'value': 'real'},
                             3: {'type': 'I16', 'value': 1}}}}
   Response:
     {   1: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 0},
                             2: {'type': 'STRING', 'value': ''}}},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 1767189231},
                             2: {'type': 'I64', 'value': 20251231225351}}},
         3: {'type': 'STRING', 'value': 'user'},
         4: {'type': 'STRING', 'value': 'setGameReward'},
         5: {   'type': 'STRUCT',
                'value': {   1: {'type': 'STRING', 'value': 'daily_mission'},
                             2: {'type': 'I32', 'value': 1},
                             3: {'type': 'I16', 'value': 2},
                             4: {'type': 'STRING', 'value': 'CP'},
                             5: {'type': 'I64', 'value': 10},
                             6: {'type': 'STRING', 'value': 'Y'}}},
         6: {'type': 'STRUCT', 'value': {}}}

======================================================================*/
