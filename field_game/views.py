from django.conf import settings
from field_game.models import FieldGame, GameEvent, Farmer
from field_game.serializers import (
    FieldGameSerializer,
    GameEventSerializer,
    FarmerSerializer,
)
from rest_framework import permissions
from rest_framework import viewsets
from .permissions import AllowedHostPermission


# to toggle between easy for debug and production
if settings.DEBUG:
    API_PERMISSIONS = [AllowedHostPermission]
else:
    API_PERMISSIONS = [AllowedHostPermission]


class FieldGameViewSet(viewsets.ModelViewSet):
    """ Serve a new instance of the Field boardgame with relevant settings"""
    queryset = FieldGame.objects.all()
    serializer_class = FieldGameSerializer
    permission_classes = API_PERMISSIONS


class FarmerViewSet(viewsets.ReadOnlyModelViewSet):
    """ Serve a new instance of the Field boardgame with relevant settings"""
    queryset = Farmer.objects.all()
    serializer_class = FarmerSerializer
    permission_classes = API_PERMISSIONS


class GameEventViewSet(viewsets.ModelViewSet):
    """ Serve a new instance of the Field boardgame with relevant settings"""
    queryset = GameEvent.objects.all()
    serializer_class = GameEventSerializer
    permission_classes = API_PERMISSIONS


