import os
import sys
import copy

if 'thrift_gen' not in sys.path:
    # Get the project root directory which is 3 levels up from this file
    root_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..', '..'))
    sys.path.append(os.path.join(root_dir, 'thrift_gen'))

from django.apps import apps
from django.forms.models import model_to_dict

import thrift_gen.tapsonic.general.ttypes as common_type
import thrift_gen.tapsonic.main_getGameDataList_en.ttypes as endpoint_types

from .. import _helper as helper

def _load_base_game_data():
    obj = endpoint_types.getGameDataListReturn()
    obj.data = {"ret": endpoint_types.getGameDataListRetDataInfo()}
    ret_info = obj.data["ret"]
    
    app_config = apps.get_app_config('gamedata')
    model_classes = {model.__name__.lower(): model for model in app_config.get_models()}
    
    for field_spec in endpoint_types.getGameDataListRetDataInfo.thrift_spec:
        if not field_spec:
            continue
        field_name = field_spec[2]
        thrift_class = field_spec[3][1][0]
        
        # Find matching django model
        base_name = field_name.lower().replace('_', '')
        target_model = None
        if base_name + 'data' in model_classes:
            target_model = model_classes[base_name + 'data']
        elif base_name in model_classes:
            target_model = model_classes[base_name]
            
        if not target_model:
            print(f"Warning: No model found for {field_name}")
            setattr(ret_info, field_name, [])
            continue
            
        # Query all and populate
        items = []
        for instance in target_model.objects.all():
            data_dict = model_to_dict(instance)
            # Remove 'id' if we didn't explicitly define it in thrift
            if 'id' in data_dict and not hasattr(thrift_class, 'id'):
                data_dict.pop('id')
                
            # Create Thrift instance from dictionary
            items.append(thrift_class(**data_dict))
            
        setattr(ret_info, field_name, items)
        
    return obj

@helper.wrapper_helper
def getGameDataList(request):
    base_obj = _load_base_game_data()
    obj = copy.copy(base_obj) 
    
    obj.server_time = helper.auto_response_time()
    obj.maintenance = common_type.maintenanceData()
    obj.error = common_type.errorRetCode(0)
    
    return obj