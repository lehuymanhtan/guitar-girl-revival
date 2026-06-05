import time
from django.http import HttpResponse
from gameapi.models import Player

import thrift_gen.tapsonic.general.ttypes as common_type
import thrift_gen.tapsonic.post_getPost_en.ttypes as post_getPost_en

from .. import _helper as helper

@helper.wrapper_helper
def getPost(request):
    raw_data = request.POST.get("tapsonic_data", None)
    if not raw_data:
        return HttpResponse("Bad Request", status=400)
    
    req = post_getPost_en.getPost()
    req.read(helper.decodeToBinary(raw_data))
    
    u_seq = req.data.u_seq
    
    post_list = []
    
    if not u_seq:
        return HttpResponse("Bad Request", status=400)
    player = Player.objects.filter(u_seq=u_seq).first()
    if not player:
        return post_getPost_en.getPostReturn(
            error=common_type.errorRetCode(code=900, errmsg="Unregisterd User"),
            server_time=helper.auto_response_time(),
            mode="post",
            call="getPost",
            data=None,
            maintenance=common_type.maintenanceData(),
        )
    
    user_posts = player.posts.filter(status=0).all()
    for up in user_posts:
        post = up.post
        items = []
        for item in post.items.all():
            items.append(post_getPost_en.itemList(
                i_RewardType=item.i_RewardType,
                i_RewardId=item.i_RewardId,
                d_RewardQuantity=item.d_RewardQuantity
            ))
        
        post_list.append(post_getPost_en.getPostList(
            idx=post.idx,
            notice_type=post.notice_type,
            title_ko=post.title_ko,
            memo_ko=post.memo_ko,
            title_en=post.title_en,
            memo_en=post.memo_en,
            title_jp=post.title_jp,
            memo_jp=post.memo_jp,
            title_zh_chs=post.title_zh_chs,
            memo_zh_chs=post.memo_zh_chs,
            title_zh_cht=post.title_zh_cht,
            memo_zh_cht=post.memo_zh_cht,
            title_vi=post.title_vi,
            memo_vi=post.memo_vi,
            title_es=post.title_es,
            memo_es=post.memo_es,
            title_it=post.title_it,
            memo_it=post.memo_it,
            title_id=post.title_id,
            memo_id=post.memo_id,
            title_th=post.title_th,
            memo_th=post.memo_th,
            title_pt=post.title_pt,
            memo_pt=post.memo_pt,
            title_hi=post.title_hi,
            memo_hi=post.memo_hi,
            have_reward=post.have_reward,
            status=up.status,
            unlimit_flg=post.unlimit_flg,
            flg=up.flg,
            create_time=post.create_time,
            del_time=post.del_time,
            item_list=items,
            url=post.url,
            image_resource_name=post.image_resource_name
        ))

    data = post_getPost_en.getPostReturn(
        error=common_type.errorRetCode(code=0, errmsg=""),
        server_time=helper.auto_response_time(),
        mode="post",
        call="getPost",
        data=post_getPost_en.getPostRetDataInfo(
            server_time=int(time.time()),
            post_list=post_list
        ),
        maintenance=common_type.maintenanceData()
    )
    
    return data
