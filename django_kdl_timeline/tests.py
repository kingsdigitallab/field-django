from django.test import TestCase
from .models import (TimelineSlide)
import json


# Test data
test_data_headline = 'Milk Marketing Board established'
test_data_text = 'The Milk Marketing Board (MMB) was a producer-led ' \
                 'organisation established in 1933-34 via the Agriculture ' \
                 'Marketing Act (1933). It brought stability and financial ' \
                 'security to dairy farmers by negotiating contracts with ' \
                 'milk purchasers on behalf of all 140,000 milk producers. ' \
                 'At a time of deep agricultural depression, when most ' \
                 'farming produce faced fierce competition from imports, ' \
                 'it contributed to a significant growth in UK dairy ' \
                 'farming.'
test_data_csvline = ['KS', 'F001', 'FALSE', 'Formula', '001', '1933',
                     'Millk Marketing Board established',
                     'The Milk Marketing Board (MMB) was a producer-led '
                     'organisation established in 1933-34 via the '
                     'Agriculture Marketing Act (1933). It brought stability '
                     'and financial security to dairy farmers by negotiating '
                     'contracts with milk purchasers on behalf of all 140,'
                     '000 milk producers. At a time of deep agricultural '
                     'depression, when most farming produce faced fierce '
                     'competition from imports, it contributed to a '
                     'significant growth in UK dairy farming.  ',
                     '66', 'Production Practices', '2', 'R001',
                     'P FW PH1/OS/2/14',
                     'Butter churn, Milk Marketing Board, Newbury, Berkshire',
                     'Charles Topham',
                     'The Museum of English Rural Life, University of '
                     'Reading.',
                     'http://www.reading.ac.uk/adlib/Details/archive'
                     '/110025847',
                     '', '', '', '', '',
                     'Anderson, P.D., ‘The English Milk Marketing Board—Its '
                     'origins and functions: Part I’, Agricultural '
                     'Administration 5:1 (1978): 59-71. '
                     'https://doi.org/10.1016/0309-586X(78)90018-3; McQUEEN, '
                     'D. (1998), The Milk Marketing Boards in Scotland and '
                     'their legacy. International Journal of Dairy '
                     'Technology, 51: 113-119. '
                     'doi:10.1111/j.1471-0307.1998.tb02514.x; '
                     'https://api.parliament.uk/historic-hansard/acts'
                     '/agricultural-marketing-act-1933',
                     '', '']


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
        test_date = {'display_date': 1933, 'year': 1933, 'month': 1, 'day': 1}
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
        test_data['start_date'] = {"year": 1933, 'month': 1, 'day': 1,
                                   'display_date': 1933}
        test_data['display_date'] = "1933"
        test_data['end_date'] = {"year": 1933, 'month': 12, 'day': 1}
        test_data['text'] = {
            "headline": test_data_headline,
            "text": test_data_text
        }
        test_data['unique_id'] = 'F001'
        self.assertEqual(slide.get_timeline_data(), test_data)
        # test JSON conversion
        self.assertEqual(len(slide.to_timeline_json()),
                         len(json.dumps(test_data)))
