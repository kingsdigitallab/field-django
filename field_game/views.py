from django.conf import settings
from field_game.models import FieldGame, GameEvent, Farmer, make_player_name
from field_game.serializers import (
    FieldGameSerializer,
    GameEventSerializer,
    FarmerSerializer,
)
from rest_framework.response import Response
from rest_framework import status
from django.middleware import csrf

from rest_framework import viewsets, permissions, filters
from django.views.generic import TemplateView
from django.contrib.auth import authenticate, login
from django.contrib.auth.models import User
from django.utils.decorators import method_decorator
from django.views.decorators.csrf import csrf_protect
from django.views.decorators.csrf import requires_csrf_token
from .permissions import IsCreatorOrReadOnly

# to toggle between easy for debug and production
if settings.DEBUG:
    API_PERMISSIONS = [
        permissions.IsAuthenticatedOrReadOnly, IsCreatorOrReadOnly
    ]
else:
    API_PERMISSIONS = [
        permissions.IsAuthenticatedOrReadOnly, IsCreatorOrReadOnly
    ]


class FieldGameViewSet(viewsets.ModelViewSet):
    """ Serve a new instance of the Field boardgame with relevant settings"""
    # queryset = FieldGame.objects.all()
    serializer_class = FieldGameSerializer
    permission_classes = API_PERMISSIONS

    def get_queryset(self):

        queryset = FieldGame.objects.all()
        if 'gameID' in self.request.query_params:
            gameID = self.request.query_params.get('gameID')
            queryset = queryset.filter(gameID=gameID)
        if 'playerID' in self.request.query_params:
            playerID = self.request.query_params.get('playerID')
            queryset = queryset.filter(playerID=playerID)
        return queryset.order_by('-gameID')


class FarmerViewSet(viewsets.ModelViewSet):
    """ Serve a new instance of the Field boardgame with relevant settings"""
    # queryset = Farmer.objects.all()
    serializer_class = FarmerSerializer
    permission_classes = API_PERMISSIONS

    filterset_fields = ['playerID']

    search_fields = [
        'id', 'playerID'
    ]

    filter_fields = {
        "pk": "pk",
        "playerID": "playerID",
        "control_group": "control_group"
    }

    def get_queryset(self):
        queryset = Farmer.objects.all()
        if 'playerID' in self.request.query_params:
            playerID = self.request.query_params.get('playerID')
            queryset = queryset.filter(playerID=playerID)
            if queryset.count() == 0:
                # create new player
                control_group = True
                farmers = Farmer.objects.all()
                if (farmers.count() > 0):
                    f = farmers[0]
                    if f.control_group:
                        control_group = False
                if playerID == "TESTER":
                    playerID = make_player_name();
                newFarmer = Farmer(playerID=playerID, name=playerID,
                       control_group=control_group)
                newFarmer.save()
                queryset = queryset.filter(playerID=playerID)
        return queryset.order_by('playerID')


class GameEventViewSet(viewsets.ModelViewSet):
    """ Serve a new instance of the Field boardgame with relevant settings"""
    # queryset = GameEvent.objects.all()
    serializer_class = GameEventSerializer
    permission_classes = API_PERMISSIONS
    filter_backends = [filters.SearchFilter]
    search_fields = [
        'playerID', 'gameID', 'infected_cow'
    ]

    def get_queryset(self):

        queryset = GameEvent.objects.all()
        if 'gameID' in self.request.query_params:
            gameID = self.request.query_params.get('gameID')
            queryset = queryset.filter(gameID=gameID)
        if 'playerID' in self.request.query_params:
            playerID = self.request.query_params.get('playerID')
            queryset = queryset.filter(playerID=playerID)

        return queryset.order_by('-gameID', 'turn', 'orderno')


class GameLandingView(TemplateView):
    """ Game landing page"""

    template_name = ("game/landing.html")

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        playerList = list()
        for player in FieldGame.objects.order_by('playerID').values(
            'playerID').distinct():
            playerList.append(player['playerID'])
        context['player_ids'] = playerList
        return context


class GameView(TemplateView):
    """ Serve our Phaser game, and log the user in as FieldGameGuest
    user if not logged in"""

    template_name = ("game/game_module.html")

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        if self.request.user.is_authenticated is False:
            # Log in as default field game user
            user = authenticate(
                username=settings.FIELD_GAME_USER,
                password=settings.FIELD_GAME_PASSWORD
            )
            if user is not None:
                login(self.request, user)
                context['session_id'] = self.request.session.session_key
        else:
            user = User.objects.get(username=self.request.user)
            context['session_id'] = self.request.COOKIES['sessionid']
        return context

    @method_decorator(requires_csrf_token)
    def dispatch(self, *args, **kwargs):
        return super().dispatch(*args, **kwargs)
