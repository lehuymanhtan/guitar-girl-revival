import time
from django.http import HttpResponse
from gameapi.models import Player, UserPost

import thrift_gen.tapsonic.general.ttypes as common_type
import thrift_gen.tapsonic.post_providePost_en.ttypes as post_providePost_en

from .. import _helper as helper

@helper.wrapper_helper
def providePost(request):
    raw_data = request.POST.get("tapsonic_data", None)
    if not raw_data:
        return HttpResponse("Bad Request", status=400)
    
    req = post_providePost_en.providePost()
    req.read(helper.decodeToBinary(raw_data))
    
    u_seq = req.data.u_seq
    idx = req.data.idx
    
    if not u_seq:
        return HttpResponse("Bad Request", status=400)
    
    player = Player.objects.filter(u_seq=u_seq).first()
    if not player:
        return post_providePost_en.providePostReturn(
            error=common_type.errorRetCode(code=998, errmsg="Sorry. Not a registered user."),
            mode="post",
            call="providePost",
            data=None,
            maintenance=common_type.maintenanceData(),
        )
    
    ret_data = []
    
    user_post = UserPost.objects.filter(player=player, post_id=idx, status=0).first()
    if user_post and user_post.post.have_reward != 0:
        area1 = player.areas.filter(u_area_num=1).first()
        
        for item in user_post.post.items.all():
            helper.apply_reward(
                player=player, 
                area1=area1, 
                rtype=item.i_RewardType, 
                rid=item.i_RewardId, 
                rval=item.d_RewardQuantity
            )
            
            ret_data.append(post_providePost_en.providePostRetDataInfo(
                i_RewardType=item.i_RewardType,
                i_RewardId=item.i_RewardId,
                d_RewardQuantity=item.d_RewardQuantity
            ))
            
        user_post.status = 1
        user_post.save(update_fields=['status'])
        
    data = post_providePost_en.providePostReturn(
        error=common_type.errorRetCode(code=0, errmsg=""),
        mode="post",
        call="providePost",
        data=ret_data,
        maintenance=common_type.maintenanceData()
    )
    
    return data
