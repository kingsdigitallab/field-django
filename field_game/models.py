from django.db import models


class FieldGame(models.Model):
    """One Instance of a Field game, including who played it and
    a descriptive log"""

    playerID = models.CharField(null=True, blank=True, max_length=128)
    gameID = models.BigIntegerField(default=0)
    final_score = models.IntegerField(default=0)
    seedPhrase = models.CharField(null=True, blank=True, max_length=128)
    created_at = models.DateTimeField(auto_now_add=True)
    log = models.TextField(null=True, blank=True)

    class Meta:
        verbose_name = "Field game record"
        verbose_name_plural = "Field game records"
        ordering = ["created_at"]


class Farmer(models.Model):
    """A player in the game, for tracking AI farmers in logs
    will be used once AIs have behaviour profiles"""

    farmerID = models.CharField(null=True, blank=True, max_length=128)
    name = models.CharField(null=True, blank=True, max_length=128)


class GameEvent(models.Model):
    """Simplified model to capture significant game events
    Currently transactions between players, and infection
    Could be expanded to other events if necessary"""

    playerID = models.CharField(null=True, blank=True, max_length=128)
    gameID = models.BigIntegerField(default=0)
    turn = models.IntegerField(default=0)
    orderno = models.IntegerField(default=0)
    event_type = models.ForeignKey("EventType", on_delete=models.SET_NULL, null=True)
    farmerA = models.ForeignKey(
        "Farmer", null=True, on_delete=models.SET_NULL, related_name="farmer_A"
    )
    farmerB = models.ForeignKey(
        "Farmer", null=True, on_delete=models.SET_NULL, related_name="farmer_B"
    )
    description = models.CharField(null=True, blank=True, max_length=128)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        verbose_name = "Field game record"
        verbose_name_plural = "Field game records"
        ordering = ["created_at"]


class EventType(models.Model):
    """ Authority for different types of events"""

    event_type = models.CharField(null=True, blank=True, max_length=256)

    class Meta:
        verbose_name = "Game event type"
        verbose_name_plural = "Game event types"
        ordering = ["event_type"]
