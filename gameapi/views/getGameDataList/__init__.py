import os

from .getGameDataList import ttypes as getGameDataListTypes
import thrift_gen.tapsonic.common.ttypes as common_type

from .. import _helper as helper

@helper.wrapper_helper
def getGameDataList(request):
    obj = getGameDataListTypes.GetGameDataListResponse()
    obj.read(helper.loadRawResponse(os.path.join(os.path.dirname(__file__), "_raw", "getGameDataListResponse.txt")))
    
    ### Patch response here
    obj.responseTime = helper.auto_response_time()
    obj.footer = common_type.maintenanceData()
    
    return obj