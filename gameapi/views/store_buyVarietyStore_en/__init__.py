import logging
from django.db import transaction
from django.http import HttpRequest, HttpResponse

import thrift_gen.tapsonic.general.ttypes as common_type
import thrift_gen.tapsonic.store_buyVarietyStore_en.ttypes as endpoint_types
from ..store_getVarietyStore_en import _get_variety_store_data

from gameapi import models
from .. import _helper as helper

logger = logging.getLogger(__name__)

@helper.wrapper_helper
def buyVarietyStore(request: HttpRequest):
    raw_data = request.POST.get('tapsonic_data', None)
    if not raw_data:
        return HttpResponse("Bad Request", status=400)
        
    req_obj = endpoint_types.buyVarietyStore()
    req_obj.read(helper.decodeToBinary(raw_data))

    if not req_obj.data or not req_obj.data.u_seq:
        return HttpResponse("Bad Request", status=400)

    try:
        with transaction.atomic():
            player = models.Player.objects.get(u_seq=req_obj.data.u_seq)
            idx = req_obj.data.idx

            store_data = _get_variety_store_data()
            store_list = store_data.data if store_data.data else []
            
            item = next((i for i in store_list if int(i.i_id) == idx), None)
            
            if not item:
                return endpoint_types.buyVarietyStoreReturn(
                    error=common_type.errorRetCode(code=909, errmsg="Item not found"),
                    server_time=helper.auto_response_time(),
                    mode="store",
                    call="buyVarietyStore",
                    data=None,
                    maintenance=common_type.maintenanceData()
                )

            cost = int(item.i_Cost)
            
            if player.u_candy < cost:
                return endpoint_types.buyVarietyStoreReturn(
                    error=common_type.errorRetCode(code=909, errmsg="Not enough candy"),
                    server_time=helper.auto_response_time(),
                    mode="store",
                    call="buyVarietyStore",
                    data=None,
                    maintenance=common_type.maintenanceData()
                )

            player.u_candy -= cost
            player.save()

            return endpoint_types.buyVarietyStoreReturn(
                error=common_type.errorRetCode(code=0, errmsg=""),
                server_time=helper.auto_response_time(),
                mode="store",
                call="buyVarietyStore",
                data=endpoint_types.buyVarietyStoreRetDataInfo(
                    u_cp=player.u_cp,
                    u_candy=player.u_candy,
                    reward_type=int(item.i_RewardType),
                    reward_id=int(item.i_RewardId),
                    reward_value=int(item.i_RewardQuantity),
                    status="Y"
                ),
                maintenance=common_type.maintenanceData()
            )

    except models.Player.DoesNotExist:
        return endpoint_types.buyVarietyStoreReturn(
            error=common_type.errorRetCode(code=909, errmsg="Unregistered User"),
            server_time=helper.auto_response_time(),
            mode="store",
            call="buyVarietyStore",
            data=None,
            maintenance=common_type.maintenanceData()
        )
    except Exception as e:
        logger.error(f"Error in buyVarietyStore: {e}")
        return HttpResponse(f"Internal server error", status=500)
