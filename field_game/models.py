import random

from django.db import models
from faker import Faker
from faker.providers import person


class FieldGame(models.Model):
    """One Instance of a Field game, including who played it and
    a descriptive log"""

    playerID = models.CharField(null=True, blank=True, max_length=128)
    gameID = models.BigIntegerField(default=0)
    final_score = models.IntegerField(default=0)
    seed = models.FloatField(default=0.0)
    creator_sessionid = models.CharField(null=True, blank=True, max_length=256)
    created_at = models.DateTimeField(auto_now_add=True)
    log = models.TextField(null=True, blank=True)
    control_group = models.BooleanField(default=True)

    class Meta:
        verbose_name = "Field game record"
        verbose_name_plural = "Field game records"
        ordering = ["created_at"]

    def save(self, force_insert=False, force_update=False, using=None,
             update_fields=None):
        """ After a new game is pushed, generate an id
        and a player id if one wasn't provided"""
        # New player, generate name
        if not self.playerID:
            self.playerID = make_player_name()
            # Save player object
            f = Farmer(playerID=self.playerID, name=self.playerID)
            f.save()
        # Create new game id
        games = FieldGame.objects.filter().all().order_by('-gameID')
        newGameID = 1
        if games.count() > 0:
            g = games[0]
            newGameID = g.gameID + 1
        self.gameID = newGameID
        super().save(force_insert, force_update, using, update_fields)

    def __str__(self):
        return self.playerID + ' : ' + str(self.gameID)


def make_player_name():
    """
    Generate a player id at random to keep track of games played
    by the same device, without any personal identifying information
    :return:
    """
    fake = Faker()
    fake.add_provider(person)
    newPlayerName = fake.first_name() + \
                    fake.last_name() + str(random.randint(0, 100000))
    # double check they're not already in there, unlikely
    if FieldGame.objects.filter(playerID=newPlayerName).count() > 0:
        # Add a zero
        newPlayerName = newPlayerName + '0';
    return newPlayerName


# instance.save()


class Farmer(models.Model):
    """A player in the game, for tracking AI farmers in logs
    will be used once AIs have behaviour profiles"""

    playerID = models.CharField(null=True, blank=True, max_length=128)
    name = models.CharField(null=True, blank=True, max_length=128)
    gamesPlayed = models.IntegerField(default=0)


class GameEvent(models.Model):
    """Simplified model to capture significant game events
    Currently transactions between players, and infection
    Could be expanded to other events if necessary"""

    playerID = models.CharField(null=True, blank=True, max_length=128)
    gameID = models.BigIntegerField(default=0)
    turn = models.IntegerField(default=0)
    orderno = models.IntegerField(default=0)
    event_type = models.ForeignKey("EventType", on_delete=models.SET_NULL,
                                   null=True)
    farmerA = models.CharField(null=True, blank=True, max_length=128)
    farmerB = models.CharField(null=True, blank=True, max_length=128)
    infected_cow = models.BooleanField(default=False)
    description = models.CharField(null=True, blank=True, max_length=128)
    created_at = models.DateTimeField(auto_now_add=True)
    creator_sessionid = models.CharField(null=True, blank=True, max_length=256)

    class Meta:
        verbose_name = "Field game event"
        verbose_name_plural = "Field game events"
        ordering = ["created_at"]

    def __str__(self):
        return (
            str(self.gameID) + '.' + str(self.turn) + ' : ' +
            self.description
        )


class EventType(models.Model):
    """ Authority for different types of events"""

    event_type = models.CharField(null=True, blank=True, max_length=256)

    class Meta:
        verbose_name = "Game event type"
        verbose_name_plural = "Game event types"
        ordering = ["event_type"]

    def __str__(self):
        return self.event_type
