// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /user/completeLog/en/

include "general.thrift"

namespace py tapsonic.user_completeLog_en


struct completeLogDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
    5: optional string type,
    6: optional i32 id,
    7: optional string value,
}

struct completeLog {
    1: optional string call,
    2: optional completeLogDataInfo data,
    3: optional general.paramData common_data,
}

struct completeLogRetDataInfo {
    1: optional string status,
}

struct completeLogReturn {
    1: optional general.errorRetCode error,
    2: optional general.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional completeLogRetDataInfo data,
    6: optional general.maintenanceData maintenance,
}

/*======================================================================
 BURP EXAMPLES FOR CALL: completeLog
======================================================================
 Example 1:
   Request:
     {   1: {'type': 'STRING', 'value': 'completeLog'},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 7276629},
                             2: {'type': 'STRING', 'value': '1614162043022'},
                             3: {'type': 'STRING', 'value': '315504848'},
                             4: {   'type': 'STRING',
                                    'value': '6057191819962c308248100d62e86ead'},
                             5: {'type': 'STRING', 'value': 'BuyShop'},
                             6: {'type': 'I32', 'value': 20},
                             7: {   'type': 'STRING',
                                    'value': 'start_ / Type : 1 Id : 7 Value : '
                                             '20000 [ Heart Result : 887.629Y ]  / '
                                             'Limit Achievement Quantity Count : '
                                             '0_end'}}},
         3: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 800},
                             2: {'type': 'STRING', 'value': 'real'},
                             3: {'type': 'I16', 'value': 1}}}}
   Response:
     {   1: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 0},
                             2: {'type': 'STRING', 'value': ''}}},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 1767189408},
                             2: {'type': 'I64', 'value': 20251231225648}}},
         3: {'type': 'STRING', 'value': 'user'},
         4: {'type': 'STRING', 'value': 'completeLog'},
         5: {'type': 'STRUCT', 'value': {1: {'type': 'STRING', 'value': 'Y'}}},
         6: {'type': 'STRUCT', 'value': {}}}

======================================================================*/
