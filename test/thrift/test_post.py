from ..conftest import raw_thrift_bytes, roundtrip

from tapsonic.post_getPost_en.ttypes import getPost, getPostReturn
from tapsonic.post_getPostTime_en.ttypes import getPostTime, getPostTimeReturn


def test_getpost_request(captures):
    raw = raw_thrift_bytes(captures["/post/getPost/en/"]["req_b64"])
    assert roundtrip(raw, getPost) == raw


def test_getpost_response(captures):
    raw = raw_thrift_bytes(captures["/post/getPost/en/"]["res_b64"])
    assert roundtrip(raw, getPostReturn) == raw


def test_getposttime_request(captures):
    raw = raw_thrift_bytes(captures["/post/getPostTime/en/"]["req_b64"])
    assert roundtrip(raw, getPostTime) == raw


def test_getposttime_response(captures):
    raw = raw_thrift_bytes(captures["/post/getPostTime/en/"]["res_b64"])
    assert roundtrip(raw, getPostTimeReturn) == raw
