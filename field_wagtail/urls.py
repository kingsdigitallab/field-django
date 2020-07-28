from django.urls import path

from field_wagtail import views

urlpatterns = [
    path('json/', views.TimelineJSONView.as_view(),
         name='timeline_json'),
]
