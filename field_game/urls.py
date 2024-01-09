from django.urls import include, path
from django.views.generic import TemplateView
from rest_framework import routers
from .views import (
    FieldGameViewSet, FarmerViewSet,
    GameEventViewSet, GameView, GameLandingView
)

router = routers.DefaultRouter()
router.register(r'games', FieldGameViewSet, basename="game")
router.register(r'farmers', FarmerViewSet, basename="farmer")
router.register(r'events', GameEventViewSet, basename="event")
apipatterns = router.urls

farmer_list = FarmerViewSet.as_view({
    'get': 'list',
})

urlpatterns = [
    path("api/", include(apipatterns)),
    path("phaser/", GameView.as_view(), name="game"),
    path("", GameLandingView.as_view(),
        name="game_landing"),
]
