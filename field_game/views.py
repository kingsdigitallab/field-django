from field_game.models import FieldGame, GameEvent, Farmer
from field_game.serializers import (
    FieldGameSerializer,
    GameEventSerializer,
    FarmerSerializer,
)
from rest_framework import permissions
from rest_framework import viewsets


class FieldGameViewSet(viewsets.ViewSet):
    """ Serve a new instance of the Field boardgame with relevant settings"""

    queryset = FieldGame.objects.all()
    serializer_class = FieldGameSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]


class FarmerViewSet(viewsets.ViewSet):
    """ Serve a new instance of the Field boardgame with relevant settings"""

    queryset = Farmer.objects.all()
    serializer_class = FarmerSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]


class GameEventViewSet(viewsets.ViewSet):
    """ Serve a new instance of the Field boardgame with relevant settings"""

    queryset = GameEvent.objects.all()
    serializer_class = GameEventSerializer
    permission_classes = [permissions.IsAuthenticatedOrReadOnly]
