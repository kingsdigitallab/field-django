from django.urls import include, path
from django.views.generic import TemplateView
from rest_framework import routers

from .views import FieldGameViewSet, FarmerViewSet, GameEventViewSet

router = routers.DefaultRouter()
router.register(r'games', FieldGameViewSet, basename="game")
router.register(r'farmers', FarmerViewSet, basename="farmer")
router.register(r'events', GameEventViewSet, basename="event")
urlpatterns = router.urls

farmer_list = FarmerViewSet.as_view({
    'get': 'list',
})

urlpatterns = [
    path("api/", include(urlpatterns)),
    path("", TemplateView.as_view(template_name="game/game_module.html"),
         name="game"),

]
