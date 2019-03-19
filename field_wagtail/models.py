# from django.db import models
from kdl_wagtail.core.models import BaseRichTextPage
from django.conf import settings
from wagtail.core.models import Page
from puput.models import EntryPage


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
