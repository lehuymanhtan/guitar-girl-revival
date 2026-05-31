// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /user/chThirdStage/en/

include "general.thrift"

namespace py tapsonic.user_chThirdStage_en



struct chThirdStageDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
    5: optional i32 i_id,
    6: optional i32 music_id,
    7: optional string profile_ids,
}

struct chThirdStage {
    1: optional string call,
    2: optional chThirdStageDataInfo data,
    3: optional general.paramData common_data,
}

struct StageFollowerProfileScore {
    1: optional i32 i_id,
    2: optional i32 score,
    3: optional i32 bonus_score,
}

struct chThirdStageRetDataInfo {
    1: optional i32 star,
    2: optional i32 character_score,
    3: optional i32 music_score,
    4: optional i32 follower_profile_score,
    5: optional i32 bonus_score,
    6: optional i64 total_score,
    7: optional i32 clear,
    8: optional general.UserApData user_ap,
    9: optional general.UserChThirdStage user_ch_third_stage,
    10: optional general.userMusic user_music,
    11: optional list<general.retReward> reward_data,
    12: optional list<i32> bonus_follower_profile_ids,
    13: optional general.UserFollowerProfile user_follower_profile,
    14: optional i32 bonus_music_score,
    15: optional list<StageFollowerProfileScore> user_follower_profile_score,
}

struct chThirdStageReturn {
    1: optional general.errorRetCode error,
    2: optional general.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional chThirdStageRetDataInfo data,
    6: optional general.maintenanceData maintenance,
}

/*======================================================================
 BURP EXAMPLES FOR CALL: chThirdStage
======================================================================
 Example 1:
   Request:
     {   1: {'type': 'STRING', 'value': 'chThirdStage'},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 7276629},
                             2: {'type': 'STRING', 'value': '1614162043022'},
                             3: {'type': 'STRING', 'value': '315504848'},
                             4: {   'type': 'STRING',
                                    'value': '6057191819962c308248100d62e86ead'},
                             5: {'type': 'I32', 'value': 1001},
                             6: {'type': 'I32', 'value': 1},
                             7: {'type': 'STRING', 'value': '1,2,3'}}},
         3: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 800},
                             2: {'type': 'STRING', 'value': 'real'},
                             3: {'type': 'I16', 'value': 1}}}}
   Response:
     {   1: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 0},
                             2: {'type': 'STRING', 'value': ''}}},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 1767189573},
                             2: {'type': 'I64', 'value': 20251231225933}}},
         3: {'type': 'STRING', 'value': 'user'},
         4: {'type': 'STRING', 'value': 'chThirdStage'},
         5: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 3},
                             2: {'type': 'I32', 'value': 180},
                             3: {'type': 'I32', 'value': 180},
                             4: {'type': 'I32', 'value': 1040},
                             5: {'type': 'I32', 'value': 400},
                             6: {'type': 'I64', 'value': 1836},
                             7: {'type': 'I32', 'value': 1},
                             8: {   'type': 'STRUCT',
                                    'value': {   1: {'type': 'I32', 'value': 490},
                                                 2: {   'type': 'I32',
                                                        'value': 1767189563},
                                                 3: {'type': 'I32', 'value': 60}}},
                             9: {   'type': 'STRUCT',
                                    'value': {   1: {'type': 'I32', 'value': 1001},
                                                 2: {'type': 'I32', 'value': 1},
                                                 3: {'type': 'I32', 'value': 1},
                                                 4: {'type': 'I32', 'value': 3}}},
                             10: {   'type': 'STRUCT',
                                     'value': {   1: {'type': 'I64', 'value': 1},
                                                  2: {'type': 'I64', 'value': 14},
                                                  3: {'type': 'I64', 'value': 0},
                                                  4: {'type': 'I64', 'value': 0},
                                                  5: {   'type': 'I64',
                                                         'value': 1750925196},
                                                  6: {'type': 'I64', 'value': 0},
                                                  7: {   'type': 'I64',
                                                         'value': 1767207573}}},
                             11: {   'type': 'LIST',
                                     'value': [   {   1: {   'type': 'I16',
                                                             'value': 11},
                                                      2: {'type': 'I32', 'value': 1},
                                                      3: {   'type': 'DOUBLE',
                                                             'value': 2.0}}]},
                             12: {'type': 'LIST', 'value': [1]},
                             13: {   'type': 'STRUCT',
                                     'value': {   1: {   'type': 'I32',
                                                         'value': 100000},
                                                  2: {'type': 'I32', 'value': 9},
                                                  3: {'type': 'I64', 'value': 13275},
                                                  4: {'type': 'I32', 'value': 0}}},
                             14: {'type': 'I32', 'value': 36},
                             15: {   'type': 'LIST',
                                     'value': [   {   1: {'type': 'I32', 'value': 1},
                                                      2: {   'type': 'I32',
                                                             'value': 400},
                                                      3: {   'type': 'I32',
                                                             'value': 400}},
                                                  {   1: {'type': 'I32', 'value': 2},
                                                      2: {   'type': 'I32',
                                                             'value': 320},
                                                      3: {   'type': 'I32',
                                                             'value': 0}},
                                                  {   1: {'type': 'I32', 'value': 3},
                                                      2: {   'type': 'I32',
                                                             'value': 320},
                                                      3: {   'type': 'I32',
                                                             'value': 0}}]}}},
         6: {'type': 'STRUCT', 'value': {}}}

 Example 2:
   Request:
     {   1: {'type': 'STRING', 'value': 'chThirdStage'},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 7276629},
                             2: {'type': 'STRING', 'value': '1614162043022'},
                             3: {'type': 'STRING', 'value': '315504848'},
                             4: {   'type': 'STRING',
                                    'value': '6057191819962c308248100d62e86ead'},
                             5: {'type': 'I32', 'value': 1020},
                             6: {'type': 'I32', 'value': 0},
                             7: {'type': 'STRING', 'value': ''}}},
         3: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 800},
                             2: {'type': 'STRING', 'value': 'real'},
                             3: {'type': 'I16', 'value': 1}}}}
   Response:
     {   1: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 0},
                             2: {'type': 'STRING', 'value': ''}}},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 1767189809},
                             2: {'type': 'I64', 'value': 20251231230329}}},
         3: {'type': 'STRING', 'value': 'user'},
         4: {'type': 'STRING', 'value': 'chThirdStage'},
         5: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 0},
                             2: {'type': 'I32', 'value': 0},
                             3: {'type': 'I32', 'value': 0},
                             4: {'type': 'I32', 'value': 0},
                             5: {'type': 'I32', 'value': 0},
                             6: {'type': 'I64', 'value': 0},
                             7: {'type': 'I32', 'value': 1},
                             8: {   'type': 'STRUCT',
                                    'value': {   1: {'type': 'I32', 'value': 490},
                                                 2: {   'type': 'I32',
                                                        'value': 1767189799},
                                                 3: {'type': 'I32', 'value': 60}}},
                             9: {   'type': 'STRUCT',
                                    'value': {   1: {'type': 'I32', 'value': 1020},
                                                 2: {'type': 'I32', 'value': 1},
                                                 3: {'type': 'I32', 'value': 20},
                                                 4: {'type': 'I32', 'value': 0}}},
                             11: {'type': 'LIST', 'value': []},
                             12: {'type': 'LIST', 'value': []},
                             14: {'type': 'I32', 'value': 0},
                             15: {'type': 'LIST', 'value': []}}},
         6: {'type': 'STRUCT', 'value': {}}}

======================================================================*/
