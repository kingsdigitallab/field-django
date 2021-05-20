"""

Copy existing images to new field wagtail image model

should only need to be run once

"""

from django.core.management.base import BaseCommand
from wagtail.images.models import Image

from field_wagtail.models import FieldImage


def copy_images():
    """ Copy existing wagtail image records into new image model"""

    images = Image.objects.all()
    new_images = []
    print("Copying images\n")
    for image in images:
        new_images.append(FieldImage(
            id=image.id,
            title=image.title,
            file=image.file,
            width=image.width,
            height=image.height,
            created_at=image.created_at,
            focal_point_x=image.focal_point_x,
            focal_point_y=image.focal_point_y,
            focal_point_width=image.focal_point_width,
            focal_point_height=image.focal_point_height,
            file_size=image.file_size,
            collection=image.collection,
            uploaded_by_user=image.uploaded_by_user,
            alt_text=''
        ))
    print("Copying {} images to FieldImage\n".format(len(new_images)))
    FieldImage.objects.bulk_create(new_images)


class Command(BaseCommand):
    help = 'Import FIELD timeline events from csv'

    def handle(self, *args, **options):
        print("Deleting old Field image objects...\n")
        FieldImage.objects.all().delete()
        copy_images()
