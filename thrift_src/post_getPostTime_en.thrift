// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /post/getPostTime/en/

include "general.thrift"

namespace py tapsonic.post_getPostTime_en


struct getPostTimeDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
}

struct getPostTime {
    1: optional string call,
    2: optional getPostTimeDataInfo data,
    3: optional general.paramData common_data,
}

struct getPostTimeRetDataInfo {
    1: optional i64 time,
}

struct getPostTimeReturn {
    1: optional general.errorRetCode error,
    2: optional general.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional getPostTimeRetDataInfo data,
    6: optional general.maintenanceData maintenance,
}

/*======================================================================
 BURP EXAMPLES FOR CALL: getPostTime
======================================================================
 Example 1:
   Request:
     {   1: {'type': 'STRING', 'value': 'getPostTime'},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 7276629},
                             2: {'type': 'STRING', 'value': '1614162043022'},
                             3: {'type': 'STRING', 'value': '315504848'},
                             4: {   'type': 'STRING',
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
                'value': {   1: {'type': 'I32', 'value': 1767188517},
                             2: {'type': 'I64', 'value': 20251231224157}}},
         3: {'type': 'STRING', 'value': 'post'},
         4: {'type': 'STRING', 'value': 'getPostTime'},
         5: {'type': 'STRUCT', 'value': {1: {'type': 'I64', 'value': 0}}},
         6: {'type': 'STRUCT', 'value': {}}}

 Example 2:
   Request:
     {   1: {'type': 'STRING', 'value': 'getPostTime'},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 7276629},
                             2: {'type': 'STRING', 'value': '1614162043022'},
                             3: {'type': 'STRING', 'value': '315504848'},
                             4: {   'type': 'STRING',
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
                'value': {   1: {'type': 'I32', 'value': 1767240221},
                             2: {'type': 'I64', 'value': 20260101130341}}},
         3: {'type': 'STRING', 'value': 'post'},
         4: {'type': 'STRING', 'value': 'getPostTime'},
         5: {'type': 'STRUCT', 'value': {1: {'type': 'I64', 'value': 0}}},
         6: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I16', 'value': 1},
                             2: {'type': 'STRING', 'value': 'OFF-AIR'},
                             3: {   'type': 'STRING',
                                    'value': 'Thank you for being with Guitar '
                                             'Girl.'},
                             4: {'type': 'I16', 'value': 9},
                             5: {'type': 'STRING', 'value': ''},
                             6: {'type': 'STRING', 'value': '2026-01-01 00:05'},
                             7: {'type': 'STRING', 'value': '2034-12-31 14:46'}}}}

======================================================================*/
