# Generated by Django 2.2.15 on 2021-05-12 12:50

from django.db import migrations
import wagtail.core.fields


class Migration(migrations.Migration):

    dependencies = [
        ('field_wagtail', '0028_auto_20210512_1349'),
    ]

    operations = [
        migrations.AlterField(
            model_name='fieldimage',
            name='caption',
            field=wagtail.core.fields.RichTextField(blank=True, null=True),
        ),
    ]