import os
import copy
from functools import lru_cache

import thrift_gen.tapsonic.store_getVarietyStore_en.ttypes as store_getVarietyStore_en
import thrift_gen.tapsonic.common.ttypes as common_type

from .. import _helper as helper

@lru_cache(maxsize=1)
def _get_variety_store_data():
    obj = store_getVarietyStore_en.getVarietyStoreReturn()
    file_path = os.path.join(os.path.dirname(__file__), "_raw", "getVarietyStore.txt")
    obj.read(helper.loadRawResponse(file_path))
    return obj

@helper.wrapper_helper
def getVarietyStore(request):
    base_obj = _get_variety_store_data()
    
    obj = copy.copy(base_obj) 
    
    obj.server_time = helper.auto_response_time()
    obj.maintenance = common_type.maintenanceData()
    
    return obj