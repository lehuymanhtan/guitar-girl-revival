import logging
from django.db import transaction
from django.http import HttpRequest, HttpResponse

import thrift_gen.tapsonic.general.ttypes as common_type
import thrift_gen.tapsonic.store_buyContents_en.ttypes as endpoint_types

from gameapi import models
from .. import _helper as helper

logger = logging.getLogger(__name__)

@helper.wrapper_helper
def buyContents(request: HttpRequest):
    # this enpoint allow to buy guitars, upgrade skills, 
    # type (string):
    # - unit
    # - guitar
    # - skill
    raw_data = request.POST.get('tapsonic_data', None)
    if not raw_data:
        return HttpResponse("Bad Request", status=400)
        
    req_obj = endpoint_types.buyContents()
    req_obj.read(helper.decodeToBinary(raw_data))

    if not req_obj.data or not req_obj.data.u_seq:
        return HttpResponse("Bad Request", status=400)

    def _error(code, msg):
        return endpoint_types.buyContentsReturn(
            error=common_type.errorRetCode(code=code, errmsg=msg),
            server_time=helper.auto_response_time(),
            mode="store",
            call="buyContents",
            data=None,
            maintenance=common_type.maintenanceData()
        )

    try:
        from gamedata.models import GuitarData, SkillData, UnitData
        with transaction.atomic():
            player = models.Player.objects.select_for_update().get(u_seq=req_obj.data.u_seq)
            type_val = req_obj.data.type
            idx = req_obj.data.idx
            
            if type_val not in ['guitar', 'skill', 'unit']:
                return _error(900, "Unsupported Type")
                
            cost = 0.0
            currency = None
            updated_skill = None
            updated_unit = None
            
            if type_val == 'guitar':
                try:
                    data = GuitarData.objects.get(i_id=idx)
                except GuitarData.DoesNotExist:
                    return _error(900, "Item Not Found")
                
                currency = data.s_GoodsType
                cost = float(data.s_Cost) if data.s_Cost else 0.0
                
                user_item, created = models.UserGuitar.objects.get_or_create(
                    player=player, i_id=idx, defaults={'i_Level': 1, 'i_BonusLevel': 0}
                )
                if not created:
                    user_item.i_Level += 1
                
            elif type_val == 'skill':
                try:
                    data = SkillData.objects.get(i_id=idx)
                except SkillData.DoesNotExist:
                    return _error(900, "Item Not Found")
                    
                user_item, created = models.UserSkill.objects.get_or_create(
                    player=player, i_id=idx, defaults={'i_Level': 1, 'b_Activate': 0, 'l_ActivateOnTicks': 0, 'l_ActivateOffTicks': 0}
                )
                
                currency = data.s_GoodsType
                current_level = user_item.i_Level if not created else 0
                cost = float(data.i_Cost or 0) + (current_level - 1) * float(data.f_CostIncreaseValue or 0)
                
                if not created:
                    user_item.i_Level += 1
                    
                updated_skill = common_type.userSkill(
                    i_id=user_item.i_id,
                    i_Level=user_item.i_Level,
                    b_Activate=user_item.b_Activate,
                    l_ActivateOnTicks=user_item.l_ActivateOnTicks,
                    l_ActivateOffTicks=user_item.l_ActivateOffTicks
                )
                
            elif type_val == 'unit':
                try:
                    data = UnitData.objects.get(i_id=idx)
                except UnitData.DoesNotExist:
                    return _error(900, "Item Not Found")
                    
                user_item, created = models.UserUnit.objects.get_or_create(
                    player=player, i_id=idx, defaults={'i_Level': 1}
                )
                
                currency = data.s_GoodsType
                current_level = user_item.i_Level if not created else 0
                cost = float(data.i_Cost or 0) + current_level * float(data.f_CostIncreaseValue or 0)
                
                if not created:
                    user_item.i_Level += 1
                    
                updated_unit = common_type.userUnit(
                    i_id=user_item.i_id,
                    i_Level=user_item.i_Level
                )
            
            if currency == 'CP':
                if player.u_cp < cost:
                    return _error(900, "Not enough CP")
                player.u_cp -= int(cost)
            elif currency == 'Candy':
                if player.u_candy < cost:
                    return _error(900, "Not enough Candy")
                player.u_candy -= float(cost)
            
            player.save()
            user_item.save()
            
            res_data = endpoint_types.buyContentsRetDataInfo(
                u_cp=player.u_cp,
                u_candy=player.u_candy,
                user_skill=updated_skill,
                user_unit=updated_unit
            )
            
            return endpoint_types.buyContentsReturn(
                error=common_type.errorRetCode(code=0, errmsg=""),
                server_time=helper.auto_response_time(),
                mode="store",
                call="buyContents",
                data=res_data,
                maintenance=common_type.maintenanceData()
            )
            
    except models.Player.DoesNotExist:
        return _error(998, "Unregistered User")
    except Exception as e:
        logger.error(f"Error in buyContents: {e}")
        return HttpResponse(f"Internal server error", status=500)