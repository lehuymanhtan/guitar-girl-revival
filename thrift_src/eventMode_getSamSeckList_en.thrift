// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /eventMode/getSamSeckList/en/

include "general.thrift"

namespace py tapsonic.eventMode_getSamSeckList_en


struct getSamSeckListDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
}

struct getSamSeckList {
    1: optional string call,
    2: optional getSamSeckListDataInfo data,
    3: optional general.paramData common_data,
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
    1: optional general.errorRetCode error,
    2: optional general.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional getSamSeckListRetDataInfo data,
    6: optional general.maintenanceData maintenance,
}

/*======================================================================
 BURP EXAMPLES FOR CALL: getSamSeckList
======================================================================
 Example 1:
   Request:
     {   1: {'type': 'STRING', 'value': 'getSamSeckList'},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 10300460},
                             2: {'type': 'STRING', 'value': '1768405998050'},
                             3: {'type': 'STRING', 'value': '431494216'},
                             4: {   'type': 'STRING',
                                    'value': 'bb06dae7594c5b50fb6a6a4b9d4bd81b'}}},
         3: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 800},
                             2: {'type': 'STRING', 'value': 'real'},
                             3: {'type': 'I16', 'value': 1}}}}
   Response:
     {   1: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 0},
                             2: {'type': 'STRING', 'value': ''}}},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 1768579278},
                             2: {'type': 'I64', 'value': 20260117010118}}},
         3: {'type': 'STRING', 'value': 'eventMode'},
         4: {'type': 'STRING', 'value': 'getSamSeckList'},
         5: {   'type': 'STRUCT',
                'value': {   1: {'type': 'STRING', 'value': 'samseck'},
                             2: {   'type': 'LIST',
                                    'value': [   {   1: {'type': 'I64', 'value': 1},
                                                     2: {'type': 'I32', 'value': 3},
                                                     3: {'type': 'I32', 'value': 13},
                                                     4: {   'type': 'DOUBLE',
                                                            'value': 1.0}},
                                                 {   1: {'type': 'I64', 'value': 2},
                                                     2: {'type': 'I32', 'value': 9},
                                                     3: {'type': 'I32', 'value': 10},
                                                     4: {   'type': 'DOUBLE',
                                                            'value': 1.0}},
                                                 {   1: {'type': 'I64', 'value': 3},
                                                     2: {'type': 'I32', 'value': 1},
                                                     3: {'type': 'I32', 'value': 1},
                                                     4: {   'type': 'DOUBLE',
                                                            'value': 333.0}}]}}},
         6: {'type': 'STRUCT', 'value': {}}}

======================================================================*/
