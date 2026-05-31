// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /user/setFollowerProfileGift/en/

include "general.thrift"

namespace py tapsonic.user_setFollowerProfileGift_en



struct setFollowerProfileGiftDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
    5: optional i32 profile_id,
    6: optional i32 gift_id,
    7: optional i32 use_gitf_value,
}

struct setFollowerProfileGift {
    1: optional string call,
    2: optional setFollowerProfileGiftDataInfo data,
    3: optional general.paramData common_data,
}

struct setFollowerProfileGiftRetDataInfo {
    1: optional i32 i_gift_type,
    2: optional general.UserFollowerGiftItem user_follower_giftitem,
    3: optional general.UserFollowerProfile user_follower_profile,
}

struct setFollowerProfileGiftReturn {
    1: optional general.errorRetCode error,
    2: optional general.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional setFollowerProfileGiftRetDataInfo data,
    6: optional general.maintenanceData maintenance,
}

/*======================================================================
 BURP EXAMPLES FOR CALL: setFollowerProfileGift
======================================================================
 Example 1:
   Request:
     {   1: {'type': 'STRING', 'value': 'setFollowerProfileGift'},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 7276629},
                             2: {'type': 'STRING', 'value': '1614162043022'},
                             3: {'type': 'STRING', 'value': '315504848'},
                             4: {   'type': 'STRING',
                                    'value': '6057191819962c308248100d62e86ead'},
                             5: {'type': 'I32', 'value': 8},
                             6: {'type': 'I32', 'value': 1},
                             7: {'type': 'I32', 'value': 1}}},
         3: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 800},
                             2: {'type': 'STRING', 'value': 'real'},
                             3: {'type': 'I16', 'value': 1}}}}
   Response:
     {   1: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 0},
                             2: {'type': 'STRING', 'value': ''}}},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 1767189293},
                             2: {'type': 'I64', 'value': 20251231225453}}},
         3: {'type': 'STRING', 'value': 'user'},
         4: {'type': 'STRING', 'value': 'setFollowerProfileGift'},
         5: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 1},
                             2: {   'type': 'STRUCT',
                                    'value': {   1: {'type': 'I32', 'value': 1},
                                                 2: {'type': 'I32', 'value': 344}}},
                             3: {   'type': 'STRUCT',
                                    'value': {   1: {'type': 'I32', 'value': 8},
                                                 2: {'type': 'I32', 'value': 6},
                                                 3: {'type': 'I64', 'value': 1770},
                                                 4: {'type': 'I32', 'value': 1}}}}},
         6: {'type': 'STRUCT', 'value': {}}}

======================================================================*/
