import os
import re
import shutil

src_dir = r"D:\code\python\gg_server\thrift struct (il2cpp dump)"
dst_dir = r"D:\code\python\gg_server\thrift_src"

if os.path.exists(dst_dir):
    shutil.rmtree(dst_dir)
os.makedirs(dst_dir)

# List of all 32 endpoint thrift files based on the plan
endpoints = [
    "eventMode_getSamSeckList_en.thrift",
    "eventMode_getSamSeckReward_en.thrift",
    "main_Request_en.thrift",
    "main_defaultSettingList_en.thrift",
    "main_getUpdateTime_en.thrift",
    "main_getEventRewardList_en.thrift",
    "main_getServerTime_en.thrift",
    "post_getPost_en.thrift",
    "post_getPostTime_en.thrift",
    "store_buyCheck_en.thrift",
    "store_buyContents_en.thrift",
    "store_buyShop_en.thrift",
    "store_buyVarietyStore_en.thrift",
    "store_getVarietyStore_en.thrift",
    "user_adViewLog_en.thrift",
    "user_chThirdStage_en.thrift",
    "user_completeLog_en.thrift",
    "user_getChThird_en.thrift",
    "user_getChThirdStarReward_en.thrift",
    "user_getMusicReward_en.thrift",
    "user_lastSaveTime_en.thrift",
    "user_paidEventPoint_en.thrift",
    "user_setAdReward_en.thrift",
    "user_setAttendance_en.thrift",
    "user_setEventReward_en.thrift",
    "user_setFollowerProfileGift_en.thrift",
    "user_setGameReward_en.thrift",
    "user_setPassReward_en.thrift",
    "user_setTutorialNew_en.thrift",
    "user_setUserFollowerProfileReward_en.thrift",
    "user_userJoin_en.thrift",
    "user_userLoad_en.thrift",
    "user_userLogin_en.thrift",
    "user_userSave_en.thrift"
]

# Create common.thrift
common_thrift = """namespace py tapsonic.common

struct paramData {
    1: optional i32 client_ver,
    2: optional string type,
    3: optional i16 os,
}
struct errorRetCode {
    1: optional i32 code,
    2: optional string errmsg,
}
struct serverTimeRet {
    1: optional i32 time,
    2: optional i64 datetime,
}
struct maintenanceData {
    1: optional i16 code,
    2: optional string title,
    3: optional string description,
    4: optional i16 utc_time,
    5: optional string facebook_url,
    6: optional string start_datetime,
    7: optional string end_datetime,
}

struct userAreaData {
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

"""

# Extract userContentsData and its dependencies from userLogin_en.thrift
with open(os.path.join(src_dir, "user_userLogin_en.thrift"), "r") as f:
    login_content = f.read()

# We need structs from userData up to userContentsData
# The structs are userAchievement, userBuff, ..., UserSelectReward, userContentsData, userData (maybe userData too?)
# userData is used in userLoginRetDataInfo
# We will just copy all these structs manually into common.thrift or use a regex.
# Actually, the userContentsData related structs start at "struct userData" and end right before "struct userLoginRetDataInfo".

match = re.search(r'(struct userData \{.*?\})\s*struct userLoginRetDataInfo', login_content, re.DOTALL)
if match:
    common_thrift += match.group(1) + "\n"

with open(os.path.join(dst_dir, "common.thrift"), "w") as f:
    f.write(common_thrift)

# Structs to remove from individual endpoint files (since they are in common.thrift)
common_structs = [
    "paramData",
    "errorRetCode",
    "serverTimeRet",
    "maintenanceData",
    "userAreaData",
    "userData",
    "userAchievement",
    "userBuff",
    "userCandyShop",
    "userCharacter",
    "userCostume",
    "userDailyMission",
    "userFollower",
    "userMusic",
    "userProp",
    "userUnit",
    "userSkill",
    "userShop",
    "userMessenger",
    "userGuitar",
    "userEventPoint",
    "userSubscribeList",
    "userSubscribePassReward",
    "userTicketCollection",
    "userFollowerQuest",
    "UserFollowerProfileReward",
    "UserFollowerProfile",
    "UserFollowerGiftItem",
    "UserAdList",
    "UserChThirdStage",
    "UserTutorial",
    "UserAdLevel",
    "UserSelectReward",
    "userContentsData"
]

def remove_struct(content, struct_name):
    # Regex to match "struct StructName { ... }"
    pattern = re.compile(rf'struct {struct_name} \{{.*?\}}', re.DOTALL)
    return re.sub(pattern, '', content)

def replace_struct_references(content):
    # Replace references to common structs with common.StructName
    # First, make sure we only match whole words
    for struct_name in common_structs:
        # Replace types for fields e.g., "optional paramData common_data" -> "optional common.paramData common_data"
        content = re.sub(rf'\b{struct_name}\b', rf'common.{struct_name}', content)
    # Revert definitions (just in case they were replaced before removal)
    # Actually, we remove them BEFORE replacing, so it's fine.
    return content

for file in endpoints:
    in_path = os.path.join(src_dir, file)
    out_path = os.path.join(dst_dir, file)
    if not os.path.exists(in_path):
        print(f"File not found: {in_path}")
        continue
        
    with open(in_path, "r") as f:
        content = f.read()
        
    for struct in common_structs:
        content = remove_struct(content, struct)
        
    # Replace the types with common. prefix
    content = replace_struct_references(content)
    
    # Update namespace
    namespace_module = file.replace(".thrift", "")
    content = re.sub(r'namespace py tapsonic', f'namespace py tapsonic.{namespace_module}', content)
    
    # Add include statement after namespace
    content = re.sub(r'(namespace py .*?\n)', r'\1\ninclude "common.thrift"\n', content)
    
    # Clean up multiple blank lines
    content = re.sub(r'\n\s*\n', '\n\n', content)
    
    with open(out_path, "w") as f:
        f.write(content)

print("Done generating thrift_src/")
