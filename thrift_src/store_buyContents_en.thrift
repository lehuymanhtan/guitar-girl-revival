// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /store/buyContents/en/

include "general.thrift"

namespace py tapsonic.store_buyContents_en


struct buyContentsDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
    5: optional string type,
    6: optional i32 idx,
}

struct buyContents {
    1: optional string call,
    2: optional buyContentsDataInfo data,
    3: optional string sub_mode,
    4: optional general.paramData common_data,
}

struct buyContentsRetDataInfo {
    1: optional i64 u_cp,
    2: optional double u_candy,
    3: optional general.userSkill user_skill,
    4: optional general.userUnit user_unit,
}

struct buyContentsReturn {
    1: optional general.errorRetCode error,
    2: optional general.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional buyContentsRetDataInfo data,
    6: optional general.maintenanceData maintenance,
}

/*======================================================================
 BURP EXAMPLES FOR CALL: buyContents
======================================================================
 Example 1:
   Request:
     {   1: {'type': 'STRING', 'value': 'buyContents'},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 10300460},
                             2: {'type': 'STRING', 'value': '1768405998050'},
                             3: {'type': 'STRING', 'value': '431494216'},
                             4: {   'type': 'STRING',
                                    'value': 'bb06dae7594c5b50fb6a6a4b9d4bd81b'},
                             5: {'type': 'STRING', 'value': 'costume'},
                             6: {'type': 'I32', 'value': 3}}},
         3: {'type': 'STRING', 'value': 'user'},
         4: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 800},
                             2: {'type': 'STRING', 'value': 'real'},
                             3: {'type': 'I16', 'value': 1}}}}
   Response:
     {   1: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 0},
                             2: {'type': 'STRING', 'value': ''}}},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 1769267454},
                             2: {'type': 'I64', 'value': 20260125001054}}},
         3: {'type': 'STRING', 'value': 'store'},
         4: {'type': 'STRING', 'value': 'buyContents'},
         5: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I64', 'value': 120},
                             2: {'type': 'DOUBLE', 'value': 130.0}}},
         6: {'type': 'STRUCT', 'value': {}}}

======================================================================*/
