from django.contrib import admin

# Register your models here.
from field_timeline.models import (FieldTimelineEvent, FieldTimelineResource,
                                   FieldTimelineCategory)


class FieldTimelineEventAdmin(admin.ModelAdmin):
    list_display = ('start_date_year', 'unique_id', 'headline', 'text')
    search_fields = ('start_date_year', 'unique_id', 'headline', 'text')
    """
    fieldsets = (        
        ('Start Date', {
            'fields': ('start_date_year')
        }),
    )"""



class FieldTimelineResourceAdmin(admin.ModelAdmin):
    list_display = (
    'resource_id', 'filename', 'title', 'link_url')
    search_fields = ('resource_id',)


admin.site.register(FieldTimelineEvent, FieldTimelineEventAdmin)
admin.site.register(FieldTimelineResource, FieldTimelineResourceAdmin)
admin.site.register(FieldTimelineCategory)
