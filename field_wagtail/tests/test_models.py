import PIL
from django.core.files import File
from django.core.files.images import ImageFile
from django.core.files.storage import default_storage
from django.test import TestCase
from wagtail.images.models import Image

from field_wagtail.models import (
    FieldTimelineEvent,
    FieldTimelineResource,
    FieldTimelineResourceImage
)
from field_wagtail.tests.factories import (
    FieldTimelineEventFactory,
    FieldTimelineResourceFactory,
    DublinCoreAgentFactory
)


def create_wagtail_test_image(uri, filename) -> Image:
    # Create fake resource image to be uploaded
    test_image = PIL.Image.new('RGB', size=(50, 50))
    if default_storage.exists(uri) is False:
        test_image.save(uri, 'JPEG')
        # Add attached resource (currently only images)
        try:
            with open(uri, 'rb') as f:
                image = Image(
                    title=filename,
                    file=ImageFile(File(f), name=filename + '.jpg')
                )
                image.save()
                return image
        except FileNotFoundError:
            return None


def delete_wagtail_test_image(uri) -> None:
    # Delete fake image
    if default_storage.exists(uri):
        default_storage.delete(uri)


class FieldTimelineResourceTestCase(TestCase):
    test_image_filename = 'test_image'
    uri = (default_storage.location
           + '/images/' + test_image_filename + '.jpg')
    orig_uri = (default_storage.location
                + '/original_images/' + test_image_filename + '.jpg')

    @classmethod
    def setUpClass(cls):
        create_wagtail_test_image(
            uri=cls.uri, filename=cls.test_image_filename
        )

    @classmethod
    def tearDownClass(cls) -> None:
        delete_wagtail_test_image(cls.uri)
        delete_wagtail_test_image(cls.orig_uri)

    def setUp(self) -> None:
        FieldTimelineResourceFactory(identifier='R001')
        self.resource = FieldTimelineResource.objects.get(identifier='R001')
        image = Image.objects.get(
            title=self.test_image_filename
        )
        FieldTimelineResourceImage.objects.get_or_create(
            resource=self.resource,
            image=image
        )

    def test_to_timeline_media(self):
        # import pdb
        # pdb.set_trace()
        media_data = self.resource.to_timeline_media()
        # make sure urls are correct
        self.assertEqual(
            self.resource.attached_media.rendition_url, media_data['url']
        )
        self.assertEqual(
            self.resource.attached_media.thumbnail_url, media_data['thumbnail']
        )
        self.assertEqual(
            media_data['link'], self.resource.link_url
        )
        photographer = DublinCoreAgentFactory()
        self.resource.creators.add(photographer)
        media_data = self.resource.to_timeline_media()
        self.assertEqual(
            media_data['credit'], photographer.full_name
        )
        self.resource.credit = 'FIELD Team'
        self.resource.save()
        media_data = self.resource.to_timeline_media()
        self.assertEqual(
            media_data['credit'], "{} / {}".format(
                photographer.full_name,
                self.resource.credit
            )
        )

    def test__str__(self):
        self.assertEqual(
            self.resource.__str__(),
            "{}:{}, {}".format(
                self.resource.identifier,
                self.resource.caption,
                self.resource.link_url
            )
        )


class FieldTimelineEventTestCase(TestCase):
    test_json = '{"display_date": "1933", "group": "Production Practices", ' \
                '"unique_id": "F001", "start_date": {"display_date": 1933, ' \
                '"month": 1, "day": 1, "year": 1933}, "media": {"url": ' \
                '"http://www.reading.ac.uk/adlib/Details/archive/110025847", '\
                '' \
                '' \
                '' \
                '"caption": "Butter churn, Milk Marketing Board, Newbury, ' \
                'Berkshire"}, "text": {"text": "The Milk Marketing Board (' \
                'MMB) was a producer-led organisation established in 1933-34 '\
                '' \
                '' \
                '' \
                'via the Agriculture Marketing Act (1933). It brought ' \
                'stability and financial security to dairy farmers by ' \
                'negotiating contracts with milk purchasers on behalf of all '\
                '' \
                '' \
                '' \
                '140,000 milk producers. At a time of deep agricultural ' \
                'depression, when most farming produce faced fierce ' \
                'competition from imports, it contributed to a significant ' \
                'growth in UK dairy farming.", "headline": "Milk Marketing ' \
                'Board established"}, "end_date": {"month": 12, "day": 1, ' \
                '"year": 1933}}'

    def setUp(self):
        FieldTimelineEventFactory(unique_id='F001')

    def test_to_timeline_json(self):
        FieldTimelineEvent.objects.get(unique_id='F001')
        pass
        # event.to_timeline_json()
