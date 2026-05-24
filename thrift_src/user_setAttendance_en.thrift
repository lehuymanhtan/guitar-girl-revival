// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /user/setAttendance/en/

namespace py tapsonic.user_setAttendance_en

include "common.thrift"

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
    3: optional common.paramData common_data,
}

struct setAttendanceRetDataInfo {
    1: optional string status,
    2: optional common.userFollowerQuest user_follower_quest,
    3: optional i32 attendance_count,
    4: optional i32 attendance_date,
    5: optional i32 max_coutinuous_attendance_count,
}

struct setAttendanceReturn {
    1: optional common.errorRetCode error,
    2: optional common.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional setAttendanceRetDataInfo data,
    6: optional common.maintenanceData maintenance,
}
