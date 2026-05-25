import thrift_gen.tapsonic.common.ttypes as common_type
import thrift_gen.tapsonic.main_defaultSettingList_en.ttypes as main_defaultSettingList_en

from gameapi import models
from .. import _helper as helper


@helper.wrapper_helper
def defaultSettingList(request):
    return main_defaultSettingList_en.defaultSettingListReturn(
        error=common_type.errorRetCode(code=0, errmsg=""),
        server_time=helper.auto_response_time(),
        mode="main",
        call="defaultSettingList",
        data=main_defaultSettingList_en.defaultSettingListRetDataInfo(
            defaultSettings=[
                main_defaultSettingList_en.defaultSettingInfo(
                    key=setting.key,
                    value=setting.value
                ) for setting in models.DefaultSetting.objects.all()
            ]
        ),
        maintenance=common_type.maintenanceData()
    )