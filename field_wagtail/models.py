# from django.db import models
from kdl_wagtail.core.models import BaseRichTextPage


class HomePage(BaseRichTextPage):

    parent_page_types = ['wagtailcore.Page']

    @classmethod
    def can_create_at(cls, parent):
        # You can only create one of these!
        return super(HomePage, cls).can_create_at(parent) \
            and not cls.objects.exists()
