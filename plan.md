# Guitar Girl Server — Rebuild Plan

## Scope

Only endpoints where **both REQ score AND RES score = 1.0** are implemented (32 endpoints).

Excluded (score < 1.0, no raw capture):
- `/main/getEventRewardList/en/` (REQ 0.75)
- `/main/getServerTime/en/` (REQ 0.75)

**Special case — raw binary replay:**
- `/main/getGameDataList/en/` (REQ 0.75, RES 0.83) — struct matching was imperfect but the
  actual server response is captured in `gameapi/views/_raw/getGameDataListResponse.txt`.
  The server will deserialize the binary, patch timestamps, and re-serialize. No codegen needed.

---

## Score-1.0 Endpoint List

| Endpoint | REQ Struct | RES Struct | .thrift |
|----------|-----------|-----------|---------|
| `/eventMode/getSamSeckList/en/` | `getSamSeckList` | `getSamSeckListReturn` | `eventMode_getSamSeckList_en.thrift` |
| `/eventMode/getSamSeckReward/en/` | `getSamSeckReward` | `getSamSeckRewardReturn` | `eventMode_getSamSeckReward_en.thrift` |
| `/main/Request/en/` | `Request` | `buyCheckReturn` | `main_Request_en.thrift` |
| `/main/defaultSettingList/en/` | `defaultSettingList` | `defaultSettingListReturn` | `main_defaultSettingList_en.thrift` |
| `/main/getUpdateTime/en/` | `getUpdateTime` | `getUpdateTimeReturn` | `main_getUpdateTime_en.thrift` |
| `/post/getPost/en/` | `getPost` | `getPostReturn` | `post_getPost_en.thrift` |
| `/post/getPostTime/en/` | `setGameReward` | `buyCheckReturn` | `post_getPostTime_en.thrift` |
| `/store/buyCheck/en/` | `setGameReward` | `buyCheckReturn` | `store_buyCheck_en.thrift` |
| `/store/buyContents/en/` | `buyContents` | `buyContentsReturn` | `store_buyContents_en.thrift` |
| `/store/buyShop/en/` | `buyShop` | `buyShopReturn` | `store_buyShop_en.thrift` |
| `/store/buyVarietyStore/en/` | `setGameReward` | `buyVarietyStoreReturn` | `store_buyVarietyStore_en.thrift` |
| `/store/getVarietyStore/en/` | `getVarietyStore` | `getVarietyStoreReturn` | `store_getVarietyStore_en.thrift` |
| `/user/adViewLog/en/` | `adViewLog` | `adViewLogReturn` | `user_adViewLog_en.thrift` |
| `/user/chThirdStage/en/` | `chThirdStage` | `chThirdStageReturn` | `user_chThirdStage_en.thrift` |
| `/user/completeLog/en/` | `completeLog` | `completeLogReturn` | `user_completeLog_en.thrift` |
| `/user/getChThird/en/` | `getChThird` | `getChThirdReturn` | `user_getChThird_en.thrift` |
| `/user/getChThirdStarReward/en/` | `getChThirdStarReward` | `getChThirdStarRewardReturn` | `user_getChThirdStarReward_en.thrift` |
| `/user/getMusicReward/en/` | `getMusicReward` | `getMusicRewardReturn` | `user_getMusicReward_en.thrift` |
| `/user/lastSaveTime/en/` | `lastSaveTime` | `lastSaveTimeReturn` | `user_lastSaveTime_en.thrift` |
| `/user/paidEventPoint/en/` | `paidEventPoint` | `paidEventPointReturn` | `user_paidEventPoint_en.thrift` |
| `/user/setAdReward/en/` | `setAdReward` | `setAdRewardReturn` | `user_setAdReward_en.thrift` |
| `/user/setAttendance/en/` | `setAttendance` | `setAttendanceReturn` | `user_setAttendance_en.thrift` |
| `/user/setEventReward/en/` | `setEventReward` | `setEventRewardReturn` | `user_setEventReward_en.thrift` |
| `/user/setFollowerProfileGift/en/` | `setFollowerProfileGift` | `setFollowerProfileGiftReturn` | `user_setFollowerProfileGift_en.thrift` |
| `/user/setGameReward/en/` | `setGameReward` | `setGameRewardReturn` | `user_setGameReward_en.thrift` |
| `/user/setPassReward/en/` | `setPassReward` | `setPassRewardReturn` | `user_setPassReward_en.thrift` |
| `/user/setTutorialNew/en/` | `setTutorialNew` | `setTutorialNewReturn` | `user_setTutorialNew_en.thrift` |
| `/user/setUserFollowerProfileReward/en/` | `setUserFollowerProfileReward` | `setUserFollowerProfileRewardReturn` | `user_setUserFollowerProfileReward_en.thrift` |
| `/user/userJoin/en/` | `userJoin` | `userJoinReturn` | `user_userJoin_en.thrift` |
| `/user/userLoad/en/` | `userLoad` | `userLoadReturn` | `user_userLoad_en.thrift` |
| `/user/userLogin/en/` | `userLogin` | `userLoginReturn` | `user_userLogin_en.thrift` |
| `/user/userSave/en/` | `userSave` | `userSaveReturn` | `user_userSave_en.thrift` |

---

## Common Thrift Envelope Pattern

Every **request** struct:
```
struct <Action> {
    1: optional string call,
    2: optional <Action>DataInfo data,
    3: optional paramData common_data,  // field 4 in buyShop (has sub_mode at 3)
}
```

Every **response** struct:
```
struct <Action>Return {
    1: optional errorRetCode error,
    2: optional serverTimeRet server_time,
    3: optional string mode,
    4: optional string call,
    5: optional <Action>RetDataInfo data,
    6: optional maintenanceData maintenance,
}
```

Shared structs across all files → extract into `common.thrift`:
- `paramData`, `errorRetCode`, `serverTimeRet`, `maintenanceData`
- `userContentsData` + all 27 nested list-item structs (used by `userLogin` + `userLoad`)

---

## Project Layout

```
gg_server/
├── manage.py
├── requirements.txt          # django, thrift
├── gg_server/
│   ├── settings.py           # adds thrift_gen/ to sys.path
│   └── urls.py
├── thrift_src/               # cleaned .thrift sources
│   ├── common.thrift
│   └── <all 32 endpoint .thrift files>
├── thrift_gen/               # output of thrift compiler (committed)
│   └── tapsonic/
│       ├── common/ttypes.py
│       └── <one package per endpoint>
├── scripts/
│   └── gen_thrift.ps1
└── gameapi/
    ├── models.py
    ├── urls.py
    ├── thrift_utils.py
    └── views/
        ├── main.py
        ├── user.py
        ├── store.py
        ├── post.py
        └── eventmode.py
```

---

## Phase 1 — Thrift Codegen

### 1.1  Create `thrift_src/common.thrift`

```thrift
namespace py tapsonic.common

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
```

### 1.2  Update each endpoint `.thrift`

- Add `include "common.thrift"` at top.
- Replace inline `paramData`, `errorRetCode`, `serverTimeRet`, `maintenanceData` with `common.<StructName>`.
- Change `namespace py tapsonic` → `namespace py tapsonic.<module>` (e.g. `tapsonic.user_userLogin`).

### 1.3  `scripts/gen_thrift.ps1`

```powershell
$THRIFT = "D:\my program\thrift-compiler\thrift.exe"
$SRC    = ".\thrift_src"
$OUT    = ".\thrift_gen"
Get-ChildItem "$SRC\*.thrift" | ForEach-Object {
    & $THRIFT --gen py -out $OUT $_.FullName
}
```

### 1.4  `settings.py` — add to sys.path

```python
import sys, os
sys.path.insert(0, os.path.join(BASE_DIR, "thrift_gen"))
```

---

## Phase 2 — `gameapi/thrift_utils.py`

```python
import base64
from thrift.transport import TTransport
from thrift.protocol import TBinaryProtocol

def decode_request(raw_b64: str, struct_cls):
    buf = base64.b64decode(raw_b64)
    transport = TTransport.TMemoryBuffer(buf)
    proto = TBinaryProtocol.TBinaryProtocol(transport)
    obj = struct_cls()
    obj.read(proto)
    return obj

def encode_response(thrift_obj) -> bytes:
    buf = TTransport.TMemoryBuffer()
    proto = TBinaryProtocol.TBinaryProtocol(buf)
    thrift_obj.write(proto)
    return buf.getvalue()
```

**View decorator:**

```python
from django.http import HttpResponse
from functools import wraps

def thrift_view(req_cls, res_cls):
    def decorator(fn):
        @wraps(fn)
        def wrapper(request):
            raw = request.POST.get("tapsonic_data", "")
            req_obj = decode_request(raw, req_cls) if raw else req_cls()
            res_obj = fn(request, req_obj)
            return HttpResponse(encode_response(res_obj), content_type="application/octet-stream")
        return wrapper
    return decorator
```

**Helper builders:**

```python
import time
from tapsonic.common.ttypes import errorRetCode, serverTimeRet, maintenanceData

def ok_error():    return errorRetCode(code=0, errmsg="")
def server_time(): ts=int(time.time()); return serverTimeRet(time=ts, datetime=ts*1000)
def no_maintenance(): return maintenanceData(code=0)
```

---

## Phase 3 — Django Models

Based on what `userSave` writes and `userLogin`/`userLoad` reads back:

```
Player
  u_seq (AutoPK)  u_id (str)  uuid  device_uuid
  u_mp (BigInt)   created_at  updated_at

UserAreaInfo        FK(Player)  u_area_num, d_Like, i_UserFanCount, i_UserFanGrade,
                                i_SelectedCostumeId, i_SelectedMusicId, i_SelectedGuitarId,
                                d_Candy, s_TutorialList, s_Gp1, s_Gp2

UserAchievement     FK(Player)  i_id, d_Quantity, s_Quantity
UserBuff            FK(Player)  i_id, i_Level, i_ActiveTime, i_EndTime
UserCandyShop       FK(Player)  i_id, i_CurrentBuyCount, i_TotalBuyCount, l_LastBuyTick, upd_day
UserCharacter       FK(Player)  i_id, i_Level, i_BonusLevel
UserCostume         FK(Player)  i_id, i_Level, i_BonusLevel
UserDailyMission    FK(Player)  i_id, d_Quantity, upd_date
UserFollower        FK(Player)  i_id, i_Level, i_BonusLevel
UserMusic           FK(Player)  i_id, i_Level, i_BonusLevel, b_EncoreBonusAppear,
                                l_EncoreBonusActivateTime, i_EncoreBonusFollowerId, i_ChThirdActiveTime
UserProp            FK(Player)  i_id, i_Level
UserUnit            FK(Player)  i_id, i_Level
UserSkill           FK(Player)  i_id, b_Activate, l_ActivateOnTicks, l_ActivateOffTicks
UserShop            FK(Player)  i_id, i_Count, i_TotalCount, i_PurchaseTime, upd_day
UserMessenger       FK(Player)  i_MessengerChatRoomId, i_LastConfirmIndex, s_UnlockGroupList, l_UpdateTimeTicks
UserGuitar          FK(Player)  i_id, i_Level, i_BonusLevel
UserEventPoint      FK(Player)  s_EventType, i_DataID, i_Point, i_Step, i_ADViewTime, i_Version
UserSubscribeList   FK(Player)  i_SubscribeID, i_ActiveTime, i_isActive
UserSubscribePassReward FK(Player) i_SubscribeID, i_Type, i_Step, i_UpdateTime, i_Version
UserTicketCollection FK(Player) i_id
UserFollowerQuest   FK(Player)  i_id, i_CurrentID, i_CompleteID, d_ConditionValue1..3,
                                i_RewardReceived1..3, i_isInfinity
UserFollowerProfileReward FK(Player) i_id, i_RewardLevel
UserFollowerProfile FK(Player)  i_id, i_Level, d_Exp, i_AddCandy
UserFollowerGiftItem FK(Player) i_id, i_Value
UserAdList          FK(Player)  i_id, i_Count, i_TotalCount, i_LastViewTime
UserChThirdStage    FK(Player)  i_id, i_ChapterId, i_StageIndex, i_Star
UserTutorial        FK(Player)  i_id
UserAdLevel         FK(Player)  i_id, i_Level, i_EXP
UserSelectReward    FK(Player)  i_GroupId, i_RewardGroupId, i_AltRewardGroupId
UserFollowerQuestSave FK(Player) i_CurrentID, d_ConditionValue1..3
AttendanceLog       FK(Player)  day (DateField), rewarded_at
EventReward         FK(Player)  event_type, step, received_at
```

> `userAreaData` in the `map<i32, userAreaData>` of the login/load response maps to `UserAreaInfo`, keyed by `u_area_num`.

---

## Phase 4 — View Logic

### `views/main.py`

| View | Logic |
|------|-------|
| `init_request` | Decode `Request`; return `buyCheckReturn(data.result="ok")` — no DB |
| `default_setting_list` | Return static `defaultSettingListReturn` |
| `get_update_time` | Return `getUpdateTimeReturn(data.upd_time=int(time.time()))` |
| `get_game_data_list` | **Raw replay**: load `_raw/getGameDataListResponse.txt`, deserialize into the generated struct (best-effort), patch `responseTime` + `server_time`, cache in memory, return serialized bytes |

### `views/user.py`

| View | Logic |
|------|-------|
| `user_join` | Create `Player(uuid, device_uuid)`; return `userJoinReturn(data.u_seq=pk, data.u_id=str(pk))` |
| `user_login` | Lookup Player; serialize all related models → `userLoginReturn` with full `userContentsData` |
| `user_load` | Same logic as `user_login`; return `userLoadReturn` |
| `user_save` | Decode all 18 list fields; `update_or_create` each row; return `userSaveReturn(data.status="ok")` |
| `last_save_time` | Return current timestamp |
| `set_tutorial_new` | Upsert `UserTutorial` rows |
| `set_game_reward` | Apply reward delta to player; return updated state |
| `set_attendance` | Check `AttendanceLog` for today; insert + apply reward if new |
| `set_event_reward` | Upsert `EventReward` |
| `set_pass_reward` | Upsert `UserSubscribePassReward` |
| `get_music_reward` | Check `UserMusic` encore bonus; return reward |
| `get_ch_third` | Return all `UserChThirdStage` rows |
| `get_ch_third_star_reward` | Process star reward claim |
| `ch_third_stage` | Upsert `UserChThirdStage` |
| `ad_view_log` | Upsert `UserAdList` |
| `set_ad_reward` | Apply ad reward |
| `paid_event_point` | Upsert `UserEventPoint` |
| `set_follower_profile_gift` | Upsert `UserFollowerGiftItem` |
| `set_user_follower_profile_reward` | Upsert `UserFollowerProfileReward` |
| `complete_log` | Log event; return `error.code=0` |

### `views/store.py`

| View | Logic |
|------|-------|
| `buy_check` | Always return `buyCheckReturn(data.result="ok")` |
| `buy_shop` | Skip receipt validation; grant items; return `buyShopReturn` with updated `u_cp`, `u_candy`, `reward_data` |
| `buy_contents` | Grant content items |
| `get_variety_store` | Return static store listing |
| `buy_variety_store` | Apply purchase |

### `views/post.py`

| View | Logic |
|------|-------|
| `get_post` | Return static post/announcement list |
| `get_post_time` | Return `buyCheckReturn` with server time |

### `views/eventmode.py`

| View | Logic |
|------|-------|
| `get_sam_seck_list` | Return static or DB reward list |
| `get_sam_seck_reward` | Grant reward; return result |

---

## Phase 5 — `gameapi/urls.py`

```python
from django.urls import path
from gameapi.views import main, user, store, post, eventmode

urlpatterns = [
    path('main/Request/en/',             main.init_request),
    path('main/defaultSettingList/en/',  main.default_setting_list),
    path('main/getUpdateTime/en/',       main.get_update_time),

    path('user/userJoin/en/',                     user.user_join),
    path('user/userLogin/en/',                    user.user_login),
    path('user/userLoad/en/',                     user.user_load),
    path('user/userSave/en/',                     user.user_save),
    path('user/lastSaveTime/en/',                 user.last_save_time),
    path('user/setTutorialNew/en/',               user.set_tutorial_new),
    path('user/setGameReward/en/',                user.set_game_reward),
    path('user/setAttendance/en/',                user.set_attendance),
    path('user/setEventReward/en/',               user.set_event_reward),
    path('user/setPassReward/en/',                user.set_pass_reward),
    path('user/getMusicReward/en/',               user.get_music_reward),
    path('user/getChThird/en/',                   user.get_ch_third),
    path('user/getChThirdStarReward/en/',         user.get_ch_third_star_reward),
    path('user/chThirdStage/en/',                 user.ch_third_stage),
    path('user/adViewLog/en/',                    user.ad_view_log),
    path('user/setAdReward/en/',                  user.set_ad_reward),
    path('user/paidEventPoint/en/',               user.paid_event_point),
    path('user/setFollowerProfileGift/en/',       user.set_follower_profile_gift),
    path('user/setUserFollowerProfileReward/en/', user.set_user_follower_profile_reward),
    path('user/completeLog/en/',                  user.complete_log),

    path('store/buyCheck/en/',           store.buy_check),
    path('store/buyShop/en/',            store.buy_shop),
    path('store/buyContents/en/',        store.buy_contents),
    path('store/getVarietyStore/en/',    store.get_variety_store),
    path('store/buyVarietyStore/en/',    store.buy_variety_store),

    path('post/getPost/en/',             post.get_post),
    path('post/getPostTime/en/',         post.get_post_time),

    path('eventMode/getSamSeckList/en/',   eventmode.get_sam_seck_list),
    path('eventMode/getSamSeckReward/en/', eventmode.get_sam_seck_reward),
]
```

---

## Phase 6 — Implementation Order

1. Run `gen_thrift.ps1` → verify imports work.
2. Write `thrift_utils.py` (decode/encode + decorator + helpers).
3. Write `models.py` → `makemigrations` + `migrate`.
4. `/main/Request/en/` — no DB, validates codegen path.
5. `/user/userJoin/en/` — first DB write, creates Player.
6. `/user/userLogin/en/` — largest response, validates full read path.
7. `/user/userLoad/en/` — reuses login logic.
8. `/user/userSave/en/` — validates full upsert path.
9. All remaining endpoints (simple stubs first, then reward logic).

---

## Gotchas

- **`userAreaData` missing**: referenced in `map<i32, userAreaData>` in login/load responses but never defined in the thrift files. Needs to be hand-crafted from captured traffic or treated as `UserAreaInfo`.
- **`buyShop` envelope**: field 3 is `sub_mode` (string), `common_data` is field 4 — different from other endpoints.
- **Shared REQ struct**: `/post/getPostTime/`, `/store/buyCheck/`, `/store/buyVarietyStore/` all decode as `setGameReward` struct.
- **`server_time.datetime`** is `i64` → use **milliseconds** epoch.
- Always return `maintenance` as `null` or `code=0` to avoid the client showing a maintenance screen.
- `userSave` uses *save-specific* sub-structs (e.g. `saveUserAchievement`) that differ from the read-back structs in `userLogin` — unify at the DB layer.
- Run `makemigrations` after every model change before testing.
