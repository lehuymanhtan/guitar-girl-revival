import time
import bz2
import base64
import urllib.parse

from datetime import datetime, timedelta
from django.http import HttpRequest, HttpResponse

from thrift.protocol import TBinaryProtocol
from thrift.transport import TTransport

import thrift_gen.tapsonic.general.ttypes as common_type

DOTNET_EPOCH = datetime(1, 1, 1)


def _packDataHelper(data) -> str:
    transport = TTransport.TMemoryBuffer()
    protocol = TBinaryProtocol.TBinaryProtocol(transport)
    data.write(protocol)

    compressed = bz2.compress(transport.getvalue())

    return base64.b64encode(compressed).decode()


def loadRawResponse(file_path: str) -> str:
    data = ""
    with open(file_path, "r", encoding="utf-8") as f:
        data = f.read()

    return decodeToBinary(data)


def decodeToBinary(data: str):
    data = urllib.parse.unquote(data)
    data = base64.b64decode(data)
    data = bz2.decompress(data)
    transport = TTransport.TMemoryBuffer(data)
    protocol = TBinaryProtocol.TBinaryProtocol(transport)
    return protocol


def datetime_to_unix_sec(dt) -> int:
    return int(dt.timestamp())


def datetime_to_unix_msec(dt) -> int:
    return int(dt.timestamp() * 1000)


def auto_response_time() -> common_type.serverTimeRet:
    return common_type.serverTimeRet(
        time=int(time.time()),
        datetime=int(time.strftime("%Y%m%d%H%M%S", time.localtime())),
    )


def wrapper_helper(func):
    def wrapper(request: HttpRequest, *args, **kwargs):
        if request.method != "POST":
            return HttpResponse("Bad Request", status=400)
        data = func(request, *args, **kwargs)
        if isinstance(data, HttpResponse):
            return data
        return HttpResponse(_packDataHelper(data), content_type="text/plain")

    return wrapper


def ticks_to_datetime(ticks_value) -> datetime:
    """Converts a .NET Ticks value to a Python UTC datetime object."""

    microseconds = ticks_value // 10
    return DOTNET_EPOCH + timedelta(microseconds=microseconds)


def datetime_to_ticks(dt_object) -> int:
    """Converts a Python UTC datetime object to a .NET Ticks value."""

    delta = dt_object - DOTNET_EPOCH

    ticks_value = (
        (delta.days * 864000000000)
        + (delta.seconds * 10000000)
        + (delta.microseconds * 10)
    )
    return ticks_value

def apply_reward(player, area1, rtype, rid, rval):
    from gameapi import models
    if rtype == 1:  # consume
        if rid == 1:  # Chocolate (CP / Choco Point)
            player.u_cp += rval
            player.save(update_fields=['u_cp'])
        elif rid == 2:  # Candy
            player.u_candy += rval
            player.save(update_fields=['u_candy'])
        elif rid == 8 and area1:  # Fan
            area1.i_UserFanCount += rval
            area1.save(update_fields=['i_UserFanCount'])
        elif rid == 11:  # Cookie (Ch3 currency)
            player.u_cookie += rval
            player.save(update_fields=['u_cookie'])

    elif rtype == 2:  # music
        models.UserMusic.objects.get_or_create(
            player=player, i_id=rid,
            defaults={'i_Level': 1, 'i_BonusLevel': 0}
        )
    elif rtype == 3:  # costume
        models.UserCostume.objects.get_or_create(
            player=player, i_id=rid,
            defaults={'i_Level': 1, 'i_BonusLevel': 0}
        )
    elif rtype == 9:  # Guitar
        models.UserGuitar.objects.get_or_create(
            player=player, i_id=rid,
            defaults={'i_Level': 1, 'i_BonusLevel': 0}
        )
    elif rtype == 11:  # follower gift item
        gift, _ = models.UserFollowerGiftItem.objects.get_or_create(
            player=player, i_id=rid,
            defaults={'i_Value': 0}
        )
        gift.i_Value += rval
        gift.save(update_fields=['i_Value'])
    elif rtype == 13:  # character — skip (inactive event 202111, no info yet)
        pass
