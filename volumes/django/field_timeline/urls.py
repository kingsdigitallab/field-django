from django.urls import path

from field_timeline import views

urlpatterns = [
    path('json/', views.TimelineJSONView.as_view(),
         name='timeline_json'),
]