# Generated by Django 2.2.23 on 2023-04-25 13:59

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('field_game', '0011_fieldgame_played_before'),
    ]

    operations = [
        migrations.AddField(
            model_name='fieldgame',
            name='infection_visible',
            field=models.BooleanField(default=True),
        ),
    ]