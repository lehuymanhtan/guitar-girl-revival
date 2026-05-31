from ..conftest import raw_thrift_bytes, roundtrip

from tapsonic.general.ttypes import setGameReward, buyCheckReturn
from tapsonic.main_defaultSettingList_en.ttypes import defaultSettingList, defaultSettingListReturn
from tapsonic.main_getServerTime_en.ttypes import getServerTime, getServerTimeReturn
from tapsonic.main_getUpdateTime_en.ttypes import getUpdateTime, getUpdateTimeReturn
from tapsonic.main_getEventRewardList_en.ttypes import getEventRewardList, getEventRewardListReturn
from tapsonic.main_getGameDataList_en.ttypes import getGameDataList, getGameDataListReturn


def test_setgamereward_request(captures):
    raw = raw_thrift_bytes(captures["/main/Request/en/"]["req_b64"])
    assert roundtrip(raw, setGameReward) == raw


def test_buycheckreturn_response(captures):
    raw = raw_thrift_bytes(captures["/main/Request/en/"]["res_b64"])
    assert roundtrip(raw, buyCheckReturn) == raw


def test_defaultsettinglist_request(captures):
    raw = raw_thrift_bytes(captures["/main/defaultSettingList/en/"]["req_b64"])
    assert roundtrip(raw, defaultSettingList) == raw


def test_defaultsettinglist_response(captures):
    raw = raw_thrift_bytes(captures["/main/defaultSettingList/en/"]["res_b64"])
    assert roundtrip(raw, defaultSettingListReturn) == raw


def test_getservertime_request(captures):
    raw = raw_thrift_bytes(captures["/main/getServerTime/en/"]["req_b64"])
    assert roundtrip(raw, getServerTime) == raw


def test_getservertime_response(captures):
    raw = raw_thrift_bytes(captures["/main/getServerTime/en/"]["res_b64"])
    assert roundtrip(raw, getServerTimeReturn) == raw


def test_getupdatetime_request(captures):
    raw = raw_thrift_bytes(captures["/main/getUpdateTime/en/"]["req_b64"])
    assert roundtrip(raw, getUpdateTime) == raw


def test_getupdatetime_response(captures):
    raw = raw_thrift_bytes(captures["/main/getUpdateTime/en/"]["res_b64"])
    assert roundtrip(raw, getUpdateTimeReturn) == raw


def test_geteventrewardlist_request(captures):
    raw = raw_thrift_bytes(captures["/main/getEventRewardList/en/"]["req_b64"])
    assert roundtrip(raw, getEventRewardList) == raw


def test_geteventrewardlist_response(captures):
    raw = raw_thrift_bytes(captures["/main/getEventRewardList/en/"]["res_b64"])
    assert roundtrip(raw, getEventRewardListReturn) == raw


def test_getgamedatalist_request(captures):
    raw = raw_thrift_bytes(captures["/main/getGameDataList/en/"]["req_b64"])
    assert roundtrip(raw, getGameDataList) == raw


def test_getgamedatalist_response(captures):
    raw = raw_thrift_bytes(captures["/main/getGameDataList/en/"]["res_b64"])
    assert roundtrip(raw, getGameDataListReturn) == raw
