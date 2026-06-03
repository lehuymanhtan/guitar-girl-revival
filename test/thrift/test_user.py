from ..conftest import raw_thrift_bytes, roundtrip

from tapsonic.user_userLogin_en.ttypes import userLogin, userLoginReturn
from tapsonic.user_userLoad_en.ttypes import userLoad, userLoadReturn
from tapsonic.user_userSave_en.ttypes import userSave, userSaveReturn
from tapsonic.user_lastSaveTime_en.ttypes import lastSaveTime, lastSaveTimeReturn
from tapsonic.user_setGameReward_en.ttypes import setGameReward, setGameRewardReturn
from tapsonic.user_setAttendance_en.ttypes import setAttendance, setAttendanceReturn
from tapsonic.user_setPassReward_en.ttypes import setPassReward, setPassRewardReturn
from tapsonic.user_getMusicReward_en.ttypes import getMusicReward, getMusicRewardReturn
from tapsonic.user_getChThird_en.ttypes import getChThird, getChThirdReturn
from tapsonic.user_chThirdStage_en.ttypes import chThirdStage, chThirdStageReturn
from tapsonic.user_paidEventPoint_en.ttypes import paidEventPoint, paidEventPointReturn
from tapsonic.user_setFollowerProfileGift_en.ttypes import setFollowerProfileGift, setFollowerProfileGiftReturn
from tapsonic.user_completeLog_en.ttypes import completeLog, completeLogReturn
from tapsonic.user_userJoin_en.ttypes import userJoin, userJoinReturn
from tapsonic.user_setTutorialNew_en.ttypes import setTutorialNew, setTutorialNewReturn
from tapsonic.user_setEventReward_en.ttypes import setEventReward, setEventRewardReturn
from tapsonic.user_getChThirdStarReward_en.ttypes import getChThirdStarReward, getChThirdStarRewardReturn
from tapsonic.user_adViewLog_en.ttypes import adViewLog, adViewLogReturn
from tapsonic.user_setAdReward_en.ttypes import setAdReward, setAdRewardReturn
from tapsonic.user_setUserFollowerProfileReward_en.ttypes import setUserFollowerProfileReward, setUserFollowerProfileRewardReturn


def test_userlogin_request(captures):
    raw = raw_thrift_bytes(captures["/user/userLogin/en/"]["req_b64"])
    assert roundtrip(raw, userLogin) == raw


def test_userlogin_response(captures):
    raw = raw_thrift_bytes(captures["/user/userLogin/en/"]["res_b64"])
    assert roundtrip(raw, userLoginReturn) == raw


def test_userload_request(captures):
    raw = raw_thrift_bytes(captures["/user/userLoad/en/"]["req_b64"])
    assert roundtrip(raw, userLoad) == raw


def test_userload_response(captures):
    raw = raw_thrift_bytes(captures["/user/userLoad/en/"]["res_b64"])
    assert roundtrip(raw, userLoadReturn) == raw


def test_usersave_request(captures):
    raw = raw_thrift_bytes(captures["/user/userSave/en/"]["req_b64"])
    assert roundtrip(raw, userSave) == raw


def test_usersave_response(captures):
    raw = raw_thrift_bytes(captures["/user/userSave/en/"]["res_b64"])
    assert roundtrip(raw, userSaveReturn) == raw


def test_lastsavetime_request(captures):
    raw = raw_thrift_bytes(captures["/user/lastSaveTime/en/"]["req_b64"])
    assert roundtrip(raw, lastSaveTime) == raw


def test_lastsavetime_response(captures):
    raw = raw_thrift_bytes(captures["/user/lastSaveTime/en/"]["res_b64"])
    assert roundtrip(raw, lastSaveTimeReturn) == raw


def test_setgamereward_request(captures):
    raw = raw_thrift_bytes(captures["/user/setGameReward/en/"]["req_b64"])
    assert roundtrip(raw, setGameReward) == raw


def test_setgamereward_response(captures):
    raw = raw_thrift_bytes(captures["/user/setGameReward/en/"]["res_b64"])
    assert roundtrip(raw, setGameRewardReturn) == raw


def test_setattendance_request(captures):
    raw = raw_thrift_bytes(captures["/user/setAttendance/en/"]["req_b64"])
    assert roundtrip(raw, setAttendance) == raw


def test_setattendance_response(captures):
    raw = raw_thrift_bytes(captures["/user/setAttendance/en/"]["res_b64"])
    assert roundtrip(raw, setAttendanceReturn) == raw


def test_setpassreward_request(captures):
    raw = raw_thrift_bytes(captures["/user/setPassReward/en/"]["req_b64"])
    assert roundtrip(raw, setPassReward) == raw


def test_setpassreward_response(captures):
    raw = raw_thrift_bytes(captures["/user/setPassReward/en/"]["res_b64"])
    assert roundtrip(raw, setPassRewardReturn) == raw


def test_getmusicreward_request(captures):
    raw = raw_thrift_bytes(captures["/user/getMusicReward/en/"]["req_b64"])
    assert roundtrip(raw, getMusicReward) == raw


def test_getmusicreward_response(captures):
    raw = raw_thrift_bytes(captures["/user/getMusicReward/en/"]["res_b64"])
    assert roundtrip(raw, getMusicRewardReturn) == raw


def test_getcththird_request(captures):
    raw = raw_thrift_bytes(captures["/user/getChThird/en/"]["req_b64"])
    assert roundtrip(raw, getChThird) == raw


def test_getcththird_response(captures):
    raw = raw_thrift_bytes(captures["/user/getChThird/en/"]["res_b64"])
    assert roundtrip(raw, getChThirdReturn) == raw


def test_chthirdstage_request(captures):
    raw = raw_thrift_bytes(captures["/user/chThirdStage/en/"]["req_b64"])
    assert roundtrip(raw, chThirdStage) == raw


def test_chthirdstage_response(captures):
    raw = raw_thrift_bytes(captures["/user/chThirdStage/en/"]["res_b64"])
    assert roundtrip(raw, chThirdStageReturn) == raw


def test_paideventpoint_request(captures):
    raw = raw_thrift_bytes(captures["/user/paidEventPoint/en/"]["req_b64"])
    assert roundtrip(raw, paidEventPoint) == raw


def test_paideventpoint_response(captures):
    raw = raw_thrift_bytes(captures["/user/paidEventPoint/en/"]["res_b64"])
    assert roundtrip(raw, paidEventPointReturn) == raw


def test_setfollowerprofilegift_request(captures):
    raw = raw_thrift_bytes(captures["/user/setFollowerProfileGift/en/"]["req_b64"])
    assert roundtrip(raw, setFollowerProfileGift) == raw


def test_setfollowerprofilegift_response(captures):
    raw = raw_thrift_bytes(captures["/user/setFollowerProfileGift/en/"]["res_b64"])
    assert roundtrip(raw, setFollowerProfileGiftReturn) == raw


def test_completelog_request(captures):
    raw = raw_thrift_bytes(captures["/user/completeLog/en/"]["req_b64"])
    assert roundtrip(raw, completeLog) == raw


def test_completelog_response(captures):
    raw = raw_thrift_bytes(captures["/user/completeLog/en/"]["res_b64"])
    assert roundtrip(raw, completeLogReturn) == raw


def test_userjoin_request(captures):
    raw = raw_thrift_bytes(captures["/user/userJoin/en/"]["req_b64"])
    assert roundtrip(raw, userJoin) == raw


def test_userjoin_response(captures):
    raw = raw_thrift_bytes(captures["/user/userJoin/en/"]["res_b64"])
    assert roundtrip(raw, userJoinReturn) == raw


def test_settutorialnew_request(captures):
    raw = raw_thrift_bytes(captures["/user/setTutorialNew/en/"]["req_b64"])
    assert roundtrip(raw, setTutorialNew) == raw


def test_settutorialnew_response(captures):
    raw = raw_thrift_bytes(captures["/user/setTutorialNew/en/"]["res_b64"])
    assert roundtrip(raw, setTutorialNewReturn) == raw


def test_seteventreward_request(captures):
    raw = raw_thrift_bytes(captures["/user/setEventReward/en/"]["req_b64"])
    assert roundtrip(raw, setEventReward) == raw


def test_seteventreward_response(captures):
    raw = raw_thrift_bytes(captures["/user/setEventReward/en/"]["res_b64"])
    assert roundtrip(raw, setEventRewardReturn) == raw


def test_getchthirdstarreward_request(captures):
    raw = raw_thrift_bytes(captures["/user/getChThirdStarReward/en/"]["req_b64"])
    assert roundtrip(raw, getChThirdStarReward) == raw


def test_getchthirdstarreward_response(captures):
    raw = raw_thrift_bytes(captures["/user/getChThirdStarReward/en/"]["res_b64"])
    assert roundtrip(raw, getChThirdStarRewardReturn) == raw


def test_adviewlog_request(captures):
    raw = raw_thrift_bytes(captures["/user/adViewLog/en/"]["req_b64"])
    assert roundtrip(raw, adViewLog) == raw


def test_adviewlog_response(captures):
    raw = raw_thrift_bytes(captures["/user/adViewLog/en/"]["res_b64"])
    assert roundtrip(raw, adViewLogReturn) == raw


def test_setadreward_request(captures):
    raw = raw_thrift_bytes(captures["/user/setAdReward/en/"]["req_b64"])
    assert roundtrip(raw, setAdReward) == raw


def test_setadreward_response(captures):
    raw = raw_thrift_bytes(captures["/user/setAdReward/en/"]["res_b64"])
    assert roundtrip(raw, setAdRewardReturn) == raw


def test_setuserfollowerprofilereward_request(captures):
    raw = raw_thrift_bytes(captures["/user/setUserFollowerProfileReward/en/"]["req_b64"])
    assert roundtrip(raw, setUserFollowerProfileReward) == raw


def test_setuserfollowerprofilereward_response(captures):
    raw = raw_thrift_bytes(captures["/user/setUserFollowerProfileReward/en/"]["res_b64"])
    assert roundtrip(raw, setUserFollowerProfileRewardReturn) == raw
