// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /user/paidEventPoint/en/

include "general.thrift"

namespace py tapsonic.user_paidEventPoint_en



struct paidEventPointDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
    5: optional i16 type,
    6: optional i64 i_SubscribeID,
    7: optional i32 i_Version,
}

struct paidEventPoint {
    1: optional string call,
    2: optional paidEventPointDataInfo data,
    3: optional general.paramData common_data,
}

struct paidEventPointRetDataInfo {
    1: optional i64 u_cp,
    2: optional double u_candy,
    3: optional i64 i_SubscribeID,
    4: optional i64 i_Point,
    5: optional i32 i_Version,
}

struct paidEventPointReturn {
    1: optional general.errorRetCode error,
    2: optional general.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional paidEventPointRetDataInfo data,
    6: optional general.maintenanceData maintenance,
}

/*======================================================================
 BURP EXAMPLES FOR CALL: paidEventPoint
======================================================================
 Example 1:
   Request:
     {   1: {'type': 'STRING', 'value': 'paidEventPoint'},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 7276629},
                             2: {'type': 'STRING', 'value': '1614162043022'},
                             3: {'type': 'STRING', 'value': '315504848'},
                             4: {   'type': 'STRING',
                                    'value': '6057191819962c308248100d62e86ead'},
                             5: {'type': 'I16', 'value': 0},
                             6: {'type': 'I64', 'value': 5},
                             7: {'type': 'I32', 'value': 5}}},
         3: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 800},
                             2: {'type': 'STRING', 'value': 'real'},
                             3: {'type': 'I16', 'value': 1}}}}
   Response:
     {   1: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 0},
                             2: {'type': 'STRING', 'value': ''}}},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 1767189369},
                             2: {'type': 'I64', 'value': 20251231225609}}},
         3: {'type': 'STRING', 'value': 'user'},
         4: {'type': 'STRING', 'value': 'paidEventPoint'},
         5: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I64', 'value': 824},
                             2: {'type': 'DOUBLE', 'value': 541.0},
                             3: {'type': 'I64', 'value': 5},
                             4: {'type': 'I64', 'value': 2006},
                             5: {'type': 'I32', 'value': 5}}},
         6: {'type': 'STRUCT', 'value': {}}}

======================================================================*/
