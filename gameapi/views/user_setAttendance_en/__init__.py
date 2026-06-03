import datetime
from django.http import HttpRequest, HttpResponse

import thrift_gen.tapsonic.general.ttypes as common_type
import thrift_gen.tapsonic.user_setAttendance_en.ttypes as user_setAttendance_en

from gameapi import models
from .. import _helper as helper

@helper.wrapper_helper
def setAttendance(request: HttpRequest):
    # TODO: properly implement this endpoint.
    # return N / ADD for now
    
    raw_data = request.POST.get("tapsonic_data", None)
    if not raw_data:
        return HttpResponse("Bad Request", status=400)

    req = user_setAttendance_en.setAttendance()
    req.read(helper.decodeToBinary(raw_data))
    if not req.data:
        return HttpResponse("Bad Request", status=400)

    u_seq = req.data.u_seq
    if not u_seq:
        return HttpResponse("Bad Request", status=400)

    user = models.Player.objects.filter(u_seq=u_seq).first()
    if not user:
        return HttpResponse("Bad Request", status=400)

    attendance_type = req.data.type
    
    status = 'N'
    
    if attendance_type == 'add':
        status = 'ADD'
        
        
        
    return user_setAttendance_en.setAttendanceReturn(
        error=common_type.errorRetCode(code=0, errmsg=""),
        server_time=helper.auto_response_time(),
        mode="user",
        call="setAttendance",
        data=user_setAttendance_en.setAttendanceRetDataInfo(
            status=status,
            user_follower_quest=None,
            attendance_count=0,
            attendance_date=0,
            max_coutinuous_attendance_count=0
        ),
        maintenance=common_type.maintenanceData()
    )
