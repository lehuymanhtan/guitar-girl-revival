// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /user/setAttendance/en/

include "general.thrift"

namespace py tapsonic.user_setAttendance_en



struct setAttendanceDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
    5: optional string type,
}

struct setAttendance {
    1: optional string call,
    2: optional setAttendanceDataInfo data,
    3: optional general.paramData common_data,
}

struct setAttendanceRetDataInfo {
    1: optional string status,
    2: optional general.userFollowerQuest user_follower_quest,
    3: optional i32 attendance_count,
    4: optional i32 attendance_date,
    5: optional i32 max_coutinuous_attendance_count,
}

struct setAttendanceReturn {
    1: optional general.errorRetCode error,
    2: optional general.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional setAttendanceRetDataInfo data,
    6: optional general.maintenanceData maintenance,
}

/*======================================================================
 BURP EXAMPLES FOR CALL: setAttendance
======================================================================
 Example 1:
   Request:
     {   1: {'type': 'STRING', 'value': 'setAttendance'},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 7276629},
                             2: {'type': 'STRING', 'value': '1614162043022'},
                             3: {'type': 'STRING', 'value': '315504848'},
                             4: {   'type': 'STRING',
                                    'value': '6057191819962c308248100d62e86ead'},
                             5: {'type': 'STRING', 'value': 'check'}}},
         3: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 800},
                             2: {'type': 'STRING', 'value': 'real'},
                             3: {'type': 'I16', 'value': 1}}}}
   Response:
     {   1: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 0},
                             2: {'type': 'STRING', 'value': ''}}},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 1767188516},
                             2: {'type': 'I64', 'value': 20251231224156}}},
         3: {'type': 'STRING', 'value': 'user'},
         4: {'type': 'STRING', 'value': 'setAttendance'},
         5: {   'type': 'STRUCT',
                'value': {   1: {'type': 'STRING', 'value': 'N'},
                             3: {'type': 'I32', 'value': 1},
                             4: {'type': 'I32', 'value': 1767152608},
                             5: {'type': 'I32', 'value': 2}}},
         6: {'type': 'STRUCT', 'value': {}}}

 Example 2:
   Request:
     {   1: {'type': 'STRING', 'value': 'setAttendance'},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 7276629},
                             2: {'type': 'STRING', 'value': '1614162043022'},
                             3: {'type': 'STRING', 'value': '315504848'},
                             4: {   'type': 'STRING',
                                    'value': '6057191819962c308248100d62e86ead'},
                             5: {'type': 'STRING', 'value': 'check'}}},
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
         3: {'type': 'STRING', 'value': 'user'},
         4: {'type': 'STRING', 'value': 'setAttendance'},
         5: {   'type': 'STRUCT',
                'value': {   1: {'type': 'STRING', 'value': 'Y'},
                             3: {'type': 'I32', 'value': 1},
                             4: {'type': 'I32', 'value': 1767152608},
                             5: {'type': 'I32', 'value': 2}}},
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
