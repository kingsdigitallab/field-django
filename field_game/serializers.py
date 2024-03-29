from rest_framework.relations import PrimaryKeyRelatedField

from .models import FieldGame, Farmer, GameEvent, EventType
from rest_framework import serializers


class FieldGameSerializer(serializers.ModelSerializer):
    class Meta:
        model = FieldGame
        fields = [
            "playerID",
            "gameID",
            "control_group",
            "final_score",
            "seed",
            "log",
            "created_at"
        ]


class FarmerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Farmer
        fields = [
            "farmerID",
            "name"
        ]


class GameEventSerializer(serializers.ModelSerializer):
    event_type = PrimaryKeyRelatedField(queryset=EventType.objects.all())
    class Meta:
        model = GameEvent
        fields = [
            "playerID",
            "gameID",
            "turn",
            "orderno",
            "event_type",
            "farmerA",
            "farmerB",
            "description",
            "infected_cow",
            "created_at",
            "creator_sessionid",
        ]
