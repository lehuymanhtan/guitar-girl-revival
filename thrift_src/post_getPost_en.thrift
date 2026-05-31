// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /post/getPost/en/

include "general.thrift"

namespace py tapsonic.post_getPost_en



struct getPostDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
}

struct getPost {
    1: optional string call,
    2: optional getPostDataInfo data,
    3: optional general.paramData common_data,
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
    1: optional general.errorRetCode error,
    2: optional general.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional getPostRetDataInfo data,
    6: optional general.maintenanceData maintenance,
}

/*======================================================================
 BURP EXAMPLES FOR CALL: getPost
======================================================================
 Example 1:
   Request:
     {   1: {'type': 'STRING', 'value': 'getPost'},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 10300460},
                             2: {'type': 'STRING', 'value': '1768405998050'},
                             3: {'type': 'STRING', 'value': '431494216'},
                             4: {   'type': 'STRING',
                                    'value': 'bb06dae7594c5b50fb6a6a4b9d4bd81b'}}},
         3: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 800},
                             2: {'type': 'STRING', 'value': 'real'},
                             3: {'type': 'I16', 'value': 1}}}}
   Response:
     {   1: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 0},
                             2: {'type': 'STRING', 'value': ''}}},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 1768579284},
                             2: {'type': 'I64', 'value': 20260117010124}}},
         3: {'type': 'STRING', 'value': 'post'},
         4: {'type': 'STRING', 'value': 'getPost'},
         5: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I64', 'value': 1768579284},
                             2: {   'type': 'LIST',
                                    'value': [   {   1: {   'type': 'I64',
                                                            'value': 6136348},
                                                     2: {'type': 'I16', 'value': 0},
                                                     3: {   'type': 'STRING',
                                                            'value': '삼색이의 333 이벤트 '
                                                                     '보상'},
                                                     4: {   'type': 'STRING',
                                                            'value': '삼색이의 333 이벤트 '
                                                                     '보상입니다.'},
                                                     5: {   'type': 'STRING',
                                                            'value': "Calico Cat's "
                                                                     'Meowfest '
                                                                     'Reward'},
                                                     6: {   'type': 'STRING',
                                                            'value': 'This is '
                                                                     "Calico Cat's "
                                                                     'Meowfest '
                                                                     'Reward.'},
                                                     7: {   'type': 'STRING',
                                                            'value': 'ミケの333イベント報酬'},
                                                     8: {   'type': 'STRING',
                                                            'value': 'ミケの333イベント報酬です。'},
                                                     9: {   'type': 'STRING',
                                                            'value': '三色猫的喵喵活动奖励'},
                                                     10: {   'type': 'STRING',
                                                             'value': '这是三色猫的喵喵活动奖励。'},
                                                     11: {   'type': 'STRING',
                                                             'value': '三色貓的喵喵活動獎勵'},
                                                     12: {   'type': 'STRING',
                                                             'value': '這是三色貓的喵喵活動獎勵。'},
                                                     13: {   'type': 'STRING',
                                                             'value': 'Phần thưởng '
                                                                      'Sự kiện '
                                                                      'Meowfest của '
                                                                      'Calico Cat'},
                                                     14: {   'type': 'STRING',
                                                             'value': 'Đây là Phần '
                                                                      'thưởng Sự '
                                                                      'kiện '
                                                                      'Meowfest của '
                                                                      'Calico Cat.'},
                                                     15: {   'type': 'STRING',
                                                             'value': 'Recompensa '
                                                                      'del Festival '
                                                                      'miau del '
                                                                      'gato Calico'},
                                                     16: {   'type': 'STRING',
                                                             'value': 'Esta es la '
                                                                      'recompensa '
                                                                      'del Festival '
                                                                      'miau del '
                                                                      'gato '
                                                                      'Calico.'},
                                                     17: {   'type': 'STRING',
                                                             'value': 'Ricompensa '
                                                                      'Miaofest di '
                                                                      'Calico'},
                                                     18: {   'type': 'STRING',
                                                             'value': 'Questa è la '
                                                                      'ricompensa '
                                                                      'per il '
                                                                      'Miaofest di '
                                                                      'Calico.'},
                                                     19: {   'type': 'STRING',
                                                             'value': 'Hadiah '
                                                                      'Festival '
                                                                      'Kucing '
                                                                      'Calico Cat.'},
                                                     20: {   'type': 'STRING',
                                                             'value': 'Ini adalah '
                                                                      'Hadiah '
                                                                      'Festival '
                                                                      'Kucing '
                                                                      'Calico Cat.'},
                                                     21: {   'type': 'STRING',
                                                             'value': 'รางวัลเทศกาลเหมียว '
                                                                      'ๆ '
                                                                      'ของแมวสามสี'},
                                                     22: {   'type': 'STRING',
                                                             'value': 'นี่คือรางวัลเทศกาลเหมียว '
                                                                      'ๆ '
                                                                      'ของแมวสามสี'},
                                                     23: {   'type': 'STRING',
                                                             'value': 'Recompensa '
                                                                      'do Miaufest '
                                                                      'da Gata '
                                                                      'Malhada'},
                                                     24: {   'type': 'STRING',
                                                             'value': 'Esta é a '
                                                                      'Recompensa '
                                                                      'do Miaufest '
                                                                      'da Gata '
                                                                      'Malhada.'},
                                                     25: {   'type': 'STRING',
                                                             'value': 'कैलिको कैट '
                                                                      'का '
                                                                      'म्याऊँफ़ेस्ट '
                                                                      'इनाम'},
                                                     26: {   'type': 'STRING',
                                                             'value': 'यह इनाम '
                                                                      'कैलिको कैट '
                                                                      'को '
                                                                      'म्याऊँफ़ेस्ट '
                                                                      'में मिला '
                                                                      'है। '},
                                                     27: {'type': 'I16', 'value': 1},
                                                     28: {'type': 'I16', 'value': 0},
                                                     29: {'type': 'I16', 'value': 1},
                                                     30: {'type': 'I16', 'value': 0},
                                                     31: {   'type': 'I64',
                                                             'value': 1768579280},
                                                     32: {   'type': 'I64',
                                                             'value': 2147451240},
                                                     33: {   'type': 'LIST',
                                                             'value': [   {   1: {   'type': 'I32',
                                                                                     'value': 3},
                                                                              2: {   'type': 'I32',
                                                                                     'value': 13},
                                                                              3: {   'type': 'DOUBLE',
                                                                                     'value': 1.0}}]},
                                                     34: {   'type': 'STRING',
                                                             'value': ''},
                                                     35: {   'type': 'STRING',
                                                             'value': ''}}]}}},
         6: {'type': 'STRUCT', 'value': {}}}

======================================================================*/
