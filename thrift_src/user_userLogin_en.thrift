// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /user/userLogin/en/

namespace py tapsonic.user_userLogin_en

include "common.thrift"

struct userLoginDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
    5: optional string u_state,
}

struct userLogin {
    1: optional string call,
    2: optional userLoginDataInfo data,
    3: optional common.paramData common_data,
}

struct userData {
    1:  optional i32    u_seq,
    2:  optional string u_id,
    3:  optional string u_name,
    4:  optional string u_nick;
    5:  optional i64    u_cp;
    6:  optional double u_candy;
    7:  optional double u_like;
    8:  optional i64    u_fans;
    9:  optional i16    u_fans_grade;
    10: optional i64    u_selected_costume_id;
    11: optional i64    u_selected_music_id;
    12: optional i16    u_retain_continuous_tap;
    13: optional i16    u_join_type;
    14: optional string u_last_login;
    15: optional string u_last_communication;
    16: optional string u_save_date;
    17: optional string u_create_time;
    18: optional i16    u_tutorial_step;
    19: optional string u_review_popup;
    20: optional string device_uuid;
    21: optional i16    u_samseck_step;
    22: optional i64    u_free_cp;
    23: optional i64    u_charge_cp;
}

struct userAreaData {
    1:  optional i16    u_area_num;
    2:  optional double d_Candy;
    3:  optional double d_Like;
    4:  optional i64    i_UserFanCount;
    5:  optional i16    i_UserFanGrade;
    6:  optional i64    i_SelectedCostumeId;
    7:  optional i64    i_SelectedMusicId;
    8:  optional i64    i_SelectedGuitarId;
    9:  optional string s_TutorialList;
    10: optional string s_Gp1;
    11: optional string s_Gp2;
}

struct userLoginRetDataInfo {
    1: optional userData user,
    2: optional map<i32, userAreaData> area_data,
    3: optional common.userContentsData user_contents,
}

struct userLoginReturn {
    1: optional common.errorRetCode error,
    2: optional common.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional userLoginRetDataInfo data,
    6: optional common.maintenanceData maintenance,
}
