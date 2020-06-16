# from django.db import models
import wagtail
from django import forms
from django.conf import settings
from django.core.exceptions import ObjectDoesNotExist
from django.db import models
from django.http.response import HttpResponseRedirect
from django.shortcuts import render
from dublincore_resource.models import (DublinCoreResource)
from kdl_wagtail.core.models import (BaseRichTextPage, BasePage)
from modelcluster.fields import ParentalKey
from puput.models import EntryPage
from wagtail.admin.edit_handlers import (FieldPanel, MultiFieldPanel,
                                         HelpPanel, InlinePanel)
from wagtail.contrib.routable_page.models import route, RoutablePageMixin
from wagtail.core.models import (Page, Orderable)
from wagtail.documents.edit_handlers import DocumentChooserPanel
from wagtail.documents.models import Document
from wagtail.images.edit_handlers import ImageChooserPanel
from wagtail.images.models import (Image)
from wagtail.snippets.edit_handlers import SnippetChooserPanel
from wagtail.snippets.models import register_snippet

from field_timeline.models import (FieldTimelineEvent)
from field_timeline.views import (TimelineTemplateView)


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
        return super(HomePage, cls).can_create_at(parent) \
               and not cls.objects.exists()


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


""" Timeline page"""


class TimelinePage(BaseRichTextPage):
    """ A wagtail rich text page wrapper for the timeline"""

    def get_context(self, request, *args, **kwargs):
        context = super().get_context(request)
        # Use the field_timeline view to parse the request
        # A bit round the houses but left this way for modularity
        tv = TimelineTemplateView()
        context["ev_target_class"] = FieldTimelineEvent.ev_target_class
        context['timeline_json_url'] = tv.get_timeline_json_url(request)
        return context


"""Dublin core resource snippets and page"""


class AbstractDublinCoreWagtailMediaResource(DublinCoreResource):
    """A generic wagtail-dublincore media resource
    Could be moved to django-wagtail later if it proves useful.
    """
    # wagtail media we have metadata for
    # ONLY ONE should be populated
    wagtail_image = models.ForeignKey(Image, on_delete=models.CASCADE,
                                      blank=True, null=True)
    wagtail_document = models.ForeignKey(Document, on_delete=models.CASCADE,
                                         blank=True, null=True)

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
                FieldPanel('publisher'),
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
        MultiFieldPanel(
            [
                HelpPanel(
                    'Choose only one to attach, or use attachment for a '
                    'general resource'),
                ImageChooserPanel('wagtail_image'),
                DocumentChooserPanel('wagtail_document'),
                FieldPanel('attachment'),
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
        elif self.wagtail_document:
            return self.wagtail_document
        else:
            return None

    @property
    def attached_media(self):
        """
        Return raw file, will be finished if needed
        if self.wagtail_image:
            return self.wagtail_image
        elif self.wagtail_document:
            return self.wagtail_document
        else:"""
        return self.attachment

    def __str__(self):
        return self.title

    class Meta:
        abstract = True
        verbose_name = "Resource"


class AbstractDublinCoreResourcePage(Page):
    """ Abstract Page to present a resource as a stand alone detail page
        Also useful to allow a friendlier way of editing the resource"""

    class Meta:
        abstract = True


@register_snippet
class FieldDublinCoreResource(AbstractDublinCoreWagtailMediaResource):
    """This is the core resource object, to which pages and timeline events
    should link to
    We might:
        - add more fields for other media types e.g. video
    """
    pass


class FieldDublinCoreResourceItem(Orderable, models.Model):
    """List Item for dublin core resources"""
    page = ParentalKey('field_wagtail.FieldDublinCoreResourceListPage',
                       on_delete=models.CASCADE, related_name='resource_items')
    resource = models.ForeignKey('field_wagtail.FieldDublinCoreResource',
                                 on_delete=models.CASCADE, related_name='+')

    class Meta(Orderable.Meta):
        verbose_name = 'Media Resource'
        verbose_name_plural = 'Media Resources'

    panels = [
        SnippetChooserPanel('resource')
    ]

    def __str__(self):
        return self.resource


class FieldDublinCoreResourceListPage(BaseRichTextPage):
    """Page to list all resources"""

    content_panels = BaseRichTextPage.content_panels + [
        InlinePanel('resource_items', label="Media Resources"),
    ]




class FieldDublinCoreResourcePage(AbstractDublinCoreResourcePage):
    """ Page to present a resource as a stand alone detail page
    Also useful to allow a friendlier way of editing the resource"""
    resource = models.ForeignKey('FieldDublinCoreResource',
                                 on_delete=models.PROTECT)

    # def create(self, **kwargs):
    def __init__(self, *args, **kwargs):
        super(FieldDublinCoreResourcePage, self).__init__(*args, **kwargs)
        # Make sure we've got a resource object
        try:
            if self.resource is not None:
                return
        except ObjectDoesNotExist:
            self.resource = FieldDublinCoreResource()

    def save(self, *args, **kwargs):
        super(FieldDublinCoreResourcePage, self).save(*args, **kwargs)
        # Save the resource object as well in case edits have been made
        self.resource.save()

    content_panels = Page.content_panels + [
        FieldPanel('resource', heading="Resource")
    ]
