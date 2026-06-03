import os
import copy
from functools import lru_cache

from .getGameDataList import ttypes as getGameDataListTypes
import thrift_gen.tapsonic.general.ttypes as common_type

from .. import _helper as helper

@lru_cache(maxsize=1)
def _load_base_game_data():
    obj = getGameDataListTypes.GetGameDataListResponse()
    file_path = os.path.join(os.path.dirname(__file__), "_raw", "getGameDataListResponse.txt")
    obj.read(helper.loadRawResponse(file_path))
    return obj

@helper.wrapper_helper
def getGameDataList(request):
    base_obj = _load_base_game_data()
    
    obj = copy.copy(base_obj) 
    
    obj.responseTime = helper.auto_response_time()
    obj.footer = common_type.maintenanceData()
    
    return obj