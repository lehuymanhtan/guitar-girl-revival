// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /post/getPost/en/

namespace py tapsonic.post_getPost_en

include "common.thrift"

struct getPostDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
}

struct getPost {
    1: optional string call,
    2: optional getPostDataInfo data,
    3: optional common.paramData common_data,
}

struct itemList {
    1: optional i32 i_RewardType,
    2: optional i32 i_RewardId,
    3: optional double d_RewardQuantity,
}

struct getPostList {
    1: optional i64 idx,
    2: optional i16 notice_type,
    3: optional string title_ko,
    4: optional string memo_ko,
    5: optional string title_en,
    6: optional string memo_en,
    7: optional string title_jp,
    8: optional string memo_jp,
    9: optional string title_zh_chs,
    10: optional string memo_zh_chs,
    11: optional string title_zh_cht,
    12: optional string memo_zh_cht,
    13: optional string title_vi,
    14: optional string memo_vi,
    15: optional string title_es,
    16: optional string memo_es,
    17: optional string title_it,
    18: optional string memo_it,
    19: optional string title_id,
    20: optional string memo_id,
    21: optional string title_th,
    22: optional string memo_th,
    23: optional string title_pt,
    24: optional string memo_pt,
    25: optional string title_hi,
    26: optional string memo_hi,
    27: optional i16 have_reward,
    28: optional i16 status,
    29: optional i16 unlimit_flg,
    30: optional i16 flg,
    31: optional i64 create_time,
    32: optional i64 del_time,
    33: optional list<itemList> item_list,
    34: optional string url,
    35: optional string image_resource_name,
}

struct getPostRetDataInfo {
    1: optional i64 server_time,
    2: optional list<getPostList> post_list,
}

struct getPostReturn {
    1: optional common.errorRetCode error,
    2: optional common.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional getPostRetDataInfo data,
    6: optional common.maintenanceData maintenance,
}
