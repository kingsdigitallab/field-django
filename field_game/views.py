from django.conf import settings
from field_game.models import FieldGame, GameEvent, Farmer
from field_game.serializers import (
    FieldGameSerializer,
    GameEventSerializer,
    FarmerSerializer,
)
from django.middleware import csrf
from rest_framework import viewsets, permissions
from django.views.generic import TemplateView
from django.contrib.auth import authenticate, login
from django.contrib.auth.models import User
from django.utils.decorators import method_decorator
from django.views.decorators.csrf import csrf_protect
from django.views.decorators.csrf import requires_csrf_token

# to toggle between easy for debug and production
if settings.DEBUG:
    API_PERMISSIONS = [permissions.IsAuthenticatedOrReadOnly]
else:
    API_PERMISSIONS = [permissions.IsAuthenticatedOrReadOnly]


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

    @method_decorator(csrf_protect)
    def create(self, request, *args, **kwargs):
        return super().create(self, request, *args, **kwargs)

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
        else:
            user = User.objects.get(username=self.request.user)
        context['session_id'] = self.request.COOKIES['sessionid']
        return context

    @method_decorator(requires_csrf_token)
    def dispatch(self, *args, **kwargs):
        return super().dispatch(*args, **kwargs)


