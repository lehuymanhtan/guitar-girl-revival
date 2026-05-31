# Implementation Plan: Pytest Thrift Capture Validation Tests

## Goal

For every endpoint in the Burp captures, create **2 pytest unit tests**:

1. **`test_<action>_request`** — decode the raw `tapsonic_data` bytes into the compiled Thrift REQ struct, re-encode back to bytes, assert they are **byte-for-byte identical** to the original.
2. **`test_<action>_response`** — same for the HTTP response body bytes → RES struct → re-encode → compare.

This proves the compiled Thrift structs are a **perfect match** for the real traffic — any wrong field ID, wrong type, or missing field will cause the re-encoded bytes to differ.

---

## About `main/getGameDataList/en/`

The `getGameDataList` response is a huge blob (~18 MB when uncompressed). The struct was reverse-engineered from the IL2CPP dump and is **still being refined**. The strict byte-equality test will initially **fail** until every field ID and type is correct — that is precisely the point. The failing diff will show exactly which fields are mismatched, guiding further struct corrections.

All **36 endpoints** are included.

---

## Decode Pipeline

Both `tapsonic_data` (in the POST body) and the response body (after HTTP headers) are encoded the same way:

```
bzip2_compress(thrift_binary)  →  base64_encode  →  URL-encode
```

Decoding:
```python
import base64, bz2, urllib.parse

def raw_thrift_bytes(b64_urlencoded: str) -> bytes:
    unquoted = urllib.parse.unquote(b64_urlencoded)
    # base64 padding may be missing — add it back
    unquoted += "=" * (-len(unquoted) % 4)
    return bz2.decompress(base64.b64decode(unquoted))
```

The raw bytes are then fed into `TBinaryProtocol` via `TMemoryBuffer`.

---

## Round-Trip Assertion (core test logic)

```python
from thrift.transport import TTransport
from thrift.protocol import TBinaryProtocol

def roundtrip(raw: bytes, struct_cls) -> bytes:
    # 1. Decode
    transport = TTransport.TMemoryBuffer(raw)
    proto = TBinaryProtocol.TBinaryProtocol(transport)
    obj = struct_cls()
    obj.read(proto)
    # 2. Re-encode
    buf = TTransport.TMemoryBuffer()
    proto_out = TBinaryProtocol.TBinaryProtocol(buf)
    obj.write(proto_out)
    return buf.getvalue()

# In each test:
assert roundtrip(raw, MyStruct) == raw
```

> **Why this works:** Thrift binary protocol is deterministic — same field values always produce identical bytes. If the struct definition is wrong (bad field ID, bad type), the decoder either crashes or silently skips the field, so the re-encoded output will differ from (or be shorter than) the original.

---

## Project Layout (new files)

```
gg_server/
├── pytest.ini
├── test/
│   ├── conftest.py
│   ├── fixtures/
│   │   └── captures.json          ← pre-extracted, committed
│   └── thrift/
│       ├── __init__.py
│       ├── test_eventmode.py      ← 2 endpoints × 2 = 4 tests
│       ├── test_main.py           ← 5 endpoints × 2 = 10 tests
│       ├── test_post.py           ← 2 endpoints × 2 = 4 tests
│       ├── test_store.py          ← 5 endpoints × 2 = 10 tests
│       └── test_user.py           ← 22 endpoints × 2 = 44 tests
└── scripts/
    └── extract_captures.py        ← run once to build captures.json
```

---

## Proposed Changes

---

### Step 1 — Extraction Script

#### [NEW] `scripts/extract_captures.py`

Parses both XML files in `burp_capture/`, filters to `game.gtgl.pmang.cloud` only, and for each **unique** endpoint path takes the **first** occurrence. Writes `test/fixtures/captures.json`:

```json
{
  "/main/Request/en/": {
    "req_b64":  "QlpoMzFBWSZTWS...",
    "res_b64":  "QlpoNDFBWSZTWZ..."
  },
  "/main/getServerTime/en/": { ... },
  ...
}
```

Extraction logic:
- Request body is URL-encoded form data; extract `tapsonic_data` field value.
- Response body is everything after the blank line (`\r\n\r\n`) in the raw HTTP response text.
- Both values go into the JSON as-is (still bzip2+base64) — tests decode on the fly.

Running: `python scripts/extract_captures.py` (one-off, output committed).

---

### Step 2 — `conftest.py`

#### [NEW] `test/conftest.py`

```python
import sys, os, json, base64, bz2, urllib.parse
import pytest
from thrift.transport import TTransport
from thrift.protocol import TBinaryProtocol

# Add thrift_gen/ to sys.path so compiled modules are importable
sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "thrift_gen"))

FIXTURES = os.path.join(os.path.dirname(__file__), "fixtures", "captures.json")

@pytest.fixture(scope="session")
def captures():
    with open(FIXTURES) as f:
        return json.load(f)

def raw_thrift_bytes(b64_urlencoded: str) -> bytes:
    unquoted = urllib.parse.unquote(b64_urlencoded)
    unquoted += "=" * (-len(unquoted) % 4)
    return bz2.decompress(base64.b64decode(unquoted))

def roundtrip(raw: bytes, struct_cls) -> bytes:
    transport = TTransport.TMemoryBuffer(raw)
    proto = TBinaryProtocol.TBinaryProtocol(transport)
    obj = struct_cls()
    obj.read(proto)
    buf = TTransport.TMemoryBuffer()
    proto_out = TBinaryProtocol.TBinaryProtocol(buf)
    obj.write(proto_out)
    return buf.getvalue()
```

Both `raw_thrift_bytes` and `roundtrip` are plain functions (not fixtures) — imported directly in test files.

---

### Step 3 — Test Files

**Test template** (2 tests per endpoint):

```python
from conftest import raw_thrift_bytes, roundtrip
from tapsonic.<module>.ttypes import ReqStruct, ResStruct

def test_<action>_request(captures):
    raw = raw_thrift_bytes(captures["/group/action/en/"]["req_b64"])
    assert roundtrip(raw, ReqStruct) == raw

def test_<action>_response(captures):
    raw = raw_thrift_bytes(captures["/group/action/en/"]["res_b64"])
    assert roundtrip(raw, ResStruct) == raw
```

---

#### [NEW] `test/thrift/test_main.py` — 12 tests

| Endpoint | REQ struct | RES struct | Module | Notes |
|----------|-----------|-----------|--------|-------|
| `/main/Request/en/` | `general.setGameReward` | `general.buyCheckReturn` | `tapsonic.general` | |
| `/main/defaultSettingList/en/` | `defaultSettingList` | `defaultSettingListReturn` | `tapsonic.main_defaultSettingList_en` | |
| `/main/getServerTime/en/` | `getServerTime` | `getServerTimeReturn` | `tapsonic.main_getServerTime_en` | |
| `/main/getUpdateTime/en/` | `getUpdateTime` | `getUpdateTimeReturn` | `tapsonic.main_getUpdateTime_en` | |
| `/main/getEventRewardList/en/` | `getEventRewardList` | `getEventRewardListReturn` | `tapsonic.main_getEventRewardList_en` | |
| `/main/getGameDataList/en/` | `getGameDataList` | `getGameDataListReturn` | `tapsonic.main_getGameDataList_en` | ⚠ struct in progress — test expected to fail until perfect |

---

#### [NEW] `test/thrift/test_user.py` — 44 tests

| Endpoint | REQ struct | RES struct | Module |
|----------|-----------|-----------|--------|
| `/user/userJoin/en/` | `userJoin` | `userJoinReturn` | `tapsonic.user_userJoin_en` |
| `/user/userLogin/en/` | `userLogin` | `userLoginReturn` | `tapsonic.user_userLogin_en` |
| `/user/userLoad/en/` | `userLoad` | `userLoadReturn` | `tapsonic.user_userLoad_en` |
| `/user/userSave/en/` | `userSave` | `userSaveReturn` | `tapsonic.user_userSave_en` |
| `/user/lastSaveTime/en/` | `lastSaveTime` | `lastSaveTimeReturn` | `tapsonic.user_lastSaveTime_en` |
| `/user/setTutorialNew/en/` | `setTutorialNew` | `setTutorialNewReturn` | `tapsonic.user_setTutorialNew_en` |
| `/user/setGameReward/en/` | `setGameReward` | `setGameRewardReturn` | `tapsonic.user_setGameReward_en` |
| `/user/setAttendance/en/` | `setAttendance` | `setAttendanceReturn` | `tapsonic.user_setAttendance_en` |
| `/user/setEventReward/en/` | `setEventReward` | `setEventRewardReturn` | `tapsonic.user_setEventReward_en` |
| `/user/setPassReward/en/` | `setPassReward` | `setPassRewardReturn` | `tapsonic.user_setPassReward_en` |
| `/user/getMusicReward/en/` | `getMusicReward` | `getMusicRewardReturn` | `tapsonic.user_getMusicReward_en` |
| `/user/getChThird/en/` | `getChThird` | `getChThirdReturn` | `tapsonic.user_getChThird_en` |
| `/user/getChThirdStarReward/en/` | `getChThirdStarReward` | `getChThirdStarRewardReturn` | `tapsonic.user_getChThirdStarReward_en` |
| `/user/chThirdStage/en/` | `chThirdStage` | `chThirdStageReturn` | `tapsonic.user_chThirdStage_en` |
| `/user/adViewLog/en/` | `adViewLog` | `adViewLogReturn` | `tapsonic.user_adViewLog_en` |
| `/user/setAdReward/en/` | `setAdReward` | `setAdRewardReturn` | `tapsonic.user_setAdReward_en` |
| `/user/paidEventPoint/en/` | `paidEventPoint` | `paidEventPointReturn` | `tapsonic.user_paidEventPoint_en` |
| `/user/setFollowerProfileGift/en/` | `setFollowerProfileGift` | `setFollowerProfileGiftReturn` | `tapsonic.user_setFollowerProfileGift_en` |
| `/user/setUserFollowerProfileReward/en/` | `setUserFollowerProfileReward` | `setUserFollowerProfileRewardReturn` | `tapsonic.user_setUserFollowerProfileReward_en` |
| `/user/completeLog/en/` | `completeLog` | `completeLogReturn` | `tapsonic.user_completeLog_en` |
| `/user/userJoin/en/` *(new account)* | same structs | same structs | same module |

> Note: `userJoin` only appears in the "new account" XML — it will be found when both files are parsed.

---

#### [NEW] `test/thrift/test_store.py` — 10 tests

| Endpoint | REQ struct | RES struct | Module |
|----------|-----------|-----------|--------|
| `/store/buyCheck/en/` | `general.setGameReward` | `general.buyCheckReturn` | `tapsonic.general` |
| `/store/buyShop/en/` | `buyShop` | `buyShopReturn` | `tapsonic.store_buyShop_en` |
| `/store/buyContents/en/` | `buyContents` | `buyContentsReturn` | `tapsonic.store_buyContents_en` |
| `/store/getVarietyStore/en/` | `getVarietyStore` | `getVarietyStoreReturn` | `tapsonic.store_getVarietyStore_en` |
| `/store/buyVarietyStore/en/` | `general.setGameReward` | `buyVarietyStoreReturn` | `tapsonic.store_buyVarietyStore_en` |

---

#### [NEW] `test/thrift/test_post.py` — 4 tests

| Endpoint | REQ struct | RES struct | Module |
|----------|-----------|-----------|--------|
| `/post/getPost/en/` | `getPost` | `getPostReturn` | `tapsonic.post_getPost_en` |
| `/post/getPostTime/en/` | `general.setGameReward` | `general.buyCheckReturn` | `tapsonic.general` |

---

#### [NEW] `test/thrift/test_eventmode.py` — 4 tests

| Endpoint | REQ struct | RES struct | Module |
|----------|-----------|-----------|--------|
| `/eventMode/getSamSeckList/en/` | `getSamSeckList` | `getSamSeckListReturn` | `tapsonic.eventMode_getSamSeckList_en` |
| `/eventMode/getSamSeckReward/en/` | `getSamSeckReward` | `getSamSeckRewardReturn` | `tapsonic.eventMode_getSamSeckReward_en` |

---

### Step 4 — pytest config

#### [NEW] `pytest.ini`

```ini
[pytest]
testpaths = test
python_files = test_*.py
python_functions = test_*
```

---

### Step 5 — File cleanup

#### [DELETE] `thrift_found.md`

This file tracked scoring metadata from an earlier analysis phase. Per your request, it will be deleted.

---

## Test Count Summary

| File | Endpoints | Tests |
|------|-----------|-------|
| `test_main.py` | 6 | 12 |
| `test_user.py` | 22 | 44 |
| `test_store.py` | 5 | 10 |
| `test_post.py` | 2 | 4 |
| `test_eventmode.py` | 2 | 4 |
| **Total** | **37** | **74** |

> ⚠ `main/getGameDataList/en/` is included but its response test is **expected to fail** until the struct in `tapsonic.main_getGameDataList_en` is fully corrected. Failures will show exactly which bytes diverge, guiding struct fixes.

---

## Using `getGameDataList` test failures as a diagnostic tool

When the struct is still imperfect, the test failure output will look like:

```
AssertionError: assert b'\x0c\x00\x05...(N bytes)' == b'\x0c\x00\x05...(M bytes)'
# Left (re-encoded) shorter than right (original)
# → decoder silently skipped fields with wrong IDs or types
```

By comparing the byte lengths and diffing the hex output you can identify which sub-struct is losing data. Each fix narrows the gap. The test passes when `len(re-encoded) == len(original)` and they are byte-identical.

---

## Verification Plan

### Automated

```powershell
# 1. Generate fixtures (once)
.venv\Scripts\python scripts\extract_captures.py

# 2. Run all tests
.venv\Scripts\python -m pytest test\thrift\ -v --tb=short
```

Expected: 72 tests pass. Any failure means the corresponding struct has at least one wrong field ID or type.

### What a failure looks like

```
FAILED test/thrift/test_user.py::test_userLogin_response
AssertionError: assert b'\x0c\x00\x01...' == b'\x0c\x00\x01...'
# Left side (re-encoded) is shorter → decoder skipped an unknown field
# → field ID mismatch in userLoginReturn or one of its nested structs
```
