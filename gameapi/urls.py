from django.urls import path
from . import views

urlpatterns = [
    path('/main/getServerTime/en/', views.getServerTime, name='getServerTime'),
    path('/main/getGameDataList/en/', views.getGameDataList, name='getGameDataList'),
    path('/main/Request/en/', views.init, name='init'),
]

