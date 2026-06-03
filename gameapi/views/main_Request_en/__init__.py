import thrift_gen.tapsonic.general.ttypes as common_type
import thrift_gen.tapsonic.main_Request_en.ttypes as main_Request_en

from .. import _helper as helper

@helper.wrapper_helper
def init(request):
    data = main_Request_en.initReturn(
        error=common_type.errorRetCode(code=0, errmsg=""),
        server_time=helper.auto_response_time(),
        mode="main",
        call="init",
        data=main_Request_en.initRetDataInfo(
            idx=253,
            game_url="https://game.gtgl.pmang.cloud",
            cdn_url="https://dl.gtgl.pmang.cloud",
        ),
        maintenance=common_type.maintenanceData()
    )
    return data