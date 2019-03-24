# from django.db import models
from kdl_wagtail.core.models import BaseRichTextPage, BasePage
from django.conf import settings
from wagtail.core.models import Page
from puput.models import EntryPage
from django import forms
from django.db import models
from django.http.response import HttpResponseRedirect
from wagtail.contrib.routable_page.models import route, RoutablePageMixin
from wagtail.admin.edit_handlers import FieldPanel
from django.shortcuts import render


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
    agree = forms.BooleanField(required=True)


class MailingListFormPage(RoutablePageMixin, BasePage):
    success_message = models.TextField(
        help_text='Confirmation message to users who have just signed up',
        blank=True
    )
    error_message = models.TextField(
        help_text='Confirmation message to users who have just signed up',
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
            }
        )
