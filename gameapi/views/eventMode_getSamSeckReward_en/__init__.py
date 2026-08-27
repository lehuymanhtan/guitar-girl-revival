from django.http import HttpRequest, HttpResponse
from django.db import transaction
import time

import thrift_gen.tapsonic.general.ttypes as common_type
import thrift_gen.tapsonic.eventMode_getSamSeckReward_en.ttypes as endpoint_types
from gameapi import models
from .. import _helper as helper


@helper.wrapper_helper
def getSamSeckReward(request: HttpRequest):
    raw_data = request.POST.get("tapsonic_data", None)
    if not raw_data:
        return HttpResponse("Bad Request", status=400)

    req_obj = endpoint_types.getSamSeckReward()
    req_obj.read(helper.decodeToBinary(raw_data))

    if not req_obj.data or not req_obj.data.u_seq:
        return HttpResponse("Bad Request", status=400)

    i_id = req_obj.data.i_id
    if i_id not in [1, 2, 3]:
        return HttpResponse("Bad Request", status=400)

    try:
        with transaction.atomic():
            player = models.Player.objects.select_for_update().get(
                u_seq=req_obj.data.u_seq
            )

            # Check if already claimed
            if models.UserSamSeckEvent.objects.filter(
                player=player, reward_idx=i_id
            ).exists():
                return endpoint_types.getSamSeckRewardReturn(
                    error=common_type.errorRetCode(code=0, errmsg="Reward already claimed"),
                    server_time=helper.auto_response_time(),
                    mode="eventMode",
                    call="getSamSeckReward",
                    data=endpoint_types.getSamSeckRewardRetDataInfo(step=i_id),
                    maintenance=common_type.maintenanceData(),
                )

            # Create the event progress
            models.UserSamSeckEvent.objects.create(player=player, reward_idx=i_id)

            # Define pre-populated post IDs
            post_id_mapping = {1: 33301, 2: 33302, 3: 33303}

            # Fetch the global pre-populated Post
            try:
                post = models.Post.objects.get(idx=post_id_mapping[i_id])
            except models.Post.DoesNotExist:
                return endpoint_types.getSamSeckRewardReturn(
                    error=common_type.errorRetCode(
                        code=909, errmsg="Global Post missing"
                    )
                )

            # Send post to user (status=0 unread, flg=0 claimable)
            models.UserPost.objects.create(player=player, post=post, status=0, flg=0)

            # Return new step (which is the current claimed ID)
            return endpoint_types.getSamSeckRewardReturn(
                error=common_type.errorRetCode(code=0, errmsg=""),
                server_time=helper.auto_response_time(),
                mode="eventMode",
                call="getSamSeckReward",
                data=endpoint_types.getSamSeckRewardRetDataInfo(step=i_id),
                maintenance=common_type.maintenanceData(),
            )
    except models.Player.DoesNotExist:
        return endpoint_types.getSamSeckRewardReturn(
            error=common_type.errorRetCode(code=900, errmsg="Unregistered user")
        )
    except Exception as e:
        return HttpResponse(f"Internal server error: {e}", status=500)
