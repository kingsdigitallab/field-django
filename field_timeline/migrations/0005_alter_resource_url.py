# Generated by Django 2.1.7 on 2020-06-09 12:12

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('field_timeline', '0004_url_to_linkurl'),
    ]

    operations = [
        migrations.AddField(
            model_name='fieldtimelineresource',
            name='url',
            field=models.CharField(default='', max_length=512),
        ),
        migrations.AlterField(
            model_name='fieldtimelineresource',
            name='link_url',
            field=models.CharField(max_length=512, null=True),
        ),
    ]
