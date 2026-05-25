import thrift_gen.tapsonic.common.ttypes as common_type
import thrift_gen.tapsonic.main_getUpdateTime_en.ttypes as main_getUpdateTime_en

from .. import _helper as helper

@helper.wrapper_helper
def getUpdateTime(request):
    data = main_getUpdateTime_en.getUpdateTimeReturn(
        error=common_type.errorRetCode(code=0, errmsg=""),
        server_time=helper.auto_response_time(),
        mode="main",
        call="getUpdateTime",
        data=main_getUpdateTime_en.getUpdateTimeRetDataInfo(
            upd_time=1766556032
        ),
        maintenance=common_type.maintenanceData()
    )
    
    return data