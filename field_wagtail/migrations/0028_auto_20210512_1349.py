# Generated by Django 2.2.15 on 2021-05-12 12:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('field_wagtail', '0027_fieldimage_caption'),
    ]

    operations = [
        migrations.AlterField(
            model_name='fieldimage',
            name='caption',
            field=models.CharField(blank=True, max_length=256, null=True),
        ),
    ]
