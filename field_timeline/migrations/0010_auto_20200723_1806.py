# Generated by Django 2.2.14 on 2020-07-23 17:06

from django.db import migrations


class Migration(migrations.Migration):
    dependencies = [
        ('field_timeline',
         '0009_fieldtimelinecategory_fieldtimelineevent_fieldtimelineresource'
         '_timelineslide'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='fieldtimelineevent',
            name='category',
        ),
        migrations.RemoveField(
            model_name='fieldtimelineevent',
            name='linked_events',
        ),
        migrations.RemoveField(
            model_name='fieldtimelineevent',
            name='resource',
        ),
        migrations.RemoveField(
            model_name='fieldtimelineevent',
            name='timelineslide_ptr',
        ),
        migrations.DeleteModel(
            name='FieldTimelineCategory',
        ),
        migrations.DeleteModel(
            name='FieldTimelineEvent',
        ),
        migrations.DeleteModel(
            name='FieldTimelineResource',
        ),
        migrations.DeleteModel(
            name='TimelineSlide',
        ),
    ]
