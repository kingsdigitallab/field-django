# Generated by Django 2.2.15 on 2021-04-20 09:13

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('field_wagtail', '0025_field_image_data'),
    ]

    operations = [
        migrations.AlterField(
            model_name='fieldimage',
            name='alt_text',
            field=models.CharField(blank=True, max_length=256, null=True),
        ),
    ]
