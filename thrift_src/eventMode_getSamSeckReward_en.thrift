// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /eventMode/getSamSeckReward/en/

include "general.thrift"

namespace py tapsonic.eventMode_getSamSeckReward_en



struct getSamSeckRewardDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
    5: optional i32 i_id,
}

struct getSamSeckReward {
    1: optional string call,
    2: optional getSamSeckRewardDataInfo data,
    3: optional general.paramData common_data,
}

struct getSamSeckRewardRetDataInfo {
    1: optional i16 step,
}

struct getSamSeckRewardReturn {
    1: optional general.errorRetCode error,
    2: optional general.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional getSamSeckRewardRetDataInfo data,
    6: optional general.maintenanceData maintenance,
}

/*======================================================================
 BURP EXAMPLES FOR CALL: getSamSeckReward
======================================================================
 Example 1:
   Request:
     {   1: {'type': 'STRING', 'value': 'getSamSeckReward'},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 10300460},
                             2: {'type': 'STRING', 'value': '1768405998050'},
                             3: {'type': 'STRING', 'value': '431494216'},
                             4: {   'type': 'STRING',
                                    'value': 'bb06dae7594c5b50fb6a6a4b9d4bd81b'},
                             5: {'type': 'I32', 'value': 1}}},
         3: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 800},
                             2: {'type': 'STRING', 'value': 'real'},
                             3: {'type': 'I16', 'value': 1}}}}
   Response:
     {   1: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 0},
                             2: {'type': 'STRING', 'value': ''}}},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 1768579280},
                             2: {'type': 'I64', 'value': 20260117010120}}},
         3: {'type': 'STRING', 'value': 'eventMode'},
         4: {'type': 'STRING', 'value': 'getSamSeckReward'},
         5: {'type': 'STRUCT', 'value': {1: {'type': 'I16', 'value': 1}}},
         6: {'type': 'STRUCT', 'value': {}}}

======================================================================*/
