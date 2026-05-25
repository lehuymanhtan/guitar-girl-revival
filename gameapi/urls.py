from django.urls import path

from .views.getGameDataList import getGameDataList
from .views.main_Request_en import init
from .views.main_getServerTime_en import getServerTime
urlpatterns = [
    path('main/getServerTime/en/', getServerTime, name='getServerTime'),
    path('main/getGameDataList/en/', getGameDataList, name='getGameDataList'),
    path('main/Request/en/', init, name='init'),
]

