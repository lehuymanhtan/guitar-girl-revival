import time

import thrift_gen.tapsonic.general.ttypes as common_type
import thrift_gen.tapsonic.main_getServerTime_en.ttypes as main_getServerTime_en

from .. import _helper as helper

@helper.wrapper_helper
def getServerTime(request):
    data = main_getServerTime_en.getServerTimeReturn(
        error=common_type.errorRetCode(code=0, errmsg=""),
        server_time=helper.auto_response_time(),
        mode="main",
        call="getServerTime",
        data=main_getServerTime_en.getServerTimeRetDataInfo(
            time=int(time.time()),
            datetime=int(time.strftime("%Y%m%d%H%M%S", time.localtime()))
        ),
        maintenance=common_type.maintenanceData()
    )
    
    return data