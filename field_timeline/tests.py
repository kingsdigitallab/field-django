from django.test import Client
from django.test import TestCase
from django.test.client import RequestFactory
from django.urls import reverse

from field_timeline.views import TimelineJSONView
from field_wagtail.tests.factories import (
    FieldTimelineEventFactory
)


class TimelineJSONViewTestCase(TestCase):
    test_slides = [
        {'unique_id': 'F001',
         'start_date': {'month': 1, 'day': 1, 'year': 1933,
                        'display_date': 1933},
         'text': {
             'text': 'The Milk Marketing Board (MMB) was a producer-led '
                     'organisation established in 1933-34',
             'headline': 'Milk Marketing Board established'
         },
         'end_date': {'day': 1, 'year': 1933, 'month': 12},
         'media': {
             'caption': 'Butter churn, Milk Marketing Board, '
                        'Newbury, Berkshire',
             'url':
                 'http://www.reading.ac.uk/adlib/Details/archive'
                 '/110025847'},
         'group': 'Production Practices', 'display_date': '1933'}
    ]
    test_json = {'events': [
        {'text': {
            'text': 'The Milk Marketing Board (MMB) was a producer-led '
                    'organisation established in 1933-34',
            'headline': 'Milk Marketing Board established'},
            'end_date': {'year': 1933, 'day': 1, 'month': 12},
            'start_date': {'year': 1933, 'day': 1,
                           'month': 1}, 'media': {
            'url': 'http://www.reading.ac.uk/adlib/Details/archive/110025847',
            'caption': 'Butter churn, Milk Marketing Board, Newbury, '
                       'Berkshire'},
            'group': 'Production Practices',
            'unique_id': 'F001'}
    ]}

    def setUp(self):
        self.factory = RequestFactory()
        self.event = FieldTimelineEventFactory(
            start_date_year=1933,
            unique_id='F001')

    def test_get_events(self):
        request = self.factory.get(reverse('timeline_json'))
        json_view = TimelineJSONView()
        events = json_view.get_events(request)
        self.assertEqual(events.count(), 1)

    def test_events_to_slides(self):
        request = self.factory.get(reverse('timeline_json'))
        json_view = TimelineJSONView()
        events = json_view.get_events(request)
        slides = json_view.events_to_slides(events)
        # json conversion tested in timeline event
        # so just make sure it's happening don't look in detail
        self.assertEqual(len(slides), 1)
        self.assertEqual(slides[0]['unique_id'], self.event.unique_id)

    def test_timelinejsonview(self):
        c = Client()
        response = c.get(reverse('timeline_json'))
        # 200 test
        self.assertEqual(response.status_code, 200)
        # test it's well formed json
        self.assertEqual(len(self.test_json), len(response.json()))
