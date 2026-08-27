import time
from django.http import HttpResponse
from gameapi.models import Player, UserPost

import thrift_gen.tapsonic.general.ttypes as common_type
import thrift_gen.tapsonic.post_readPost_en.ttypes as post_readPost_en

from .. import _helper as helper

@helper.wrapper_helper
def readPost(request):
    raw_data = request.POST.get("tapsonic_data", None)
    if not raw_data:
        return HttpResponse("Bad Request", status=400)
    
    req = post_readPost_en.readPost()
    req.read(helper.decodeToBinary(raw_data))
    
    u_seq = req.data.u_seq
    idx = req.data.idx
    
    if not u_seq:
        return HttpResponse("Bad Request", status=400)
    
    player = Player.objects.filter(u_seq=u_seq).first()
    if not player:
        return post_readPost_en.readPostReturn(
            error=common_type.errorRetCode(code=998, errmsg="Sorry. Not a registered user."),
            mode="post",
            call="readPost",
            data=None,
            maintenance=common_type.maintenanceData(),
        )
    
    user_post = UserPost.objects.filter(player=player, post_id=idx, status=0).first()
    if user_post:
        user_post.flg = 1
        user_post.save(update_fields=['flg'])
            
    data = post_readPost_en.readPostReturn(
        error=common_type.errorRetCode(code=0, errmsg=""),
        mode="post",
        call="readPost",
        data=post_readPost_en.readPostRetDataInfo(
            idx=idx
        ),
        maintenance=common_type.maintenanceData()
    )
    
    return data
