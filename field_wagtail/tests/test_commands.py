import csv
from io import StringIO

import PIL
from django.core.files.storage import default_storage
from django.test import TestCase
from dublincore_resource.models import (
    DublinCoreRights,
    DublinCoreAgent
)

from field_wagtail.management.commands.import_timeline import (
    create_category,
    Command as ImportTimelineCommand
)
from field_wagtail.models import (
    FieldTimelineResource,
    FieldTimelineEvent,
    FieldTimelineResourceImage,
    FieldOralHistory
)

test_data_csvline = [
    'KS', 'F001', 'FALSE', 'Formula', '001', '1933',
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
    'Farmer', 'Scottish Borders', 'pre-1939', 'My father drove sheep...',
    'Rights: Newcastle University',
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
    '', 'F002; F003'
]

test_linkee_data_csvline = [
    'KS', 'F002', 'FALSE', 'Formula', '001', '1933',
    'Link event',
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
    '', 'F001'
]

test_linkee_data_csvline2 = [
    'KS', 'F003', 'FALSE', 'Formula', '001', '1933',
    'Link event 2',
    '',
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
    '', ''
]


class TestImportTimelineCommand(TestCase):
    test_image_filename = 'test_image'
    uri = (default_storage.location
           + '/images/' + test_image_filename + '.jpg')

    rights_csv = StringIO(
        "MERLCC,Copyright to this resource is owned"
        "by the Museum of English Rural Life\n"
        "BAD_DATA"
    )

    test_resource_line = [
        "R001",
        test_image_filename, "P FW PH1/OS/2/14",
        "Butter churn, Milk Marketing Board, Newbury, Berkshire. The Museum "
        "of "
        "English Rural Life, University of Reading.",
        "1940~", "Charles Topham", '', '', "MERLCC", '', '', '', '', '', '',
        "http://www.reading.ac.uk/adlib/Details/archive/110025847"

    ]

    @classmethod
    def setUpClass(cls):
        # Create fake resource image to be uploaded
        test_image = PIL.Image.new('RGB', size=(50, 50))
        if default_storage.exists(cls.uri) is False:
            test_image.save(cls.uri, 'JPEG')

    def test_create_category(self) -> None:
        category = create_category(test_data_csvline[6])
        self.assertEqual(category.category_name, test_data_csvline[6])
        id = category.pk
        create_category(test_data_csvline[6])
        self.assertEqual(category.pk, id)

    def test_import_rights(self) -> None:
        ImportTimelineCommand.import_rights(
            csv.reader(self.rights_csv, delimiter=',')
        )
        self.assertEqual(DublinCoreRights.objects.all().count(), 1)

    def test_parse_resource_csv_line(self) -> None:
        command = ImportTimelineCommand()
        command.parse_resource_csv_line(self.test_resource_line)
        # We should have: one resource, a creator, a rights object
        # and an image
        self.assertEqual(FieldTimelineResource.objects.all().count(), 1)
        self.assertEqual(DublinCoreRights.objects.all().count(), 1)
        self.assertEqual(DublinCoreAgent.objects.all().count(), 1)
        self.assertEqual(FieldTimelineResourceImage.objects.all().count(), 1)

    def test_parse_event_csv_line(self):
        command = ImportTimelineCommand()
        # create resources to be attached
        command.parse_resource_csv_line(self.test_resource_line)
        create_category(test_data_csvline[6])
        command.parse_event_csv_line(test_data_csvline)
        # Test an event was created
        self.assertEqual(command.events_created, 1)
        # Test it has the right id
        event = FieldTimelineEvent.objects.get(unique_id='F001')
        # and headline
        self.assertEqual(
            event.headline, 'Millk Marketing Board established'
        )
        # and category
        self.assertEqual(
            event.category.category_name, 'Production Practices'
        )
        # and resource attached
        self.assertEqual(
            event.resource.identifier, 'R001'
        )
        self.assertEqual(FieldOralHistory.objects.all().count(), 1)
        self.assertEqual(FieldOralHistory.objects.filter(
            timeline_event=event).count(), 1)

    def test_link_events(self):
        out = StringIO()
        command = ImportTimelineCommand(stdout=out)
        # create resources to be attached
        command.parse_resource_csv_line(self.test_resource_line)
        create_category(test_data_csvline[6])
        command.parse_event_csv_line(test_data_csvline)
        command.parse_event_csv_line(test_linkee_data_csvline)
        command.parse_event_csv_line(test_linkee_data_csvline2)
        command.link_events()
        f001 = FieldTimelineEvent.objects.get(unique_id='F001')
        f002 = FieldTimelineEvent.objects.get(unique_id='F002')
        f003 = FieldTimelineEvent.objects.get(unique_id='F003')
        # is F001 linked to F002, F003?
        self.assertEqual(f001.linked_events.count(), 2)
        self.assertTrue(f002 in f001.linked_events.all())
        self.assertTrue(f003 in f001.linked_events.all())
        # is F002 linked to F001?
        self.assertTrue(f001 in f002.linked_events.all())

    @classmethod
    def tearDownClass(cls):
        # Delete fake image
        if default_storage.exists(cls.uri):
            default_storage.delete(cls.uri)
