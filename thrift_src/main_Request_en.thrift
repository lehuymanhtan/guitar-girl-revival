// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /main/Request/en/

include "general.thrift"

namespace py tapsonic.main_Request_en



// ── Request ──────────────────────────────────────────────────────────────────

struct initDataInfo {
    1: optional string type,
    2: optional i16 os,
    3: optional i32 ver,
    4: optional string device_uuid,
}

struct Request {
    1: optional string call,
    2: optional initDataInfo data,
    3: optional general.paramData common_data,
}

// ── Response ─────────────────────────────────────────────────────────────────

// Field 5 of initReturn — verified from decoded response:
//   {1: I16 (253), 2: STRING (game_url), 3: STRING (cdn_url)}
struct initRetDataInfo {
    1: optional i16 idx,
    2: optional string game_url,
    3: optional string cdn_url,
}

// Decoded response structure (6 fields):
//   1: errorRetCode   {code=0, errmsg=''}
//   2: serverTimeRet  {time=1768405976, datetime=20260115005256}
//   3: string         'main'
//   4: string         'init'
//   5: initRetDataInfo {idx=253, game_url='https://game.gtgl.pmang.cloud', cdn_url='https://dl.gtgl.pmang.cloud'}
//   6: maintenanceData {}
struct initReturn {
    1: optional general.errorRetCode error,
    2: optional general.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional initRetDataInfo data,
    6: optional general.maintenanceData maintenance,
}

/*======================================================================
 BURP EXAMPLES FOR CALL: Request
======================================================================
 Example 1:
   Request:
     {   1: {'type': 'STRING', 'value': 'init'},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'STRING', 'value': 'real'},
                             2: {'type': 'I16', 'value': 1},
                             3: {'type': 'I32', 'value': 800},
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
                'value': {   1: {'type': 'I32', 'value': 1767188496},
                             2: {'type': 'I64', 'value': 20251231224136}}},
         3: {'type': 'STRING', 'value': 'main'},
         4: {'type': 'STRING', 'value': 'init'},
         5: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I16', 'value': 253},
                             2: {   'type': 'STRING',
                                    'value': 'https://game.gtgl.pmang.cloud'},
                             3: {   'type': 'STRING',
                                    'value': 'https://dl.gtgl.pmang.cloud'}}},
         6: {'type': 'STRUCT', 'value': {}}}

======================================================================*/
