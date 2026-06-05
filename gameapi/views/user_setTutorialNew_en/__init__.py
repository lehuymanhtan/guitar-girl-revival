import logging
from django.db import transaction
from django.http import HttpRequest, HttpResponse

import thrift_gen.tapsonic.general.ttypes as common_type
import thrift_gen.tapsonic.user_setTutorialNew_en.ttypes as endpoint_types

from gameapi import models
from .. import _helper as helper

@helper.wrapper_helper
def setTutorialNew(request: HttpRequest):
    raw_data = request.POST.get('tapsonic_data', None)
    if not raw_data:
        return HttpResponse("Bad Request", status=400)
        
    req_obj = endpoint_types.setTutorialNew()
    req_obj.read(helper.decodeToBinary(raw_data))

    if not req_obj.data or not req_obj.data.u_seq:
        return HttpResponse("Bad Request", status=400)

    try:
        with transaction.atomic():
            player = models.Player.objects.select_for_update().get(u_seq=req_obj.data.u_seq)
            
            tutorial_ids = req_obj.data.i_ids
            if tutorial_ids is None:
                tutorial_ids = []

            for t_id in tutorial_ids:
                models.UserTutorial.objects.get_or_create(
                    player=player,
                    i_id=t_id
                )

            # Get updated tutorial list
            user_tutorials = [
                common_type.UserTutorial(
                    i_id=tutorial.i_id
                ) for tutorial in player.tutorials.all()
            ]

            return endpoint_types.setTutorialNewReturn(
                error=common_type.errorRetCode(code=0, errmsg=""),
                server_time=helper.auto_response_time(),
                mode="user",
                call="setTutorialNew",
                data=endpoint_types.setTutorialNewRetDataInfo(
                    u_seq=player.u_seq,
                    tutorial=user_tutorials
                ),
                maintenance=common_type.maintenanceData()
            )

    except models.Player.DoesNotExist:
        return endpoint_types.setTutorialNewReturn(
            error=common_type.errorRetCode(code=900, errmsg="Unregisterd User"),
            server_time=helper.auto_response_time(),
            mode="user",
            call="setTutorialNew",
            data=None,
            maintenance=common_type.maintenanceData()
        )
    except Exception as e:
        return HttpResponse(f"Internal server error: {e}", status=500)
