from django.http import HttpRequest, HttpResponse

import thrift_gen.tapsonic.general.ttypes as common_type
import thrift_gen.tapsonic.main_getEventRewardList_en.ttypes as main_getEventRewardList_en

from gameapi import models
from .. import _helper as helper

@helper.wrapper_helper
def getEventRewardList(request: HttpRequest):
    raw_data = request.POST.get("tapsonic_data", None)
    if not raw_data:
        return HttpResponse("Bad Request", status=400)
    
    req= main_getEventRewardList_en.getEventRewardList()
    req.read(helper.decodeToBinary(raw_data))
    
    data = {}
    events = models.Event.objects.all()
    for event in events:
        rewards = event.rewards.all()
        reward_list = []
        for reward in rewards:
            user_rewards = reward.user_rewards.filter(player_id=req.data.u_seq).first()
            reward_list.append(
                main_getEventRewardList_en.getEventRewardListData(
                    idx=event.idx,
                    event_name=event.event_name,
                    event_type=event.event_type,
                    reward_idx=reward.reward_idx,
                    reward_num=reward.reward_num,
                    reward_type=reward.reward_type,
                    reward_id=reward.reward_id,
                    reward_value=reward.reward_value,
                    reward_flg=user_rewards.reward_flg if user_rewards else "N",
                    get_date=user_rewards.get_date if user_rewards else 0,
                    s_CustomIconType=reward.s_CustomIconType,
                    s_CustomIconSprite=reward.s_CustomIconSprite
                )
            )
        data[event.idx] = main_getEventRewardList_en.getEventRewardListRetDataInfo(
            group_idx=event.idx,
            reward_list=reward_list
        )
    
    return main_getEventRewardList_en.getEventRewardListReturn(
        error=common_type.errorRetCode(code=0, errmsg=""),
        server_time=helper.auto_response_time(),
        mode="main",
        call="getEventRewardList",
        data=data,
        maintenance=common_type.maintenanceData()
    )
    