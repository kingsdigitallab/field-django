# Generated by Django 2.2.23 on 2022-09-21 16:34

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('field_game', '0002_event_type_defaults'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='gameevent',
            options={'ordering': ['created_at'], 'verbose_name': 'Field game event', 'verbose_name_plural': 'Field game events'},
        ),
        migrations.RemoveField(
            model_name='fieldgame',
            name='seedPhrase',
        ),
    ]