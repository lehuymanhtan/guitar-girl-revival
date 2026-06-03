from ..conftest import raw_thrift_bytes, roundtrip

from tapsonic.eventMode_getSamSeckList_en.ttypes import getSamSeckList, getSamSeckListReturn
from tapsonic.eventMode_getSamSeckReward_en.ttypes import getSamSeckReward, getSamSeckRewardReturn


def test_getsamsecklist_request(captures):
    raw = raw_thrift_bytes(captures["/eventMode/getSamSeckList/en/"]["req_b64"])
    assert roundtrip(raw, getSamSeckList) == raw


def test_getsamsecklist_response(captures):
    raw = raw_thrift_bytes(captures["/eventMode/getSamSeckList/en/"]["res_b64"])
    assert roundtrip(raw, getSamSeckListReturn) == raw


def test_getsamseckreward_request(captures):
    raw = raw_thrift_bytes(captures["/eventMode/getSamSeckReward/en/"]["req_b64"])
    assert roundtrip(raw, getSamSeckReward) == raw


def test_getsamseckreward_response(captures):
    raw = raw_thrift_bytes(captures["/eventMode/getSamSeckReward/en/"]["res_b64"])
    assert roundtrip(raw, getSamSeckRewardReturn) == raw
