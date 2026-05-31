// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /user/adViewLog/en/

include "general.thrift"

namespace py tapsonic.user_adViewLog_en


struct adViewLogDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
    5: optional string ad_type,
    6: optional string ad_name,
}

struct adViewLog {
    1: optional string call,
    2: optional adViewLogDataInfo data,
    3: optional general.paramData common_data,
}

struct adViewLogRetDataInfo {
    1: optional string status,
}

struct adViewLogReturn {
    1: optional general.errorRetCode error,
    2: optional general.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional adViewLogRetDataInfo data,
    6: optional general.maintenanceData maintenance,
}

/*======================================================================
 BURP EXAMPLES FOR CALL: adViewLog
======================================================================
 Example 1:
   Request:
     {   1: {'type': 'STRING', 'value': 'adViewLog'},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 10300459},
                             2: {'type': 'STRING', 'value': '1768314252002'},
                             3: {'type': 'STRING', 'value': '431375682'},
                             4: {   'type': 'STRING',
                                    'value': 'bb06dae7594c5b50fb6a6a4b9d4bd81b'},
                             5: {'type': 'STRING', 'value': 'ad_view_complete'},
                             6: {   'type': 'STRING',
                                    'value': 'ad_profile_free_gift'}}},
         3: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 800},
                             2: {'type': 'STRING', 'value': 'real'},
                             3: {'type': 'I16', 'value': 1}}}}
   Response:
     {   1: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 0},
                             2: {'type': 'STRING', 'value': ''}}},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 1768314481},
                             2: {'type': 'I64', 'value': 20260113232801}}},
         3: {'type': 'STRING', 'value': 'user'},
         4: {'type': 'STRING', 'value': 'adViewLog'},
         5: {'type': 'STRUCT', 'value': {1: {'type': 'STRING', 'value': 'Y'}}},
         6: {'type': 'STRUCT', 'value': {}}}

======================================================================*/
