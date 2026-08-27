import sys
import os
import json

# Setup paths assuming the script is run from gg_server/scripts/
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..', 'thrift_gen')))

from gameapi.views import _helper as helper
from tapsonic.main_getGameDataList_en import ttypes as getGameDataListTypes

def thrift_to_dict(thrift_obj):
    out = {}
    for k in dir(thrift_obj):
        if not k.startswith('_') and k not in ('read', 'write', 'validate', 'thrift_spec'):
            v = getattr(thrift_obj, k)
            if v is not None:
                if hasattr(v, '__dict__'):
                    out[k] = thrift_to_dict(v)
                elif isinstance(v, list):
                    out[k] = [thrift_to_dict(i) if hasattr(i, '__dict__') else i for i in v]
                else:
                    out[k] = v
    return out

def main():
    file_path = os.path.join(os.path.dirname(__file__), '..', 'gameapi', 'views', 'getGameDataList', '_raw', 'getGameDataListResponse.txt')
    out_dir = os.path.join(os.path.dirname(__file__), '..', 'gameapi', 'master_data')
    os.makedirs(out_dir, exist_ok=True)

    protocol = helper.loadRawResponse(file_path)
    obj = getGameDataListTypes.getGameDataListReturn()
    obj.read(protocol)

    ret_data = obj.data['ret']
    
    extracted_count = 0
    for attr in dir(ret_data):
        if not attr.startswith('_') and attr not in ('read', 'write', 'validate', 'thrift_spec'):
            val = getattr(ret_data, attr)
            if isinstance(val, list):
                data_list = [thrift_to_dict(i) for i in val]
                out_file = os.path.join(out_dir, f'{attr}.json')
                with open(out_file, 'w', encoding='utf-8') as f:
                    json.dump(data_list, f, indent=2, ensure_ascii=False)
                print(f"Extracted {attr}.json ({len(data_list)} items)")
                extracted_count += 1
                
    print(f"\nSuccessfully extracted {extracted_count} master data categories to: {out_dir}")

if __name__ == '__main__':
    main()
