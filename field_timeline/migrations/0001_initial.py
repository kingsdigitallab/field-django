# Generated by Django 2.1.7 on 2020-06-04 15:24

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='FieldTimelineCategory',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('category_name', models.CharField(blank=True, max_length=256)),
            ],
        ),
        migrations.CreateModel(
            name='FieldTimelineResource',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('resource_id', models.CharField(max_length=256)),
                ('image_ref', models.CharField(blank=True, max_length=256)),
                ('caption', models.CharField(blank=True, max_length=256)),
                ('photographer', models.CharField(blank=True, max_length=256)),
                ('credit', models.CharField(blank=True, max_length=256)),
                ('url', models.CharField(max_length=512)),
            ],
        ),
        migrations.CreateModel(
            name='TimelineSlide',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('unique_id', models.CharField(blank=True, max_length=256)),
                ('start_date_year', models.IntegerField(default=0)),
                ('start_date_month', models.IntegerField(default=0)),
                ('start_date_day', models.IntegerField(default=0)),
                ('end_date_year', models.IntegerField(default=0)),
                ('end_date_month', models.IntegerField(default=0)),
                ('end_date_day', models.IntegerField(default=0)),
                ('headline', models.TextField(blank=True, default='')),
                ('text', models.TextField(blank=True, default='')),
            ],
        ),
        migrations.CreateModel(
            name='FieldTimelineEvent',
            fields=[
                ('timelineslide_ptr', models.OneToOneField(auto_created=True, on_delete=django.db.models.deletion.CASCADE, parent_link=True, primary_key=True, serialize=False, to='field_timeline.TimelineSlide')),
                ('tier', models.IntegerField(default=0)),
                ('who', models.CharField(default='', max_length=256)),
                ('category', models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, to='field_timeline.FieldTimelineCategory')),
                ('linked_events', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='field_timeline.FieldTimelineEvent')),
                ('resource', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='field_timeline.FieldTimelineResource')),
            ],
            bases=('field_timeline.timelineslide',),
        ),
    ]
