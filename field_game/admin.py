from django.contrib import admin
from .models import FieldGame, Farmer, GameEvent, EventType
# Register your models here.
admin.site.register(FieldGame)
admin.site.register(Farmer)
admin.site.register(GameEvent)
admin.site.register(EventType)
