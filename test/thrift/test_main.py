from ..conftest import raw_thrift_bytes, roundtrip

from tapsonic.main_Request_en.ttypes import Request, initReturn
from tapsonic.main_defaultSettingList_en.ttypes import defaultSettingList, defaultSettingListReturn
from tapsonic.main_getServerTime_en.ttypes import getServerTime, getServerTimeReturn
from tapsonic.main_getUpdateTime_en.ttypes import getUpdateTime, getUpdateTimeReturn
from tapsonic.main_getEventRewardList_en.ttypes import getEventRewardList, getEventRewardListReturn
from tapsonic.main_getGameDataList_en.ttypes import getGameDataList, getGameDataListReturn


def test_request_request(captures):
    raw = raw_thrift_bytes(captures["/main/Request/en/"]["req_b64"])
    assert roundtrip(raw, Request) == raw


def test_request_response(captures):
    raw = raw_thrift_bytes(captures["/main/Request/en/"]["res_b64"])
    assert roundtrip(raw, initReturn) == raw


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
    
    out_raw_1 = roundtrip(raw, getGameDataListReturn)
    assert len(raw) == len(out_raw_1), "Data was lost during serialization!"
    
    out_raw_2 = roundtrip(out_raw_1, getGameDataListReturn)
    assert out_raw_1 == out_raw_2, "Serialization is unstable!"
