from django.http import HttpRequest, HttpResponse

import thrift_gen.tapsonic.general.ttypes as common_type
import thrift_gen.tapsonic.user_lastSaveTime_en.ttypes as user_lastSaveTime_en

from gameapi import models
from .. import _helper as helper

@helper.wrapper_helper
def lastSaveTime(request: HttpRequest):
    raw_data = request.POST.get("tapsonic_data", None)
    if not raw_data:
        return HttpResponse("Bad Request", status=400)

    req = user_lastSaveTime_en.lastSaveTime()
    req.read(helper.decodeToBinary(raw_data))
    if not req.data:
        return HttpResponse("Bad Request", status=400)

    u_seq = req.data.u_seq
    if not u_seq:
        return HttpResponse("Bad Request", status=400)

    user = models.Player.objects.filter(u_seq=u_seq).first()
    if not user:
        return HttpResponse("Bad Request", status=400)

    last_save_time = helper.datetime_to_unix_sec(user.u_save_date) if user.u_save_date else 0

    return user_lastSaveTime_en.lastSaveTimeReturn(
        error=common_type.errorRetCode(code=0, errmsg=""),
        server_time=helper.auto_response_time(),
        mode="user",
        call="lastSaveTime",
        data=user_lastSaveTime_en.lastSaveTimeRetDataInfo(
            last_save_time=int(last_save_time),
            device_uuid=req.data.device_uuid if req.data.device_uuid else ""
        ),
        maintenance=common_type.maintenanceData()
    )
