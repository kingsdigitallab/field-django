"""
Timeline models for FIELD
By KDL(EH) 3/6/2020

Django models to support the import, modification and serialisation
of FIELD timeline events into a JSON format usable by timelineJS3
https://timeline.knightlab.com/

"""

import json

from django.db import models


class TimelineSlide(models.Model):
    """Event for Timeline_JS
    Based on JSON format:
    https://timeline.knightlab.com/docs/json-format.html
    """

    unique_id = models.CharField(max_length=256, blank=True)

    # Start and End dates
    start_date_year = models.IntegerField(null=False, blank=False, default=0)
    start_date_month = models.IntegerField(null=False, blank=False, default=0)
    start_date_day = models.IntegerField(null=False, blank=False, default=0)

    end_date_year = models.IntegerField(null=False, blank=False, default=0)
    end_date_month = models.IntegerField(null=False, blank=False, default=0)
    end_date_day = models.IntegerField(null=False, blank=False, default=0)

    # Text fields to display
    headline = models.TextField(blank=True, default='')
    text = models.TextField(blank=True, default='')

    # Media

    def serialise_start_date(self):
        """Get only relevant start dates, return as dict"""
        dates = {"year": self.start_date_year}
        if self.start_date_month > 0:
            dates['month'] = self.start_date_month
        if self.start_date_day > 0:
            dates['day'] = self.start_date_day
        return dates

    def serialise_end_date(self):
        """Get only relevant start dates, return as dict"""
        dates = {"year": self.end_date_year}
        if self.end_date_month > 0:
            dates['month'] = self.end_date_month
        if self.end_date_day > 0:
            dates['day'] = self.end_date_day
        return dates

    def serialise_text(self):
        text = {}
        if len(self.headline) > 0:
            text['headline'] = self.headline
        if len(self.text) > 0:
            text['text'] = self.text
        return text

    def __str__(self):
        return '{}:{},{}"{}'.format(
            self.unique_id, self.start_date_year, self.headline, self.text)

    def get_timeline_data(self):
        """ Serialise object for timelineJS"""
        data = {'start_date': self.serialise_start_date()}
        if len(self.serialise_end_date()) > 0:
            data['end_date'] = self.serialise_end_date()
        if len(self.serialise_text()) > 0:
            data['text'] = self.serialise_text()
        if len(self.unique_id) > 0:
            data['unique_id'] = self.unique_id
        return data

    def to_timeline_json(self):
        return json.dumps(self.get_timeline_data())


class FieldTimelineResource(models.Model):
    resource_id = models.CharField(max_length=256, blank=False, null=False)
    image_ref = models.CharField(max_length=256, blank=True)
    caption = models.CharField(max_length=256, blank=True)
    photographer = models.CharField(max_length=256, blank=True)
    credit = models.CharField(max_length=256, blank=True)
    url = models.CharField(max_length=512, null=False)

    def to_timeline_media(self):
        """Transform to a timelineJS media object"""
        media_data = {'url': self.url}
        if len(self.caption) > 0:
            media_data['caption'] = self.caption
        if len(self.credit) > 0:
            media_data['credit'] = self.credit
        return media_data


class FieldTimelineEvent(TimelineSlide):
    """An event in the FIELD timeline, inherited from slide"""
    category = models.CharField(max_length=256, blank=True)
    tier = models.IntegerField(null=False, blank=False, default=0)
    resource = models.ForeignKey('FieldTimelineResource',
                                 on_delete=models.CASCADE)
    linked_events = models.ForeignKey('self', on_delete=models.CASCADE,
                                      null=True)

    def to_timeline_json(self):
        """ Add resources as media objects"""
        data = self.get_timeline_data()
        # If there's a resource, add it here
        if self.resource:
            data['media'] = self.resource.to_timeline_media()
        return json.dumps(data)
