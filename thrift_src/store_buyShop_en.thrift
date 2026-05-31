// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /store/buyShop/en/

include "general.thrift"

namespace py tapsonic.store_buyShop_en


struct buyShopDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
    5: optional i32 idx,
    6: optional string developer_payload,
    7: optional string pay_id,
    8: optional string purchase_token,
    9: optional string purchase_id,
    10: optional i16 os,
    11: optional string app_id,
    12: optional string member_id,
}

struct buyShop {
    1: optional string call,
    2: optional buyShopDataInfo data,
    3: optional string sub_mode,
    4: optional general.paramData common_data,
}

struct buyShopRetDataInfo {
    1: optional i64 u_cp,
    2: optional double u_candy,
    3: optional list<general.retReward> reward_data,
    4: optional general.UserAdLevel user_ad_level,
}

struct buyShopReturn {
    1: optional general.errorRetCode error,
    2: optional general.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional buyShopRetDataInfo data,
    6: optional general.maintenanceData maintenance,
}

/*======================================================================
 BURP EXAMPLES FOR CALL: buyShop
======================================================================
 Example 1:
   Request:
     {   1: {'type': 'STRING', 'value': 'buyShop'},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 7276629},
                             2: {'type': 'STRING', 'value': '1614162043022'},
                             3: {'type': 'STRING', 'value': '315504848'},
                             4: {   'type': 'STRING',
                                    'value': '6057191819962c308248100d62e86ead'},
                             5: {'type': 'I32', 'value': 20},
                             6: {'type': 'STRING', 'value': ''},
                             7: {'type': 'STRING', 'value': ''},
                             8: {'type': 'STRING', 'value': ''},
                             9: {'type': 'STRING', 'value': ''},
                             10: {'type': 'I16', 'value': 1},
                             11: {'type': 'STRING', 'value': '5014'},
                             12: {'type': 'STRING', 'value': '315504848'}}},
         3: {'type': 'STRING', 'value': 'user'},
         4: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 800},
                             2: {'type': 'STRING', 'value': 'real'},
                             3: {'type': 'I16', 'value': 1}}}}
   Response:
     {   1: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 0},
                             2: {'type': 'STRING', 'value': ''}}},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 1767189408},
                             2: {'type': 'I64', 'value': 20251231225648}}},
         3: {'type': 'STRING', 'value': 'store'},
         4: {'type': 'STRING', 'value': 'buyShop'},
         5: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I64', 'value': 724},
                             2: {'type': 'DOUBLE', 'value': 553.0},
                             3: {   'type': 'LIST',
                                    'value': [   {   1: {'type': 'I16', 'value': 1},
                                                     2: {'type': 'I32', 'value': 7},
                                                     3: {   'type': 'I64',
                                                            'value': 20000}}]}}},
         6: {'type': 'STRUCT', 'value': {}}}

======================================================================*/
