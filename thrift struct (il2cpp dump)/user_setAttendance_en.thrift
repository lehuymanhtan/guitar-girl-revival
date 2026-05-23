// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /user/setAttendance/en/

namespace py tapsonic

struct setAttendanceDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
    5: optional string type,
}

struct paramData {
    1: optional i32 client_ver,
    2: optional string type,
    3: optional i16 os,
}

struct setAttendance {
    1: optional string call,
    2: optional setAttendanceDataInfo data,
    3: optional paramData common_data,
}

struct errorRetCode {
    1: optional i32 code,
    2: optional string errmsg,
}

struct serverTimeRet {
    1: optional i32 time,
    2: optional i64 datetime,
}

struct userFollowerQuest {
    1: optional i64 i_id,
    2: optional i64 i_CurrentID,
    3: optional i64 i_CompleteID,
    4: optional double d_ConditionValue1,
    5: optional double d_ConditionValue2,
    6: optional double d_ConditionValue3,
    7: optional i16 i_RewardReceived1,
    8: optional i16 i_RewardReceived2,
    9: optional i16 i_RewardReceived3,
    10: optional i16 i_isInfinity,
}

struct setAttendanceRetDataInfo {
    1: optional string status,
    2: optional userFollowerQuest user_follower_quest,
    3: optional i32 attendance_count,
    4: optional i32 attendance_date,
    5: optional i32 max_coutinuous_attendance_count,
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

struct setAttendanceReturn {
    1: optional errorRetCode error,
    2: optional serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional setAttendanceRetDataInfo data,
    6: optional maintenanceData maintenance,
}
