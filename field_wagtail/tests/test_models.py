import json

import PIL
from django.conf import settings
from django.core.files import File
from django.core.files.images import ImageFile
from django.core.files.storage import default_storage
from django.test import TestCase
from wagtail.images.models import Image
from wagtail.tests.utils import WagtailPageTests

from field_wagtail.models import (
    FieldTimelineResource,
    FieldTimelineResourceImage,
    # MailingListFormPage
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
                if Image.objects.filter(title=filename).count() > 0:
                    image = Image.objects.get(title=filename)
                else:
                    image = Image(
                        title=filename,
                        file=ImageFile(File(f), name=filename + '.jpg')
                    )
                    image.save()
                image.get_rendition(FieldTimelineResourceImage.image_rendition)
                image.get_rendition(FieldTimelineResourceImage.thumb_rendition)
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
        resource = FieldTimelineResource.objects.get(identifier='R001')

        image = Image.objects.get(
            title=self.test_image_filename
        )
        FieldTimelineResourceImage.objects.get_or_create(
            resource=resource,
            image=image
        )
        self.resource = resource

    def tearDown(self) -> None:
        image = Image.objects.get(
            title=self.test_image_filename
        )
        image.delete()
        self.resource.delete()

    def test_to_timeline_media(self):
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
        # Delete the renditions to clean up
        delete_wagtail_test_image(
            settings.BASE_DIR + '/'
            + self.resource.attached_media.image.get_rendition(
                FieldTimelineResourceImage.image_rendition).url)
        delete_wagtail_test_image(
            settings.BASE_DIR
            + '/' + self.resource.attached_media.image.get_rendition(
                FieldTimelineResourceImage.thumb_rendition).url)

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
        Image.objects.all().delete()

    def setUp(self):
        resource = FieldTimelineResourceFactory(identifier='R001')
        image = Image.objects.get(
            title=self.test_image_filename
        )
        FieldTimelineResourceImage.objects.get_or_create(
            resource=resource,
            image=image
        )
        self.event = FieldTimelineEventFactory(
            start_date_year=1933,
            resource=resource,
            unique_id='F001')

    def tearDown(self) -> None:
        image = Image.objects.get(
            title=self.test_image_filename
        )
        image.delete()
        FieldTimelineResource.objects.all().delete()
        self.event.delete()

    def test_get_timeline_data(self):
        data = self.event.get_timeline_data()
        self.assertEqual(
            self.event.start_date_year, data['start_date']['year'])
        self.assertEqual(
            data['group'], self.event.category.category_name
        )
        self.assertEqual(
            data['media']['url'],
            self.event.resource.attached_media.rendition_url
        )

    def test_to_timeline_json(self):
        data = json.loads(self.event.to_timeline_json())
        self.assertEqual(
            self.event.start_date_year, data['start_date']['year'])
        self.assertEqual(
            data['group'], self.event.category.category_name
        )


class TestHomePage(WagtailPageTests):
    pass
    #
    # def setUp(self) -> None:
    #     self.home_page, created = HomePage.objects.get_or_create(
    #         id=2,
    #         title='title'
    #     )
    #
    #
    # def test_home_page_render(self) -> None:
    #     response = self.client.get(self.home_page.url)
    #     self.assertEqual(response.status_code, 200)
