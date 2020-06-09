from django.contrib import admin

# Register your models here.
from field_timeline.models import (FieldTimelineEvent, FieldTimelineResource,FieldTimelineCategory)


class FieldTimelineEventAdmin(admin.ModelAdmin):
    pass


admin.site.register(FieldTimelineEvent, FieldTimelineEventAdmin)
admin.site.register(FieldTimelineResource)
admin.site.register(FieldTimelineCategory)