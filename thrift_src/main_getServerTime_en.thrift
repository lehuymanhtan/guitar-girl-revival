// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /main/getServerTime/en/

include "general.thrift"

namespace py tapsonic.main_getServerTime_en


struct mainDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
    5: optional string country_code,
}

struct getServerTime {
    1: optional string call,
    2: optional mainDataInfo data,
    3: optional string sub_mode,
    4: optional general.paramData common_data,
}

struct getServerTimeRetDataInfo {
    1: optional i64 time,
    2: optional i64 datetime,
}

struct getServerTimeReturn {
    1: optional general.errorRetCode error,
    2: optional general.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional getServerTimeRetDataInfo data,
    6: optional general.maintenanceData maintenance,
}

/*======================================================================
 BURP EXAMPLES FOR CALL: getServerTime
======================================================================
 Example 1:
   Request:
     {   1: {'type': 'STRING', 'value': 'getServerTime'},
         2: {   'type': 'STRUCT',
                'value': {   4: {   'type': 'STRING',
                                    'value': '6057191819962c308248100d62e86ead'}}},
         4: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 800},
                             2: {'type': 'STRING', 'value': 'real'},
                             3: {'type': 'I16', 'value': 1}}}}
   Response:
     {   1: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 0},
                             2: {'type': 'STRING', 'value': ''}}},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 1767188497},
                             2: {'type': 'I64', 'value': 20251231224137}}},
         3: {'type': 'STRING', 'value': 'main'},
         4: {'type': 'STRING', 'value': 'getServerTime'},
         5: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I64', 'value': 1767188497},
                             2: {'type': 'I64', 'value': 20251231224137}}},
         6: {'type': 'STRUCT', 'value': {}}}

======================================================================*/
