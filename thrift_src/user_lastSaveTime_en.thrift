// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /user/lastSaveTime/en/

include "general.thrift"

namespace py tapsonic.user_lastSaveTime_en


struct lastSaveTimeDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
}

struct lastSaveTime {
    1: optional string call,
    2: optional lastSaveTimeDataInfo data,
    3: optional general.paramData common_data,
}

struct lastSaveTimeRetDataInfo {
    1: optional i64 last_save_time,
    2: optional string device_uuid,
}

struct lastSaveTimeReturn {
    1: optional general.errorRetCode error,
    2: optional general.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional lastSaveTimeRetDataInfo data,
    6: optional general.maintenanceData maintenance,
}

/*======================================================================
 BURP EXAMPLES FOR CALL: lastSaveTime
======================================================================
 Example 1:
   Request:
     {   1: {'type': 'STRING', 'value': 'lastSaveTime'},
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
                'value': {   1: {'type': 'I32', 'value': 1767188644},
                             2: {'type': 'I64', 'value': 20251231224404}}},
         3: {'type': 'STRING', 'value': 'user'},
         4: {'type': 'STRING', 'value': 'lastSaveTime'},
         5: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I64', 'value': 1767188506},
                             2: {   'type': 'STRING',
                                    'value': '6057191819962c308248100d62e86ead'}}},
         6: {'type': 'STRUCT', 'value': {}}}

======================================================================*/
