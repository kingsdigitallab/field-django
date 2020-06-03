import json

from django.test import TestCase

from field_timeline.models import (TimelineSlide, FieldTimelineEvent,
                                   FieldTimelineResource)

# Test data
test_data_headline = 'Milk Marketing Board established'
test_data_text = 'The Milk Marketing Board (MMB) was a producer-led '
'organisation established in 1933-34 via the Agriculture '
'Marketing Act (1933). It brought stability and financial '
'security to dairy farmers by negotiating contracts with '
'milk purchasers on behalf of all 140,000 milk producers. '
'At a time of deep agricultural depression, when most '
'farming produce faced fierce competition from imports, '
'it contributed to a significant growth in UK dairy '
'farming.'


class TimelineSlideTestCase(TestCase):
    def setUp(self):
        TimelineSlide.objects.create(
            unique_id='F001',
            start_date_year=1933,
            start_date_month=1,
            start_date_day=1,
            end_date_year=1933,
            end_date_month=12,
            end_date_day=1,
            headline=test_data_headline,
            text=test_data_text
        )

    def test_serialise_start_date(self):
        slide = TimelineSlide.objects.get(unique_id='F001')
        test_date = {"year": 1933, 'month': 1, 'day': 1}
        self.assertEqual(slide.serialise_start_date(), test_date)

    def test_serialise_end_date(self):
        slide = TimelineSlide.objects.get(unique_id='F001')
        test_date = {"year": 1933, 'month': 12, 'day': 1}
        self.assertEqual(slide.serialise_end_date(), test_date)

    def test_serialise_text(self):
        slide = TimelineSlide.objects.get(unique_id='F001')
        test_text = {
            "headline": test_data_headline,
            "text": test_data_text
        }
        self.assertEqual(slide.serialise_text(), test_text)

    def test_get_timeline_data(self):
        slide = TimelineSlide.objects.get(unique_id='F001')
        test_data = {}
        test_data['start_date'] = {"year": 1933, 'month': 1, 'day': 1}
        test_data['end_date'] = {"year": 1933, 'month': 12, 'day': 1}
        test_data['text'] = {
            "headline": test_data_headline,
            "text": test_data_text
        }
        test_data['unique_id'] = 'F001'
        self.assertEqual(slide.get_timeline_data(), test_data)
        # test JSON conversion
        self.assertEqual(slide.to_timeline_json(),
                         json.dumps(test_data))


class FieldTimelineEventTestCase(TestCase):
    def setUp(self):
        FieldTimelineResource.objects.create(
            resource_id='R001',
            url='http://www.reading.ac.uk/adlib/Details/archive/110025847',
            caption='Butter churn, Milk Marketing Board, Newbury, Berkshire',
            photographer='Charles Topham'
        )
        r = FieldTimelineResource.objects.get(resource_id='R001')
        FieldTimelineEvent.objects.create(
            unique_id='F001',
            start_date_year=1933,
            start_date_month=1,
            start_date_day=1,
            end_date_year=1933,
            end_date_month=12,
            end_date_day=1,
            resource=r,
            headline=test_data_headline,
            text=test_data_text
        )

    def test_to_timeline_json(self):
        event = FieldTimelineEvent.objects.get(unique_id='F001')
        test_data = {}
        test_data['start_date'] = {"year": 1933, 'month': 1, 'day': 1}
        test_data['end_date'] = {"year": 1933, 'month': 12, 'day': 1}
        test_data['text'] = {
            "headline": test_data_headline,
            "text": test_data_text
        }
        test_data['media'] = {
            'url': 'http://www.reading.ac.uk/adlib/Details/archive/110025847',
            'caption': 'Butter churn, Milk Marketing Board, Newbury, '
                       'Berkshire',
        }
        test_data['unique_id'] = 'F001'
        self.assertEqual(event.to_timeline_json(), json.dumps(test_data))
