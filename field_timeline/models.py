"""
Timeline models for FIELD
By KDL(EH) 3/6/2020

Django models to support the import, modification and serialisation
of FIELD timeline events into a JSON format usable by timelineJS3
https://timeline.knightlab.com/

"""

import json

from django.db import models

from field.settings import TIMELINE_IMAGE_FOLDER, TIMELINE_IMAGE_FORMAT


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

    ordering = ['start_date_year']

    def serialise_start_date(self):
        """Get only relevant start dates, return as dict"""
        dates = {"year": self.start_date_year,
                 "display_date": self.start_date_year}
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
        data = {'start_date': self.serialise_start_date(),
                'display_date': "{}".format(self.start_date_year),
                }
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
    caption = models.TextField(blank=True, default='')
    photographer = models.CharField(max_length=256, blank=True)
    credit = models.CharField(max_length=256, blank=True)
    url = models.CharField(max_length=512, null=False, default='')
    link_url = models.CharField(max_length=512, null=True)

    def to_timeline_media(self):
        """Transform to a timelineJS media object"""
        url = self.url
        if len(url) == 0:
            # Add default resource name
            url = '{}.{}'.format(
                TIMELINE_IMAGE_FOLDER + '/' + self.resource_id,
                TIMELINE_IMAGE_FORMAT)
        media_data = {'url': url}
        if len(self.caption) > 0:
            media_data['caption'] = self.caption
        if len(self.credit) > 0:
            media_data['credit'] = self.credit
        if len(self.link_url) > 0:
            media_data['link'] = self.link_url
        return media_data

    def __str__(self):
        return "{}:{}, {}".format(
            self.resource_id,
            self.image_ref,
            self.url
        )


class FieldTimelineCategory(models.Model):
    category_name = models.CharField(max_length=256, blank=True)

    def __str__(self):
        return self.category_name


class FieldTimelineEvent(TimelineSlide):
    """An event in the FIELD timeline, inherited from slide"""
    category = models.ForeignKey('FieldTimelineCategory',
                                 on_delete=models.PROTECT, null=True)
    tier = models.IntegerField(null=False, blank=False, default=0)
    resource = models.ForeignKey('FieldTimelineResource',
                                 on_delete=models.CASCADE, null=True)
    linked_events = models.ManyToManyField('self', null=True)
    who = models.CharField(max_length=256, blank=False, null=False, default='')
    # css class for in-timeline links
    ev_target_class = "timeline_link"

    ordering = ['start_date_year']

    def get_timeline_data(self):
        data = super().get_timeline_data()
        # Add extra data from fieldtimeline
        if self.category:
            data['group'] = self.category.category_name
        if self.resource:
            data['media'] = self.resource.to_timeline_media()
        # If there's a resource, add it here
        if self.linked_events and self.linked_events.count() > 0:
            text = data['text']['text']
            text += "<br/>Related Events: "
            x = 0
            for linked_event in self.linked_events.all():
                if (x > 0):
                    text += ", "
                text += "<a href=\"#\" class=\"{}\" data-unique-id=\"{}\">{" \
                        "}</a>".format(
                    self.ev_target_class,
                    linked_event.unique_id,
                    linked_event.headline
                )
                x += 1
            data['text']['text'] = text
        return data

    def to_timeline_json(self):
        """ Add resources as media objects"""
        data = self.get_timeline_data()
        if self.resource:
            data['media'] = self.resource.to_timeline_media()
        return json.dumps(data)

    def __str__(self):
        return "{}:{}, {}".format(self.unique_id,
                                 self.start_date_year,
                                 self.headline
                                 )
