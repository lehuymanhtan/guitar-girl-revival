from django.http import HttpRequest, HttpResponse
import thrift_gen.tapsonic.general.ttypes as common_type
import thrift_gen.tapsonic.eventMode_getSamSeckList_en.ttypes as endpoint_types
from gameapi import models
from .. import _helper as helper

@helper.wrapper_helper
def getSamSeckList(request: HttpRequest):
    raw_data = request.POST.get('tapsonic_data', None)
    if not raw_data:
        return HttpResponse("Bad Request", status=400)

    req_obj = endpoint_types.getSamSeckList()
    req_obj.read(helper.decodeToBinary(raw_data))

    if not req_obj.data or not req_obj.data.u_seq:
        return HttpResponse("Bad Request", status=400)

    try:
        player = models.Player.objects.get(u_seq=req_obj.data.u_seq)
        
        return endpoint_types.getSamSeckListReturn(
            error=common_type.errorRetCode(code=0, errmsg=""),
            server_time=helper.auto_response_time(),
            mode="eventMode",
            call="getSamSeckList",
            data=endpoint_types.getSamSeckListRetDataInfo(
                event_type="samseck",
                rewardList=[
                    endpoint_types.rewardListData(
                        i_id=1,
                        i_RewardType=3,
                        i_RewardId=13,
                        d_RewardQuantity=1
                    ),
                    endpoint_types.rewardListData(
                        i_id=2,
                        i_RewardType=9,
                        i_RewardId=10,
                        d_RewardQuantity=1.0
                    ),
                    endpoint_types.rewardListData(
                        i_id=3,
                        i_RewardType=1,
                        i_RewardId=1,
                        d_RewardQuantity=333.0
                    )
                ]
            ),
            maintenance=common_type.maintenanceData()
        )
    except models.Player.DoesNotExist:
        return endpoint_types.getSamSeckListReturn(
            error=common_type.errorRetCode(code=900, errmsg="Unregistered user")
        )
    except Exception as e:
        return HttpResponse(f"Internal server error: {e}", status=500)
