from django.urls import include, path
from django.views.generic import TemplateView
from rest_framework import routers

from .views import FieldGameViewSet, FarmerViewSet, GameEventViewSet

router = routers.DefaultRouter()
router.register(r'fieldgame', FieldGameViewSet)
router.register(r'farmer', FarmerViewSet)
router.register(r'gameevent', GameEventViewSet)

urlpatterns = [
    path('', include(router.urls)),
    path("", TemplateView.as_view(template_name="game/game_module.html"),
         name="game"),

]
