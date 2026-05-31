// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /main/defaultSettingList/en/

include "general.thrift"

namespace py tapsonic.main_defaultSettingList_en



struct defaultSettingListDataInfo {
    1: optional string device_uuid,
    2: optional i16 os,
}

struct defaultSettingList {
    1: optional string call,
    2: optional defaultSettingListDataInfo data,
    3: optional general.paramData common_data,
}

struct defaultSettingDataList {
    1: optional string setting_key,
    2: optional string setting_value,
}

struct defaultSettingListRetDataInfo {
    1: optional string status,
    2: optional list<defaultSettingDataList> setting_list,
}

struct defaultSettingListReturn {
    1: optional general.errorRetCode error,
    2: optional general.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional defaultSettingListRetDataInfo data,
    6: optional general.maintenanceData maintenance,
}

/*======================================================================
 BURP EXAMPLES FOR CALL: defaultSettingList
======================================================================
 Example 1:
   Request:
     {   1: {'type': 'STRING', 'value': 'defaultSettingList'},
         2: {   'type': 'STRUCT',
                'value': {   1: {   'type': 'STRING',
                                    'value': '6057191819962c308248100d62e86ead'},
                             2: {'type': 'I16', 'value': 1}}},
         3: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 800},
                             2: {'type': 'STRING', 'value': 'real'},
                             3: {'type': 'I16', 'value': 1}}}}
   Response:
     {   1: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 0},
                             2: {'type': 'STRING', 'value': ''}}},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 1767188503},
                             2: {'type': 'I64', 'value': 20251231224143}}},
         3: {'type': 'STRING', 'value': 'main'},
         4: {'type': 'STRING', 'value': 'defaultSettingList'},
         5: {   'type': 'STRUCT',
                'value': {   1: {'type': 'STRING', 'value': 'Y'},
                             2: {   'type': 'LIST',
                                    'value': [   {   1: {   'type': 'STRING',
                                                            'value': 'shop_call_wait'},
                                                     2: {   'type': 'STRING',
                                                            'value': '2'}},
                                                 {   1: {   'type': 'STRING',
                                                            'value': 'ad_cancel_delay'},
                                                     2: {   'type': 'STRING',
                                                            'value': '5'}},
                                                 {   1: {   'type': 'STRING',
                                                            'value': 'force_menu_restric'},
                                                     2: {   'type': 'STRING',
                                                            'value': 'true'}},
                                                 {   1: {   'type': 'STRING',
                                                            'value': 'max_bundle_texutre_loading'},
                                                     2: {   'type': 'STRING',
                                                            'value': '1'}},
                                                 {   1: {   'type': 'STRING',
                                                            'value': 'weather_snow'},
                                                     2: {   'type': 'STRING',
                                                            'value': 'true'}},
                                                 {   1: {   'type': 'STRING',
                                                            'value': 'check_time_cheat'},
                                                     2: {   'type': 'STRING',
                                                            'value': 'false'}},
                                                 {   1: {   'type': 'STRING',
                                                            'value': 'ap_max'},
                                                     2: {   'type': 'STRING',
                                                            'value': '60'}},
                                                 {   1: {   'type': 'STRING',
                                                            'value': 'ap_time'},
                                                     2: {   'type': 'STRING',
                                                            'value': '300'}},
                                                 {   1: {   'type': 'STRING',
                                                            'value': 'ap_use'},
                                                     2: {   'type': 'STRING',
                                                            'value': '5'}},
                                                 {   1: {   'type': 'STRING',
                                                            'value': 'character_exp'},
                                                     2: {   'type': 'STRING',
                                                            'value': '45'}},
                                                 {   1: {   'type': 'STRING',
                                                            'value': 'ap_shop_id'},
                                                     2: {   'type': 'STRING',
                                                            'value': '31'}},
                                                 {   1: {   'type': 'STRING',
                                                            'value': 'ap_ad_list_id'},
                                                     2: {   'type': 'STRING',
                                                            'value': '2'}},
                                                 {   1: {   'type': 'STRING',
                                                            'value': 'ch_third_unlock_follower_id'},
                                                     2: {   'type': 'STRING',
                                                            'value': '5'}},
                                                 {   1: {   'type': 'STRING',
                                                            'value': 'ch_third_unlock_follower_level'},
                                                     2: {   'type': 'STRING',
                                                            'value': '1'}},
                                                 {   1: {   'type': 'STRING',
                                                            'value': 'ad_follower_profile_exp_persent'},
                                                     2: {   'type': 'STRING',
                                                            'value': '0.1'}},
                                                 {   1: {   'type': 'STRING',
                                                            'value': 'follower_profile_bonus_percent'},
                                                     2: {   'type': 'STRING',
                                                            'value': '1'}},
                                                 {   1: {   'type': 'STRING',
                                                            'value': 'spine_load_max_count'},
                                                     2: {   'type': 'STRING',
                                                            'value': '0'}},
                                                 {   1: {   'type': 'STRING',
                                                            'value': 'log_flag'},
                                                     2: {   'type': 'STRING',
                                                            'value': 'true'}},
                                                 {   1: {   'type': 'STRING',
                                                            'value': 'weather_cherry_blossom'},
                                                     2: {   'type': 'STRING',
                                                            'value': 'false'}},
                                                 {   1: {   'type': 'STRING',
                                                            'value': 'active_goods_ticket_buff'},
                                                     2: {   'type': 'STRING',
                                                            'value': 'true'}},
                                                 {   1: {   'type': 'STRING',
                                                            'value': 'active_fan_art_costume'},
                                                     2: {   'type': 'STRING',
                                                            'value': 'true'}},
                                                 {   1: {   'type': 'STRING',
                                                            'value': 'pass_goods_sale_start_time'},
                                                     2: {   'type': 'STRING',
                                                            'value': '2022-02-19 '
                                                                     '00:00'}},
                                                 {   1: {   'type': 'STRING',
                                                            'value': 'pass_goods_sale_end_time'},
                                                     2: {   'type': 'STRING',
                                                            'value': '2022-02-27 '
                                                                     '23:59'}},
                                                 {   1: {   'type': 'STRING',
                                                            'value': 'attendacne_buff_value'},
                                                     2: {   'type': 'STRING',
                                                            'value': '0.01'}},
                                                 {   1: {   'type': 'STRING',
                                                            'value': 'attendacne_buff_limit_day'},
                                                     2: {   'type': 'STRING',
                                                            'value': '10000'}},
                                                 {   1: {   'type': 'STRING',
                                                            'value': 'log_flag_unfinished_purchase'},
                                                     2: {   'type': 'STRING',
                                                            'value': 'true'}},
                                                 {   1: {   'type': 'STRING',
                                                            'value': 'jp_laws_flag'},
                                                     2: {   'type': 'STRING',
                                                            'value': 'true'}}]}}},
         6: {'type': 'STRUCT', 'value': {}}}

======================================================================*/
