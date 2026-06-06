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
from .views.post_getPost_en import getPost
from .views.post_getPostTime_en import getPostTime
from .views.post_deletePost_en import deletePost
from .views.post_readPost_en import readPost
from .views.post_providePost_en import providePost
from .views.user_setFollowerProfileGift_en import user_setFollowerProfileGift_en
from .views.user_setGameReward_en import setGameReward
from .views.user_setTutorialNew_en import setTutorialNew
from .views.user_lastSaveTime_en import lastSaveTime
from .views.user_setEventReward_en import setEventReward
from .views.user_setUserFollowerProfileReward_en import setUserFollowerProfileReward
from .views.eventMode_getSamSeckList_en import getSamSeckList
from .views.eventMode_getSamSeckReward_en import getSamSeckReward

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
    path('user/setFollowerProfileGift/en/', user_setFollowerProfileGift_en, name='user_setFollowerProfileGift_en'),
    path('post/getPost/en/', getPost, name='getPost'),
    path('post/getPostTime/en/', getPostTime, name='getPostTime'),
    path('post/deletePost/en/', deletePost, name='deletePost'),
    path('post/readPost/en/', readPost, name='readPost'),
    path('post/providePost/en/', providePost, name='providePost'),
    path('user/setGameReward/en/', setGameReward, name='setGameReward'),
    path('user/setTutorialNew/en/', setTutorialNew, name='setTutorialNew'),
    path('user/lastSaveTime/en/', lastSaveTime, name='lastSaveTime'),
    path('user/setEventReward/en/', setEventReward, name='setEventReward'),
    path('user/setUserFollowerProfileReward/en/', setUserFollowerProfileReward, name='setUserFollowerProfileReward'),
    path('eventMode/getSamSeckList/en/', getSamSeckList, name='getSamSeckList'),
    path('eventMode/getSamSeckReward/en/', getSamSeckReward, name='getSamSeckReward'),
]

