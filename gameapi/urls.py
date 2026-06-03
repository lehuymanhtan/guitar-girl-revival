from django.urls import path

from .views.getGameDataList import getGameDataList
from .views.main_Request_en import init
from .views.main_getServerTime_en import getServerTime
from .views.store_getVarietyStore_en import getVarietyStore
from .views.main_defaultSettingList_en import defaultSettingList
from .views.main_getEventRewardList_en import getEventRewardList
from .views.main_getUpdateTime_en import getUpdateTime
from .views.user_userJoin_en import userJoin
from .views.user_userLogin_en import userLogin
from .views.user_userSave_en import userSave
from .views.user_setAttendance_en import setAttendance

urlpatterns = [
    path('main/getGameDataList/en/', getGameDataList, name='getGameDataList'),
    path('main/defaultSettingList/en/', defaultSettingList, name='defaultSettingList'),
    path('main/getEventRewardList/en/', getEventRewardList, name='getEventRewardList'),
    path('main/getServerTime/en/', getServerTime, name='getServerTime'),
    path('main/getUpdateTime/en/', getUpdateTime, name='getUpdateTime'),
    path('main/Request/en/', init, name='init'),
    path('store/getVarietyStore/en/', getVarietyStore, name='getVarietyStore'),
    path('user/userJoin/en/', userJoin, name='userJoin'),
    path('user/userLogin/en/', userLogin, name='userLogin'),
    path('user/userSave/en/', userSave, name='userSave'),
    path('user/setAttendance/en/', setAttendance, name='setAttendance'),
]

