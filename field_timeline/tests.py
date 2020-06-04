import json
import pdb

from django.test import TestCase

from field_timeline.management.commands.import_csv import create_category, \
    Command as ImportCsvCommand
from field_timeline.models import (TimelineSlide, FieldTimelineEvent,
                                   FieldTimelineResource, FieldTimelineCategory
                                   )

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


def createCategories():
    category, created = FieldTimelineCategory.objects.get_or_create(
        category_name='Production Practices'
    )
    return category


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
        category = createCategories()
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
            category=category,
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


class ImportCsvTestCase(TestCase):
    def setUp(self):
        pass

    def test_create_category(self):
        command = ImportCsvCommand()
        category = create_category(test_data_csvline[6])
        self.assertEqual(category.category_name, test_data_csvline[6])
        id = category.pk
        category = create_category(test_data_csvline[6])
        self.assertEqual(category.pk, id)

    def test_parse_csv_line(self):
        command = ImportCsvCommand()
        command.parse_csv_line(test_data_csvline)
        # Test an event was created
        self.assertEqual(command.events_created, 1)
        # Test it has the right id
        event = FieldTimelineEvent.objects.get(unique_id='F001')
        # and headline
        self.assertEqual(event.headline, 'Millk Marketing Board established')
        # and category
        self.assertEqual(event.category.category_name, 'Production Practices')
        # and resource attached
        self.assertEqual(event.resource.url,
                         'http://www.reading.ac.uk/adlib/Details/archive'
                         '/110025847'
                         )
