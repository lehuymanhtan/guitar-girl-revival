// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /main/Request/en/

namespace py tapsonic

// ── Request ──────────────────────────────────────────────────────────────────

struct initDataInfo {
    1: optional string type,
    2: optional i16 os,
    3: optional i32 ver,
    4: optional string device_uuid,
}

struct paramData {
    1: optional i32 client_ver,
    2: optional string type,
    3: optional i16 os,
}

struct Request {
    1: optional string call,
    2: optional initDataInfo data,
    3: optional paramData common_data,
}

// ── Response ─────────────────────────────────────────────────────────────────

struct errorRetCode {
    1: optional i32 code,
    2: optional string errmsg,
}

struct serverTimeRet {
    1: optional i32 time,
    2: optional i64 datetime,
}

// Field 5 of initReturn — verified from decoded response:
//   {1: I16 (253), 2: STRING (game_url), 3: STRING (cdn_url)}
struct initRetDataInfo {
    1: optional i16 idx,
    2: optional string game_url,
    3: optional string cdn_url,
}

struct maintenanceData {
    1: optional i16 code,
    2: optional string title,
    3: optional string description,
    4: optional i16 utc_time,
    5: optional string facebook_url,
    6: optional string start_datetime,
    7: optional string end_datetime,
}

// Decoded response structure (6 fields):
//   1: errorRetCode   {code=0, errmsg=''}
//   2: serverTimeRet  {time=1768405976, datetime=20260115005256}
//   3: string         'main'
//   4: string         'init'
//   5: initRetDataInfo {idx=253, game_url='https://game.gtgl.pmang.cloud', cdn_url='https://dl.gtgl.pmang.cloud'}
//   6: maintenanceData {}
struct initReturn {
    1: optional errorRetCode error,
    2: optional serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional initRetDataInfo data,
    6: optional maintenanceData maintenance,
}
