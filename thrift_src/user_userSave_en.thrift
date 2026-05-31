// Auto-generated from IL2CPP dump + Burp capture
// Endpoint: /user/userSave/en/

include "general.thrift"

namespace py tapsonic.user_userSave_en


struct saveUserInfo {
    1: optional double u_like,
    2: optional i64 u_fans,
    3: optional i16 u_fans_grade,
    4: optional i64 u_selected_costume_id,
    5: optional i64 u_selected_music_id,
}

struct saveUserAreaInfo {
    1: optional i16 u_area_num,
    2: optional double d_Like,
    3: optional i64 i_UserFanCount,
    4: optional i16 i_UserFanGrade,
    5: optional i64 i_SelectedCostumeId,
    6: optional i64 i_SelectedMusicId,
    7: optional i64 i_SelectedGuitarId,
    8: optional double d_Candy,
    9: optional string s_TutorialList,
    10: optional string s_Gp1,
    11: optional string s_Gp2,
}

struct saveUserAchievement {
    1: optional i64 i_id,
    2: optional double d_Quantity,
    3: optional string s_Quantity,
}

struct saveUserCharacter {
    1: optional i64 i_id,
    2: optional i64 i_Level,
    3: optional i64 i_BonusLevel,
}

struct saveUserCostume {
    1: optional i64 i_id,
    2: optional i64 i_Level,
    3: optional i64 i_BonusLevel,
}

struct saveUserDailyMission {
    1: optional i64 i_id,
    2: optional i64 d_Quantity,
}

struct saveUserFollower {
    1: optional i64 i_id,
    2: optional i64 i_Level,
    3: optional i64 i_BonusLevel,
}

struct saveUserMusic {
    1: optional i64 i_id,
    2: optional i64 i_Level,
    3: optional i64 i_BonusLevel,
    4: optional i64 b_EncoreBonusAppear,
    5: optional i64 i_EncoreBonusFollowerId,
}

struct saveUserSkill {
    1: optional i64 i_id,
    2: optional i16 b_Activate,
    3: optional i64 l_ActivateOnTicks,
    4: optional i64 l_ActivateOffTicks,
}

struct saveUserMessenger {
    1: optional i64 i_MessengerChatRoomId,
    2: optional i64 i_LastConfirmIndex,
    3: optional string s_UnlockGroupList,
    4: optional i64 l_UpdateTimeTicks,
}

struct saveUserGuitar {
    1: optional i64 i_id,
    2: optional i64 i_Level,
    3: optional i64 i_BonusLevel,
}

struct saveUserEventPoint {
    1: optional string s_EventType,
    2: optional i64 i_DataID,
    3: optional i64 i_Point,
    4: optional i64 i_Step,
    5: optional i32 i_Version,
}

struct saveUserFollowerQuest {
    1: optional i32 i_CurrentID,
    2: optional double d_ConditionValue1,
    3: optional double d_ConditionValue2,
    4: optional double d_ConditionValue3,
}

struct userSaveDataInfo {
    1: optional i32 u_seq,
    2: optional string u_id,
    3: optional string uuid,
    4: optional string device_uuid,
    5: optional string type,
    6: optional list<saveUserInfo> user_info,
    7: optional list<saveUserAreaInfo> user_area_info,
    8: optional list<saveUserAchievement> user_achievement,
    9: optional list<saveUserCharacter> user_character,
    10: optional list<saveUserCostume> user_costume,
    11: optional list<saveUserDailyMission> user_daily_mission,
    12: optional list<saveUserFollower> user_follower,
    13: optional list<saveUserMusic> user_music,
    14: optional list<saveUserSkill> user_skill,
    15: optional list<saveUserMessenger> user_messenger,
    16: optional list<saveUserGuitar> user_guitar,
    17: optional list<saveUserEventPoint> user_event_point,
    18: optional list<saveUserFollowerQuest> user_follower_quest,
}

struct userSave {
    1: optional string call,
    2: optional userSaveDataInfo data,
    3: optional general.paramData common_data,
}

struct userSaveRetDataInfo {
    1: optional string status,
}

struct userSaveReturn {
    1: optional general.errorRetCode error,
    2: optional general.serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional userSaveRetDataInfo data,
    6: optional general.maintenanceData maintenance,
}

/*======================================================================
 BURP EXAMPLES FOR CALL: userSave
======================================================================
 Example 1:
   Request:
     {   1: {'type': 'STRING', 'value': 'userSave'},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 7276629},
                             2: {'type': 'STRING', 'value': '1614162043022'},
                             3: {'type': 'STRING', 'value': '315504848'},
                             4: {   'type': 'STRING',
                                    'value': '6057191819962c308248100d62e86ead'},
                             5: {'type': 'STRING', 'value': 'ALL'},
                             6: {   'type': 'LIST',
                                    'value': [   {   1: {   'type': 'DOUBLE',
                                                            'value': 0.0},
                                                     2: {'type': 'I64', 'value': 0},
                                                     3: {'type': 'I16', 'value': 0},
                                                     4: {'type': 'I64', 'value': 0},
                                                     5: {   'type': 'I64',
                                                            'value': 0}}]},
                             7: {   'type': 'LIST',
                                    'value': [   {   1: {'type': 'I16', 'value': 1},
                                                     2: {   'type': 'DOUBLE',
                                                            'value': 0.0},
                                                     3: {   'type': 'I64',
                                                            'value': 4414051},
                                                     4: {'type': 'I16', 'value': 5},
                                                     5: {'type': 'I64', 'value': 29},
                                                     6: {'type': 'I64', 'value': 7},
                                                     7: {'type': 'I64', 'value': 35},
                                                     8: {   'type': 'DOUBLE',
                                                            'value': 0.0},
                                                     9: {   'type': 'STRING',
                                                            'value': '1,2,3,4,5,6,7'},
                                                     10: {   'type': 'STRING',
                                                             'value': '331962504023112652601351282911966934974619607074775228235184988154750293993840973516977505786366185312914905587297754756'},
                                                     11: {   'type': 'STRING',
                                                             'value': '0'}},
                                                 {   1: {'type': 'I16', 'value': 2},
                                                     2: {   'type': 'DOUBLE',
                                                            'value': 0.0},
                                                     3: {   'type': 'I64',
                                                            'value': 929031},
                                                     4: {'type': 'I16', 'value': 4},
                                                     5: {   'type': 'I64',
                                                            'value': 227},
                                                     6: {   'type': 'I64',
                                                            'value': 210},
                                                     7: {   'type': 'I64',
                                                            'value': 241},
                                                     8: {   'type': 'DOUBLE',
                                                            'value': 0.0},
                                                     9: {   'type': 'STRING',
                                                            'value': '8,9,10,11,12,13'},
                                                     10: {   'type': 'STRING',
                                                             'value': '144558913081586885722099871692886104087274837831867502334725626154214389104524'},
                                                     11: {   'type': 'STRING',
                                                             'value': '571171208282358161346709717388198656422073193971078647804087298280395977395772853'}}]},
                             8: {   'type': 'LIST',
                                    'value': [   {   1: {'type': 'I64', 'value': 1},
                                                     2: {   'type': 'DOUBLE',
                                                            'value': 0.0},
                                                     3: {   'type': 'STRING',
                                                            'value': '3850'}},
                                                 <...>]},
                             9: {   'type': 'LIST',
                                    'value': [   {   1: {'type': 'I64', 'value': 1},
                                                     2: {   'type': 'I64',
                                                            'value': 3850},
                                                     3: {   'type': 'I64',
                                                            'value': 154}},
                                                 {   1: {'type': 'I64', 'value': 2},
                                                     2: {   'type': 'I64',
                                                            'value': 2500},
                                                     3: {   'type': 'I64',
                                                            'value': 100}}]},
                             10: {   'type': 'LIST',
                                     'value': [   {   1: {'type': 'I64', 'value': 1},
                                                      2: {'type': 'I64', 'value': 1},
                                                      3: {   'type': 'I64',
                                                             'value': 0}},
                                                  <...>]},
                             11: {   'type': 'LIST',
                                     'value': [   {   1: {'type': 'I64', 'value': 1},
                                                      2: {   'type': 'I64',
                                                             'value': 1}},
                                                  <...>]},
                             12: {   'type': 'LIST',
                                     'value': [   {   1: {'type': 'I64', 'value': 1},
                                                      2: {   'type': 'I64',
                                                             'value': 3750},
                                                      3: {   'type': 'I64',
                                                             'value': 150}},
                                                  <...>]},
                             13: {   'type': 'LIST',
                                     'value': [   {   1: {'type': 'I64', 'value': 1},
                                                      2: {   'type': 'I64',
                                                             'value': 14},
                                                      3: {'type': 'I64', 'value': 0},
                                                      4: {'type': 'I64', 'value': 0},
                                                      5: {   'type': 'I64',
                                                             'value': 0}},
                                                  <...>]},
                             14: {   'type': 'LIST',
                                     'value': [   {   1: {'type': 'I64', 'value': 1},
                                                      2: {'type': 'I16', 'value': 0},
                                                      3: {'type': 'I64', 'value': 0},
                                                      4: {   'type': 'I64',
                                                             'value': 0}},
                                                  <...>]},
                             15: {   'type': 'LIST',
                                     'value': [   {   1: {'type': 'I64', 'value': 1},
                                                      2: {'type': 'I64', 'value': 3},
                                                      3: {   'type': 'STRING',
                                                             'value': '1,3,4,7,10,12,15,19,16,24,27,30,32,33,35,36,41,45,47,48,56,57,59,60,71,75,111,156,159,182,185'},
                                                      4: {   'type': 'I64',
                                                             'value': 637854957011600000}},
                                                  <...>]},
                             16: {   'type': 'LIST',
                                     'value': [   {   1: {'type': 'I64', 'value': 1},
                                                      2: {'type': 'I64', 'value': 1},
                                                      3: {   'type': 'I64',
                                                             'value': 0}},
                                                  <...>]},
                             17: {   'type': 'LIST',
                                     'value': [   {   1: {   'type': 'STRING',
                                                             'value': 'Pass'},
                                                      2: {'type': 'I64', 'value': 1},
                                                      3: {'type': 'I64', 'value': 1},
                                                      4: {'type': 'I64', 'value': 0},
                                                      5: {   'type': 'I32',
                                                             'value': 2}},
                                                  <...>]},
                             18: {   'type': 'LIST',
                                     'value': [   {   1: {   'type': 'I32',
                                                             'value': 25},
                                                      2: {   'type': 'DOUBLE',
                                                             'value': 12.0},
                                                      3: {   'type': 'DOUBLE',
                                                             'value': 550.0},
                                                      4: {   'type': 'DOUBLE',
                                                             'value': 80.0}}]}}},
         3: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 800},
                             2: {'type': 'STRING', 'value': 'real'},
                             3: {'type': 'I16', 'value': 1}}}}
   Response:
     {   1: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 0},
                             2: {'type': 'STRING', 'value': ''}}},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 1767188506},
                             2: {'type': 'I64', 'value': 20251231224146}}},
         3: {'type': 'STRING', 'value': 'user'},
         4: {'type': 'STRING', 'value': 'userSave'},
         5: {'type': 'STRUCT', 'value': {1: {'type': 'STRING', 'value': 'Y'}}},
         6: {'type': 'STRUCT', 'value': {}}}

 Example 2:
   Request:
     {   1: {'type': 'STRING', 'value': 'userSave'},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 7276629},
                             2: {'type': 'STRING', 'value': '1614162043022'},
                             3: {'type': 'STRING', 'value': '315504848'},
                             4: {   'type': 'STRING',
                                    'value': '6057191819962c308248100d62e86ead'},
                             5: {'type': 'STRING', 'value': 'ALL'},
                             7: {   'type': 'LIST',
                                    'value': [   {   1: {'type': 'I16', 'value': 1},
                                                     2: {   'type': 'DOUBLE',
                                                            'value': 0.0},
                                                     3: {   'type': 'I64',
                                                            'value': 4415011},
                                                     4: {'type': 'I16', 'value': 5},
                                                     5: {'type': 'I64', 'value': 29},
                                                     6: {'type': 'I64', 'value': 9},
                                                     7: {'type': 'I64', 'value': 35},
                                                     8: {   'type': 'DOUBLE',
                                                            'value': 0.0},
                                                     9: {   'type': 'STRING',
                                                            'value': '1,2,3,4,5,6,7'},
                                                     10: {   'type': 'STRING',
                                                             'value': '334612891806567345346959537294621127225829019231107167991207332415621408792346639949767867748021997531844306633242544777'},
                                                     11: {   'type': 'STRING',
                                                             'value': '0'}},
                                                 {   1: {'type': 'I16', 'value': 2},
                                                     2: {   'type': 'DOUBLE',
                                                            'value': 0.0},
                                                     3: {   'type': 'I64',
                                                            'value': 929031},
                                                     4: {'type': 'I16', 'value': 4},
                                                     5: {   'type': 'I64',
                                                            'value': 227},
                                                     6: {   'type': 'I64',
                                                            'value': 210},
                                                     7: {   'type': 'I64',
                                                            'value': 241},
                                                     8: {   'type': 'DOUBLE',
                                                            'value': 0.0},
                                                     9: {   'type': 'STRING',
                                                            'value': '8,9,10,11,12,13'},
                                                     10: {   'type': 'STRING',
                                                             'value': '144558913081586885722099871692886104087274837831867502334725626154214389104524'},
                                                     11: {   'type': 'STRING',
                                                             'value': '571171208282358161346709717388198656422073193971078647804087298280395977395772853'}}]},
                             8: {   'type': 'LIST',
                                    'value': [   {   1: {'type': 'I64', 'value': 1},
                                                     2: {   'type': 'DOUBLE',
                                                            'value': 0.0},
                                                     3: {   'type': 'STRING',
                                                            'value': '3850'}},
                                                 <...>]},
                             11: {   'type': 'LIST',
                                     'value': [   {   1: {'type': 'I64', 'value': 1},
                                                      2: {   'type': 'I64',
                                                             'value': 1}},
                                                  <...>]},
                             13: {   'type': 'LIST',
                                     'value': [   {   1: {'type': 'I64', 'value': 1},
                                                      2: {   'type': 'I64',
                                                             'value': 14},
                                                      3: {'type': 'I64', 'value': 0},
                                                      4: {'type': 'I64', 'value': 0},
                                                      5: {   'type': 'I64',
                                                             'value': 0}},
                                                  <...>]}}},
         3: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 800},
                             2: {'type': 'STRING', 'value': 'real'},
                             3: {'type': 'I16', 'value': 1}}}}
   Response:
     {   1: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 0},
                             2: {'type': 'STRING', 'value': ''}}},
         2: {   'type': 'STRUCT',
                'value': {   1: {'type': 'I32', 'value': 1767188820},
                             2: {'type': 'I64', 'value': 20251231224700}}},
         3: {'type': 'STRING', 'value': 'user'},
         4: {'type': 'STRING', 'value': 'userSave'},
         5: {'type': 'STRUCT', 'value': {1: {'type': 'STRING', 'value': 'Y'}}},
         6: {'type': 'STRUCT', 'value': {}}}

 

======================================================================*/
