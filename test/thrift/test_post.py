from ..conftest import raw_thrift_bytes, roundtrip

from tapsonic.post_getPost_en.ttypes import getPost, getPostReturn
from tapsonic.general.ttypes import setGameReward, buyCheckReturn


def test_getpost_request(captures):
    raw = raw_thrift_bytes(captures["/post/getPost/en/"]["req_b64"])
    assert roundtrip(raw, getPost) == raw


def test_getpost_response(captures):
    raw = raw_thrift_bytes(captures["/post/getPost/en/"]["res_b64"])
    assert roundtrip(raw, getPostReturn) == raw


def test_getposttime_request(captures):
    raw = raw_thrift_bytes(captures["/post/getPostTime/en/"]["req_b64"])
    assert roundtrip(raw, setGameReward) == raw


def test_getposttime_response(captures):
    raw = raw_thrift_bytes(captures["/post/getPostTime/en/"]["res_b64"])
    assert roundtrip(raw, buyCheckReturn) == raw
