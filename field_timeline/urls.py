from django.urls import path, re_path

from field_timeline import views

urlpatterns = [
    path('json/', views.TimelineJSONView.as_view(),
         name='timeline_json'),
    re_path(r'^$', views.TimelineTemplateView.as_view(), name='timeline')
]
