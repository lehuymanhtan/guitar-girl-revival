// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /main/getUpdateTime/en/

include "general.thrift"

namespace py tapsonic.main_getUpdateTime_en



struct getUpdateTimeDataInfo {
    1: optional string device_uuid,
}

struct getUpdateTime {
    1: optional string call,
    2: optional getUpdateTimeDataInfo data,
    3: optional general.paramData common_data,
}

struct getUpdateTimeRetDataInfo {
    1: optional i64 upd_time,
}

struct getUpdateTimeReturn {
    1: optional general.errorRetCode error,
    2: optional general.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional getUpdateTimeRetDataInfo data,
    6: optional general.maintenanceData maintenance,
}

/*======================================================================
 BURP EXAMPLES FOR CALL: getUpdateTime
======================================================================
 Example 1:
   Request:
     {   1: {'type': 'STRING', 'value': 'getUpdateTime'},
         2: {   'type': 'STRUCT',
                'value': {   1: {   'type': 'STRING',
                                    'value': '6057191819962c308248100d62e86ead'}}},
         3: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 800},
                             2: {'type': 'STRING', 'value': 'real'},
                             3: {'type': 'I16', 'value': 1}}}}
   Response:
     {   1: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 0},
                             2: {'type': 'STRING', 'value': ''}}},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 1767188503},
                             2: {'type': 'I64', 'value': 20251231224143}}},
         3: {'type': 'STRING', 'value': 'main'},
         4: {'type': 'STRING', 'value': 'getUpdateTime'},
         5: {'type': 'STRUCT', 'value': {1: {'type': 'I64', 'value': 1766556032}}},
         6: {'type': 'STRUCT', 'value': {}}}

======================================================================*/
