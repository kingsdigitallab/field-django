# Generated by Django 2.1.7 on 2019-03-13 13:59
'''
Converts wagtail pages created with deprecated package and model
    kdl_wagtail_page.models.RichPage
Into the new reusable kdl package and model
    kdl_wagtail.core.models.RichTextPage
'''
from django.db import migrations
from field_wagtail.utils import migrate_wagtail_page_type


def convert_pages(apps, schema_editor):
    def copy(page_from, page_to):
        # page_to.body = page_from.body
        pass

    mapping = {
        'models': {
            'from': ('kdl_wagtail_page', 'RichPage'),
            'to': ('kdl_wagtail_core', 'RichTextPage'),
        },
        'copy': copy,
    }
    migrate_wagtail_page_type(apps, schema_editor, mapping)

    # raise Exception('ROLLBACK')


class Migration(migrations.Migration):

    dependencies = [
        ('kdl_wagtail_page', '0001_initial'),
        ('kdl_wagtail_core', '0008_form_fields_order'),
    ]

    operations = [
        migrations.RunPython(convert_pages),
    ]