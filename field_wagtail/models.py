import json
import wagtail
from django_kdl_timeline.models import (
    AbstractTimelineEventSnippet,
    AbstractDublinCoreWagtailMediaResource
)
from wagtail.images.models import (Image)
from django import forms
from django.conf import settings
from django.db import models
from django.http.response import HttpResponseRedirect
from django.shortcuts import render
from dublincore_resource.models import (DublinCoreAgent, DublinCoreRights)
from kdl_wagtail.core.models import (BaseRichTextPage, BasePage)
from puput.models import EntryPage
from wagtail.admin.edit_handlers import (FieldPanel)
from wagtail.contrib.routable_page.models import route, RoutablePageMixin
from wagtail.core.models import (Page)
# from wagtail.images.edit_handlers import ImageChooserPanel
from wagtail.snippets.models import register_snippet

register_snippet(DublinCoreAgent)
register_snippet(DublinCoreRights)
# register_snippet(FieldTimelineEvent)


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


class FieldTimelineResource(AbstractDublinCoreWagtailMediaResource):
    # resource_id = models.CharField(max_length=256, blank=False, null=False)
    filename = models.CharField(max_length=256, blank=False, null=False,
                                default='')
    image_ref = models.CharField(max_length=256, blank=True)
    # rights = models.CharField(max_length=64, blank=False, null=True)
    # date = models.CharField(max_length=64, blank=False, null=True)
    caption = models.TextField(blank=True, default='')
    # photographer = models.CharField(max_length=256, blank=True)
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

    def to_timeline_media(self):
        # todo REFACTOR to use attached image, DC fields
        """Transform to a timelineJS media object"""
        url = self.url
        # if len(url) == 0:
        #     # Add default resource name
        #     url = '{}.{}'.format(
        #         TIMELINE_IMAGE_FOLDER + '/' + self.filename,
        #         TIMELINE_IMAGE_FORMAT)
        # newimage = myimage.get_rendition('fill-300x150|jpegquality-60')
        media_data = {'url': url, 'thumbnail': url, }
        # if len(self.caption) > 0:
        #     media_data['caption'] = self.caption
        # if len(self.photographer) > 0 and len(self.credit) > 0:
        #     media_data['credit'] = "{} / {}".format(
        #         self.photographer,
        #         self.credit
        #     )
        # elif len(self.photographer) > 0:
        #     media_data['credit'] = "{}".format(
        #         self.photographer,
        #     )
        # elif len(self.credit) > 0:
        #     media_data['credit'] = self.credit
        # if self.link_url and len(self.link_url) > 0:
        #     media_data['link'] = self.link_url
        return media_data

    def __str__(self):
        return "{}:{}, {}".format(
            self.resource_id,
            self.caption,
            self.link_url
        )


class FieldTimelineCategory(models.Model):
    category_name = models.CharField(max_length=256, blank=True)

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


"""An event in the FIELD timeline, inherited from slide"""


class FieldTimelineEvent(AbstractTimelineEventSnippet):
    category = models.ForeignKey('FieldTimelineCategory',
                                 on_delete=models.PROTECT, null=True)
    tier = models.IntegerField(null=False, blank=False, default=0)
    resource = models.ForeignKey('FieldTimelineResource',
                                 on_delete=models.CASCADE, null=True)
    linked_events = models.ManyToManyField('self')
    who = models.CharField(max_length=256, blank=False, null=False, default='')
    additional_information = models.TextField(blank=True, default='')
    # css class for in-timeline links
    ev_target_class = "timeline_link"

    ordering = ['-start_date_year']

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
                    text += ("<a href=\"#\" class=\"{}\" "
                             "data-unique-id=\"{}\">{}</a>").format(
                        self.ev_target_class,
                        linked_event.unique_id,
                        linked_event.headline
                    )
                x += 1
            data['text']['text'] = text
        return data

    def to_timeline_json(self):
        data = self.get_timeline_data()
        if self.resource:
            data['media'] = self.resource.to_timeline_media()
        return json.dumps(data)

    def __str__(self):
        return "{}:{}, {}".format(
            self.unique_id,
            self.start_date_year,
            self.headline
        )


class FieldTimelineResourceImage(models.Model):
    resource = models.ForeignKey(
        'FieldTimelineResource',
        on_delete=models.CASCADE,
        null=True,
    )

    image = models.ForeignKey(
        Image,
        on_delete=models.CASCADE,
        null=True
    )
