// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /main/Request/en/

namespace py tapsonic.main_Request_en

include "common.thrift"

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
    3: optional common.paramData common_data,
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
//   1: common.errorRetCode   {code=0, errmsg=''}
//   2: common.serverTimeRet  {time=1768405976, datetime=20260115005256}
//   3: string         'main'
//   4: string         'init'
//   5: initRetDataInfo {idx=253, game_url='https://game.gtgl.pmang.cloud', cdn_url='https://dl.gtgl.pmang.cloud'}
//   6: common.maintenanceData {}
struct initReturn {
    1: optional common.errorRetCode error,
    2: optional common.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional initRetDataInfo data,
    6: optional common.maintenanceData maintenance,
}
