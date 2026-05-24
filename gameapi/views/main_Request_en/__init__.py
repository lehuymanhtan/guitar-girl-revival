import thrift_gen.tapsonic.common.ttypes as common_type
import thrift_gen.tapsonic.main_Request_en.ttypes as main_Request_en

from .. import _helper as helper

@helper.wrapper_helper
def init(request):
    data = main_Request_en.initReturn(
        header=common_type.errorRetCode(),
        responseTime=helper.auto_response_time(),
        service="main",
        method="init",
        data=main_Request_en.initRetDataInfo(
            idx=253,
            game_url="https://game.gtgl.pmang.cloud",
            cdn_url="https://dl.gtgl.pmang.cloud",
        ),
        footer=common_type.maintenanceData()
    )
    return data