from django.urls import path

from . import views

urlpatterns = [
    path('timeline/', views.special_case_2003),
]