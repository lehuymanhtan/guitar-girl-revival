// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /store/buyVarietyStore/en/

include "general.thrift"

namespace py tapsonic.store_buyVarietyStore_en


struct buyVarietyStoreDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
    5: optional i32 idx,
}

struct buyVarietyStore {
    1: optional string call,
    2: optional buyVarietyStoreDataInfo data,
    3: optional general.paramData common_data,
}

struct buyVarietyStoreRetDataInfo {
    1: optional i64 u_cp,
    2: optional double u_candy,
    3: optional i16 reward_type,
    4: optional i32 reward_id,
    5: optional i64 reward_value,
    6: optional string status,
}

struct buyVarietyStoreReturn {
    1: optional general.errorRetCode error,
    2: optional general.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional buyVarietyStoreRetDataInfo data,
    6: optional general.maintenanceData maintenance,
}

/*======================================================================
 BURP EXAMPLES FOR CALL: buyVarietyStore
======================================================================
 Example 1:
   Request:
     {   1: {'type': 'STRING', 'value': 'buyVarietyStore'},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 10300460},
                             2: {'type': 'STRING', 'value': '1768405998050'},
                             3: {'type': 'STRING', 'value': '431494216'},
                             4: {   'type': 'STRING',
                                    'value': 'bb06dae7594c5b50fb6a6a4b9d4bd81b'},
                             5: {'type': 'I32', 'value': 1}}},
         3: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 800},
                             2: {'type': 'STRING', 'value': 'real'},
                             3: {'type': 'I16', 'value': 1}}}}
   Response:
     {   1: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 0},
                             2: {'type': 'STRING', 'value': ''}}},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 1769267476},
                             2: {'type': 'I64', 'value': 20260125001116}}},
         3: {'type': 'STRING', 'value': 'store'},
         4: {'type': 'STRING', 'value': 'buyVarietyStore'},
         5: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I64', 'value': 120},
                             2: {'type': 'DOUBLE', 'value': 120.0},
                             3: {'type': 'I16', 'value': 4},
                             4: {'type': 'I32', 'value': 1},
                             5: {'type': 'I64', 'value': 1},
                             6: {'type': 'STRING', 'value': 'Y'}}},
         6: {'type': 'STRUCT', 'value': {}}}

======================================================================*/
