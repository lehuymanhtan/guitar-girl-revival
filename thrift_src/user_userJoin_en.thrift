// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /user/userJoin/en/

include "general.thrift"

namespace py tapsonic.user_userJoin_en



struct userJoinDataInfo {
    1: optional i16 os,
    2: optional i16 join_type,
    3: optional string uuid,
    4: optional string device_uuid,
    5: optional string device_token,
    6: optional string sns_id,
    7: optional string access_token,
    8: optional string country,
    9: optional string state,
}

struct userJoin {
    1: optional string call,
    2: optional userJoinDataInfo data,
    3: optional general.paramData common_data,
}

struct userJoinRetDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
}

struct userJoinReturn {
    1: optional general.errorRetCode error,
    2: optional general.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional userJoinRetDataInfo data,
    6: optional general.maintenanceData maintenance,
}

/*======================================================================
 BURP EXAMPLES FOR CALL: userJoin
======================================================================
 Example 1:
   Request:
     {   1: {'type': 'STRING', 'value': 'userJoin'},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I16', 'value': 1},
                             2: {'type': 'I16', 'value': 1},
                             3: {'type': 'STRING', 'value': '431494216'},
                             4: {   'type': 'STRING',
                                    'value': 'bb06dae7594c5b50fb6a6a4b9d4bd81b'},
                             5: {'type': 'STRING', 'value': 'temp.temp.temp.temp'},
                             6: {'type': 'STRING', 'value': '431494216'},
                             7: {   'type': 'STRING',
                                    'value': '431494216|5014|ANDROID|KR|7e7f9b1fe8760af4acc6f04cde41c542e1cd5485|1768405985752'},
                             8: {'type': 'STRING', 'value': 'none'},
                             9: {'type': 'STRING', 'value': 'vn'}}},
         3: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 800},
                             2: {'type': 'STRING', 'value': 'real'},
                             3: {'type': 'I16', 'value': 1}}}}
   Response:
     {   1: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 0},
                             2: {'type': 'STRING', 'value': ''}}},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 1768405998},
                             2: {'type': 'I64', 'value': 20260115005318}}},
         3: {'type': 'STRING', 'value': 'user'},
         4: {'type': 'STRING', 'value': 'userJoin'},
         5: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 10300460},
                             2: {'type': 'STRING', 'value': '1768405998050'}}},
         6: {'type': 'STRUCT', 'value': {}}}

======================================================================*/
