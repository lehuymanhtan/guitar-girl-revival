import time

import thrift_gen.tapsonic.common.ttypes as common_type
import thrift_gen.tapsonic.main_getServerTime_en.ttypes as main_getServerTime_en

from .. import _helper as helper

@helper.wrapper_helper
def getServerTime(request):
    data = main_getServerTime_en.getServerTimeReturn(
        header=common_type.errorRetCode(code=0, message=""),
        responseTime=helper.auto_response_time(),
        service="main",
        method="getServerTime",
        data=main_getServerTime_en.getServerTimeRetDataInfo(
            time=int(time.time()),
            datetime=int(time.strftime("%Y%m%d%H%M%S", time.localtime()))
        ),
        footer=common_type.maintenanceData()
    )
    
    return data