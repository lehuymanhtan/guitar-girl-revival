import time
from django.http import HttpResponse
from gameapi.models import Player

import thrift_gen.tapsonic.general.ttypes as common_type
import thrift_gen.tapsonic.post_getPostTime_en.ttypes as post_getPostTime_en

from .. import _helper as helper


@helper.wrapper_helper
def getPostTime(request):
    raw_data = request.POST.get("tapsonic_data", None)
    if not raw_data:
        return HttpResponse("Bad Request", status=400)

    req = post_getPostTime_en.getPostTime()
    req.read(helper.decodeToBinary(raw_data))

    u_seq = req.data.u_seq
    latest_time = 0

    if not u_seq:
        return HttpResponse("Bad Request", status=400)
    player = Player.objects.filter(u_seq=u_seq).first()
    if not player:
        return post_getPostTime_en.getPostTimeReturn(
            error=common_type.errorRetCode(code=900, errmsg="Unregisterd User"),
            server_time=helper.auto_response_time(),
            mode="post",
            call="getPostTime",
            data=None,
            maintenance=common_type.maintenanceData(),
        )
    latest_post = player.posts.filter(status=0).order_by("-post__create_time").first()
    if latest_post:
        latest_time = latest_post.post.create_time

    return post_getPostTime_en.getPostTimeReturn(
        error=common_type.errorRetCode(code=0, errmsg=""),
        server_time=helper.auto_response_time(),
        mode="post",
        call="getPostTime",
        data=post_getPostTime_en.getPostTimeRetDataInfo(time=latest_time),
        maintenance=common_type.maintenanceData(),
    )
