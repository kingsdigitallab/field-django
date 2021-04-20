import json
from typing import Union, Dict, Any

import wagtail
from django import forms
from django.conf import settings
from django.db import models
from django.http.response import HttpResponseRedirect
from django.shortcuts import render
from django.urls import reverse
from django.utils.text import Truncator
from dublincore_resource.models import (DublinCoreAgent, DublinCoreRights)
from kdl_wagtail.core.models import (BaseRichTextPage, BasePage)
from modelcluster.fields import ParentalKey
from modelcluster.models import ClusterableModel
from puput.models import EntryPage
from wagtail.admin.edit_handlers import (
    FieldPanel, InlinePanel
)
from wagtail.contrib.routable_page.models import route, RoutablePageMixin
from wagtail.core.models import (Page, Orderable)
from wagtail.images.edit_handlers import ImageChooserPanel
from wagtail.images.models import (
    Image,
    AbstractImage,
    AbstractRendition
)
from wagtail.snippets.edit_handlers import SnippetChooserPanel
from wagtail.snippets.models import register_snippet


from django_kdl_timeline.models import (
    AbstractTimelineEventSnippet,
    AbstractDublinCoreWagtailMediaResource,
    AbstractTimelinePage
)


class HomePage(BaseRichTextPage):
    parent_page_types = ['wagtailcore.Page']

    def get_context(self, request):
        ret = super().get_context(request)

        ret['communities_root'] = Page.objects.filter(
            slug=settings.FIELD_COMMUNITIES_ROOT_SLUG
        ).first()

        ret['news'] = EntryPage.objects.filter(
            live=True
        ).order_by('-first_published_at')

        Image = wagtail.images.get_image_model()

        ret['media_images'] = Image.objects.filter(
            tags__name='homepage'
        ).order_by('?')

        return ret

    @classmethod
    def can_create_at(cls, parent):
        # You can only create one of these!
        return (super(HomePage, cls).can_create_at(parent)
                and not cls.objects.exists())


class MailingListForm(forms.Form):
    email = forms.EmailField()
    first_name = forms.CharField(max_length=64)
    last_name = forms.CharField(max_length=64)
    agree = forms.BooleanField(
        label='I agree with below statement', required=True)


class MailingListFormPage(RoutablePageMixin, BasePage):
    success_message = models.TextField(
        help_text='Confirmation message to users who have just signed up',
        blank=True
    )
    error_message = models.TextField(
        help_text='Error message in case the use cannot re-subscribe',
        blank=True
    )

    content_panels = BasePage.content_panels + [
        FieldPanel('success_message', classname='full'),
        FieldPanel('error_message', classname='full')
    ]

    @route(r'^$')
    def serve_form(self, request):
        context = self.get_context(request)
        if context['submitted_code']:
            # then redirect to confirmation page
            return HttpResponseRedirect(
                self.get_url(request) + self.reverse_subpage(
                    'mailinglist_submitted',
                    args=(context['submitted_code'],)
                )
            )
        else:
            return super(MailingListFormPage, self).serve(request)

    def get_context(self, request):
        ret = super().get_context(request)
        ret['submitted_code'] = 0

        if request.method == 'POST':
            form = MailingListForm(request.POST)
            if form.is_valid():
                # we sign them up with mailchimp API
                from .utils import MailingList
                mailing_list = MailingList()

                error = mailing_list.subscribe({
                    'EMAIL': form.cleaned_data['email'],
                    'FNAME': form.cleaned_data['first_name'],
                    'LNAME': form.cleaned_data['last_name'],
                    # 'ORG': form.cleaned_data['organisation'],
                })

                ret['submitted_code'] = error
        else:
            form = MailingListForm()

        ret['hide_footer_mailing_list'] = True
        ret['mailing_list_form'] = form

        return ret

    @route(r'^submitted-(\d+)/$', name='mailinglist_submitted')
    def serve_newsletter_signed(self, request, submitted_code=None):

        submitted_code = int(submitted_code or 0)

        return render(
            request,
            'field_wagtail/mailing_list_submitted_page.html',
            {
                'page': self,
                'submitted_code': submitted_code,
                'hide_footer_mailing_list': True,
            }
        )


class FieldTimelineResourceImage(Orderable, models.Model):
    image_rendition = 'width-400'
    thumb_rendition = 'width-50'

    resource = ParentalKey(
        'FieldTimelineResource',
        on_delete=models.CASCADE,
        null=True,
        related_name='related_images'
    )

    image = models.ForeignKey(
        Image,
        on_delete=models.CASCADE,
        null=True
    )

    panels = [
        ImageChooserPanel('image')
    ]

    @property
    def rendition_url(self) -> str:
        if self.image:
            try:
                return self.image.get_rendition(self.image_rendition).url
            except Exception:
                pass
        return ''

    @property
    def thumbnail_url(self) -> str:
        if self.image:
            try:
                return self.image.get_rendition(self.thumb_rendition).url
            except Exception:
                pass
        return ''

    def __str__(self):
        return str(self.resource) + '/' + self.image.filename

    class Meta:
        verbose_name = 'Timeline Resource'


class FieldTimelineResource(ClusterableModel,
                            AbstractDublinCoreWagtailMediaResource):
    filename = models.CharField(max_length=256, blank=False, null=False,
                                default='')
    image_ref = models.CharField(max_length=256, blank=True)
    caption = models.TextField(blank=True, default='')
    credit = models.CharField(max_length=256, blank=True)
    link_url = models.CharField(max_length=512, null=True)
    resource_type = models.CharField(
        max_length=64, choices=[
            ('I', 'IMAGE'),
            ('D', 'DOCUMENT'),
            ('A', 'AUDIO'),
            ('V', 'VIDEO')],
        default='I'
    )
    panels = AbstractDublinCoreWagtailMediaResource.panels + [
        InlinePanel('related_images', label="Images"),
    ]

    @property
    def attached_media(self) -> Union[None, FieldTimelineResourceImage]:
        """ Return the attached resource
        currently only images, but video and perhaps audio could be added"""
        if self.resource_type == 'I':
            img = FieldTimelineResourceImage.objects.filter(resource=self)
            if img and img.count() > 0:
                return img[0]
        return None

    def to_timeline_media(self) -> Dict[str, Any]:
        """Transform to a timelineJS media object"""
        url = ''
        if self.resource_type == 'I' and self.attached_media:
            url = self.attached_media.rendition_url
        if len(url) > 0:
            media_data = {'url': url,
                          'thumbnail': self.attached_media.thumbnail_url, }
            if len(self.caption) > 0:
                media_data['caption'] = self.caption
            photographer = ''
            if self.creators and self.creators.count() > 0:
                photographer = ', '.join(
                    [creator.full_name for creator in self.creators.all()]
                )
            if len(photographer) > 0 and len(self.credit) > 0:
                media_data['credit'] = "{} / {}".format(
                    photographer,
                    self.credit
                )
            elif len(photographer) > 0:
                media_data['credit'] = "{}".format(
                    photographer,
                )
            elif len(self.credit) > 0:
                media_data['credit'] = self.credit
            if self.link_url and len(self.link_url) > 0:
                media_data['link'] = self.link_url
            return media_data
        return {'url': url}

    def __str__(self):
        return "{}".format(
            self.identifier
        )


class FieldTimelineCategory(models.Model):
    category_name = models.CharField(max_length=256, blank=True)

    class Meta:
        verbose_name = "Timeline Category"
        verbose_name_plural = "Timeline Categories"

    def __str__(self):
        return self.category_name


class FieldOralHistory(models.Model):
    timeline_event = models.ForeignKey(
        'FieldTimelineEvent',
        on_delete=models.PROTECT, null=True
    )
    speaker = models.CharField(
        max_length=256, blank=False, null=False, default=''
    )
    place = models.CharField(
        max_length=256, blank=False, null=False, default=''
    )
    era = models.CharField(
        max_length=128, blank=False, null=False, default=''
    )
    text = models.TextField(blank=True, default='')
    rights = models.ForeignKey(
        DublinCoreRights,
        null=True, blank=True,
        on_delete=models.SET_NULL
    )

    class Meta:
        verbose_name = "Oral History"
        verbose_name_plural = "Oral Histories"

    def __str__(self):
        return "{}:{}".format(
            self.speaker,
            Truncator(self.text).words(10)
        )


"""An event in the FIELD timeline, inherited from slide"""


class FieldTimelineEvent(AbstractTimelineEventSnippet):
    category = models.ForeignKey('FieldTimelineCategory',
                                 on_delete=models.PROTECT, null=True)
    tier = models.IntegerField(null=False, blank=False, default=0)
    resource = models.ForeignKey('FieldTimelineResource',
                                 on_delete=models.CASCADE, blank=True,
                                 null=True)
    linked_events = models.ManyToManyField('self', blank=True)
    next_event = models.ForeignKey('FieldTimelineEvent',
                                   help_text='Next event in theme',
                                   on_delete=models.SET_NULL,
                                   related_name='previous_event',
                                   blank=True,
                                   null=True)

    who = models.CharField(max_length=256, blank=True, null=False, default='')
    additional_information = models.TextField(blank=True, default='')
    # css class for in-timeline links
    ev_target_class = "timeline_link"

    ordering = ['-start_date_year']

    panels = AbstractTimelineEventSnippet.panels + [
        FieldPanel('category'),
        FieldPanel('tier'),
        FieldPanel('who'),
        FieldPanel('additional_information'),
        SnippetChooserPanel('resource'),
        SnippetChooserPanel('next_event'),
        FieldPanel('linked_events')
    ]

    def get_timeline_data(self) -> Dict[str, Union[Dict[str, int]]]:
        data = super().get_timeline_data()
        # Add extra data from fieldtimeline
        if self.category:
            data['group'] = self.category.category_name
        # If there's a resource, add it here
        if self.resource:
            data['media'] = self.resource.to_timeline_media()
        # next event in theme/thread
        if self.next_event or self.previous_event.count() > 0:
            text = data['text']['text']
            text += "<br/>Related Events: "
            if self.previous_event.count() > 0:
                previous_event = FieldTimelineEvent.objects.filter(
                    next_event=self)[0]
                text += ("<a href=\"#\" class=\"{}\" "
                         "data-unique-id=\"{}\">< {}</a>").format(
                    self.ev_target_class,
                    previous_event.unique_id,
                    Truncator(previous_event.headline).words(5)
                )
            if self.next_event:
                if self.previous_event.count() > 0:
                    text += " | "
                text += ("<a href=\"#\" class=\"{}\" "
                         "data-unique-id=\"{}\">{} ></a>").format(
                    self.ev_target_class,
                    self.next_event.unique_id,
                    Truncator(self.next_event.headline).words(5)
                )
            data['text']['text'] = text

        # Commented out but kept in case
        # linked events are restored to timeline
        # if self.linked_events and self.linked_events.count() > 0:
        #
        #     text += "<br/>Related Events: "
        #     x = 0
        #     for linked_event in self.linked_events.all():
        #         if (x > 0):
        #             text += ", "
        #             text += ("<a href=\"#\" class=\"{}\" "
        #                      "data-unique-id=\"{}\">{}</a>").format(
        #                 self.ev_target_class,
        #                 linked_event.unique_id,
        #                 linked_event.headline
        #             )
        #         x += 1
        #     data['text']['text'] = text
        return data

    def to_timeline_json(self) -> str:
        data = self.get_timeline_data()
        if self.resource:
            data['media'] = self.resource.to_timeline_media()
        return json.dumps(data)

    def __str__(self) -> str:
        return "{}:{}, {}".format(
            self.unique_id,
            self.start_date_year,
            self.headline
        )


class FieldTimelineEventItem(Orderable, models.Model):
    page = ParentalKey(
        'field_wagtail.FieldTimelinePage',
        on_delete=models.CASCADE,
        related_name='related_events')
    event = models.ForeignKey(
        'field_wagtail.FieldTimelineEvent',
        on_delete=models.PROTECT, related_name='+')

    class Meta(Orderable.Meta):
        verbose_name = "Timeline events"
        verbose_name_plural = "Timeline events"

    panels = [
        SnippetChooserPanel('event'),
    ]

    ordering = ['-event.start_date_year']

    def __str__(self):
        return self.page.title + " -> " + self.event.unique_id


class FieldTimelinePage(AbstractTimelinePage):
    content_panels = AbstractTimelinePage.content_panels + [
        InlinePanel('related_events', label="Events"),
    ]

    def get_timeline_json_url(self, request):
        timeline_url = reverse('timeline_json')
        # Add filter GET variable
        filters = ''
        if 'category' in request.GET:
            filters = 'category={}'.format(request.GET['category'])
        if len(filters) > 0:
            timeline_url += '?' + filters
        return timeline_url

    def get_context(self, request, *args, **kwargs):
        context = super().get_context(request)
        # Use the field_timeline view to parse the request
        # A bit round the houses but left this way for modularity
        context["ev_target_class"] = FieldTimelineEvent.ev_target_class
        context['timeline_json_url'] = self.get_timeline_json_url(request)
        return context


class FieldImage(AbstractImage):
    alt_text = models.CharField(max_length=256, null=True, blank=True)

    admin_form_fields = Image.admin_form_fields + (
        'alt_text',
    )


class FieldImageRendition(AbstractRendition):
    image = models.ForeignKey(
        FieldImage, on_delete=models.CASCADE, related_name='renditions'
    )

    class Meta:
        unique_together = (
            ('image', 'filter_spec', 'focal_point_key'),
        )


# hiding this for now, shouldn't need to be accessed directly
# register_snippet(FieldTimelineResourceImage)
register_snippet(DublinCoreAgent)
register_snippet(DublinCoreRights)
register_snippet(FieldTimelineResource)
register_snippet(FieldTimelineEvent)
register_snippet(FieldOralHistory)
register_snippet(FieldTimelineCategory)
