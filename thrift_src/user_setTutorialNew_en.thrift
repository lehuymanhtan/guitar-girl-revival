// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /user/setTutorialNew/en/

include "general.thrift"

namespace py tapsonic.user_setTutorialNew_en


struct setTutorialNewDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
    5: optional list<i32> i_ids,
}

struct setTutorialNew {
    1: optional string call,
    2: optional setTutorialNewDataInfo data,
    3: optional general.paramData common_data,
}

struct setTutorialNewRetDataInfo {
    1: optional i32 u_seq,
    2: optional list<general.UserTutorial> tutorial,
}

struct setTutorialNewReturn {
    1: optional general.errorRetCode error,
    2: optional general.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional setTutorialNewRetDataInfo data,
    6: optional general.maintenanceData maintenance,
}

/*======================================================================
 BURP EXAMPLES FOR CALL: setTutorialNew
======================================================================
 Example 1:
   Request:
     {   1: {'type': 'STRING', 'value': 'setTutorialNew'},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 10300460},
                             2: {'type': 'STRING', 'value': '1768405998050'},
                             3: {'type': 'STRING', 'value': '431494216'},
                             4: {   'type': 'STRING',
                                    'value': 'bb06dae7594c5b50fb6a6a4b9d4bd81b'},
                             5: {'type': 'LIST', 'value': [1, 2, 3, 4, 5, 6, 7]}}},
         3: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 800},
                             2: {'type': 'STRING', 'value': 'real'},
                             3: {'type': 'I16', 'value': 1}}}}
   Response:
     {   1: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 0},
                             2: {'type': 'STRING', 'value': ''}}},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 1768406078},
                             2: {'type': 'I64', 'value': 20260115005438}}},
         3: {'type': 'STRING', 'value': 'user'},
         4: {'type': 'STRING', 'value': 'setTutorialNew'},
         5: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 10300460},
                             2: {   'type': 'LIST',
                                    'value': [   {1: {'type': 'I32', 'value': 1}},
                                                 {1: {'type': 'I32', 'value': 2}},
                                                 {1: {'type': 'I32', 'value': 3}},
                                                 {1: {'type': 'I32', 'value': 4}},
                                                 {1: {'type': 'I32', 'value': 5}},
                                                 {1: {'type': 'I32', 'value': 6}},
                                                 {   1: {   'type': 'I32',
                                                            'value': 7}}]}}},
         6: {'type': 'STRUCT', 'value': {}}}

======================================================================*/
