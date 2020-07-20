"""
Timeline models
By KDL(EH) 17/7/2020

Django models to support the import, modification and serialisation
of timeline events into a JSON format usable by timelineJS3
https://timeline.knightlab.com/

Now includes optional wagtail integrations and KDL-Dublincore integrations

"""
import json
from django.db import models
from modelcluster.fields import ParentalKey
from wagtail.admin.edit_handlers import (FieldPanel, MultiFieldPanel,
                                         InlinePanel, HelpPanel)
from wagtail.core.models import (Page, Orderable)
from wagtail.images.edit_handlers import ImageChooserPanel
from wagtail.images.models import (Image)
from wagtail.search import index
from wagtail.snippets.edit_handlers import SnippetChooserPanel
from wagtail.snippets.models import register_snippet
from dublincore_resource.models import (DublinCoreAgent,
                                        DublinCoreRights,
                                        DublinCoreResource)
register_snippet(DublinCoreAgent)
register_snippet(DublinCoreRights)


class AbstractTimelineSlide(models.Model):
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
            self.unique_id, self.start_date_year, self.headline, self.text
        )

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

    class Meta:
        abstract = True


"""
Implementation objects.  Current flavours are:

1. Pure Django with attached image object
2. Wagtail, with timeline index, slides as snippets, and wagtailimage
3. Wagtail objects, plus Dublin Core resource

"""


class TimelineSlide(AbstractTimelineSlide):
    """Plain vanilla slide, mostly used for testing """
    pass


class TimelineSlideWithImage(AbstractTimelineSlide):
    """ 'Pure' django implementation with attached image """
    image = models.ImageField(null=True)


class AbstractTimelineEventSnippet(index.Indexed, AbstractTimelineSlide):
    class Meta:
        abstract = True

    panels = [
        MultiFieldPanel(
            [
                MultiFieldPanel(
                    [
                        FieldPanel('start_date_year'),
                        FieldPanel('start_date_month'),
                        FieldPanel('start_date_day'),
                    ],
                    heading="Start Date",
                    classname="collapsible"
                ),
                MultiFieldPanel(
                    [
                        FieldPanel('end_date_year'),
                        FieldPanel('end_date_month'),
                        FieldPanel('end_date_day'),
                    ],
                    heading="End Date",
                    classname="collapsible"
                ),
            ],
            heading="Dates",
            classname="collapsible"
        ),
        FieldPanel('headline'),
        FieldPanel('text'),
    ]

    search_fields = [
        index.SearchField('headline', partial_match=True),
        index.SearchField('text', partial_match=True),
    ]


class AbstractTimelinePage(Page):
    """ A wagtail rich text page wrapper for the timeline"""

    def get_context(self, request, *args, **kwargs):
        context = super().get_context(request)
        return context

    class Meta:
        abstract = True


@register_snippet
class TimelineEventWithImageSnippet(AbstractTimelineEventSnippet):
    image = models.ForeignKey(
        Image,
        on_delete=models.CASCADE,
        blank=True, null=True
    )

    panels = AbstractTimelineEventSnippet.panels + [
        ImageChooserPanel('image')
    ]


class TimelineEventWithImageItem(
    Orderable,
    TimelineEventWithImageSnippet
):
    page = ParentalKey(
        'django_kdl_timeline.TimelinePage',
        on_delete=models.CASCADE,
        related_name='related_events')


class TimelinePage(Page):
    content_panels = Page.content_panels + [
        InlinePanel('related_events', label="Timeline Events"),
    ]


class AbstractDublinCoreWagtailMediaResource(DublinCoreResource):
    """A generic wagtail-dublincore media resource
    Could be moved to django-wagtail later if it proves useful.
    """

    panels = [
        MultiFieldPanel(
            [
                FieldPanel('identifier'),
                FieldPanel('title'),
                FieldPanel('date'),
                FieldPanel('issued'),
                FieldPanel('is_part_of'),
                FieldPanel('bibliographic_citation'),
            ],
            heading="Identifying information",
            classname="collapsible"
        ),
        MultiFieldPanel(
            [
                FieldPanel('creators'),
                FieldPanel('contributors'),
                FieldPanel('publisher'),
                FieldPanel('rights'),
                FieldPanel('description'),
                FieldPanel('rights'),
            ],
            heading='Agents',
            classname="collapsible"
        ),
        MultiFieldPanel(
            [
                FieldPanel('description'),
                FieldPanel('subjects'),
                FieldPanel('coverage'),
                FieldPanel('spatial'),
                FieldPanel('temporal'),
                FieldPanel('languages'),
                FieldPanel('type'),
                FieldPanel('format'),
            ],
            heading='Content description',
            classname="collapsible"
        ),
        MultiFieldPanel(
            [
                FieldPanel('source'),
            ],
            heading='Other terms',
            classname="collapsible collapsed"
        ),

    ]

    @property
    def wagtail_media(self):
        """ Return attached wagtail media objects
        If a general file has been attached, return none for now
        """
        return None

    @property
    def attached_media(self):
        return self.attachment

    def __str__(self):
        return self.title

    class Meta:
        abstract = True
        verbose_name = "Resource"


@register_snippet
class DublinCoreImage(AbstractDublinCoreWagtailMediaResource):
    """This is the core resource object,
    to which pages and timeline events should link to

    We might:
        - add more fields for other media types e.g. video
    """
    wagtail_image = models.ForeignKey(
        Image,
        on_delete=models.CASCADE,
        null=True
    )

    panels = AbstractDublinCoreWagtailMediaResource.panels + [
        MultiFieldPanel(
            [
                HelpPanel('Choose resource to attach'),
                ImageChooserPanel('wagtail_image'),
            ],
            heading="Attached resource",
            classname="collapsible"
        )
    ]

    @property
    def wagtail_media(self):
        """ Return attached wagtail media objects
        If a general file has been attached, return none for now
        """
        if self.wagtail_image:
            return self.wagtail_image
        return None

    @property
    def attached_media(self):
        return self.wagtail_media


@register_snippet
class TimelineEventWithDCImageSnippet(
    AbstractTimelineEventSnippet
):
    """ Event with a DC Image attached"""
    resource = models.ForeignKey(
        'DublinCoreImage',
        on_delete=models.CASCADE, related_name='+'
    )

    panels = AbstractTimelineEventSnippet.panels + [
        SnippetChooserPanel('resource')
    ]


class TimelineEventWithDCImageItem(
    Orderable,
    TimelineEventWithDCImageSnippet
):
    page = ParentalKey(
        'django_kdl_timeline.TimelineDCItemPage',
        on_delete=models.CASCADE,
        related_name='related_events')


class TimelineDCItemPage(AbstractTimelinePage):
    content_panels = Page.content_panels + [
        InlinePanel('related_events', label="Timeline Events"),
    ]
