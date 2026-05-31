from ..conftest import raw_thrift_bytes, roundtrip

from tapsonic.store_buyCheck_en.ttypes import buyCheck, buyCheckReturn
from tapsonic.store_buyShop_en.ttypes import buyShop, buyShopReturn
from tapsonic.store_buyContents_en.ttypes import buyContents, buyContentsReturn
from tapsonic.store_getVarietyStore_en.ttypes import getVarietyStore, getVarietyStoreReturn
from tapsonic.store_buyVarietyStore_en.ttypes import buyVarietyStore, buyVarietyStoreReturn


def test_buycheck_request(captures):
    raw = raw_thrift_bytes(captures["/store/buyCheck/en/"]["req_b64"])
    assert roundtrip(raw, buyCheck) == raw


def test_buycheck_response(captures):
    raw = raw_thrift_bytes(captures["/store/buyCheck/en/"]["res_b64"])
    assert roundtrip(raw, buyCheckReturn) == raw


def test_buyshop_request(captures):
    raw = raw_thrift_bytes(captures["/store/buyShop/en/"]["req_b64"])
    assert roundtrip(raw, buyShop) == raw


def test_buyshop_response(captures):
    raw = raw_thrift_bytes(captures["/store/buyShop/en/"]["res_b64"])
    assert roundtrip(raw, buyShopReturn) == raw


def test_buycontents_request(captures):
    raw = raw_thrift_bytes(captures["/store/buyContents/en/"]["req_b64"])
    assert roundtrip(raw, buyContents) == raw


def test_buycontents_response(captures):
    raw = raw_thrift_bytes(captures["/store/buyContents/en/"]["res_b64"])
    assert roundtrip(raw, buyContentsReturn) == raw


def test_getvarietystore_request(captures):
    raw = raw_thrift_bytes(captures["/store/getVarietyStore/en/"]["req_b64"])
    assert roundtrip(raw, getVarietyStore) == raw


def test_getvarietystore_response(captures):
    raw = raw_thrift_bytes(captures["/store/getVarietyStore/en/"]["res_b64"])
    assert roundtrip(raw, getVarietyStoreReturn) == raw


def test_buyvarietystore_request(captures):
    raw = raw_thrift_bytes(captures["/store/buyVarietyStore/en/"]["req_b64"])
    assert roundtrip(raw, buyVarietyStore) == raw


def test_buyvarietystore_response(captures):
    raw = raw_thrift_bytes(captures["/store/buyVarietyStore/en/"]["res_b64"])
    assert roundtrip(raw, buyVarietyStoreReturn) == raw
