import time
from django.http import HttpResponse
from gameapi.models import Player, UserPost

import thrift_gen.tapsonic.general.ttypes as common_type
import thrift_gen.tapsonic.post_deletePost_en.ttypes as post_deletePost_en

from .. import _helper as helper

@helper.wrapper_helper
def deletePost(request):
    raw_data = request.POST.get("tapsonic_data", None)
    if not raw_data:
        return HttpResponse("Bad Request", status=400)
    
    req = post_deletePost_en.deletePost()
    req.read(helper.decodeToBinary(raw_data))
    
    u_seq = req.data.u_seq
    idx = req.data.idx
    
    if not u_seq:
        return HttpResponse("Bad Request", status=400)
    
    player = Player.objects.filter(u_seq=u_seq).first()
    if not player:
        return post_deletePost_en.deletePostReturn(
            error=common_type.errorRetCode(code=998, errmsg="Sorry. Not a registered user."),
            mode="post",
            call="deletePost",
            data=None,
            maintenance=common_type.maintenanceData(),
        )
    
    user_post = UserPost.objects.filter(player=player, post_id=idx, status=0).first()
    if user_post:
        user_post.status = 1
        user_post.save(update_fields=['status'])
        
    data = post_deletePost_en.deletePostReturn(
        error=common_type.errorRetCode(code=0, errmsg=""),
        mode="post",
        call="deletePost",
        data=post_deletePost_en.deletePostRetDataInfo(
            idx=idx
        ),
        maintenance=common_type.maintenanceData()
    )
    
    return data
