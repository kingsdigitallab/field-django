import pdb

from django.conf import settings
from django.core.files import File
from django.core.files.images import ImageFile
from wagtail.images.models import Image

from field_wagtail.models import (
    FieldTimelineResource, FieldTimelineResourceImage
)

pdb.set_trace()
FieldTimelineResourceImage.objects.all().delete()

for resource in FieldTimelineResource.objects.all():
    with open(
            settings.MEDIA_ROOT
            + settings.TIMELINE_IMAGE_FOLDER
            + '/' + resource.filename + '.'
            + settings.TIMELINE_IMAGE_FORMAT,
            'rb'
    ) as f:
        if Image.objects.filter(title=resource.title).count() > 0:
            image = Image.objects.get(title=resource.title)
        else:
            image = Image(
                title=resource.title,
                file=ImageFile(File(f), name=resource.filename)
            )
            image.save()
        if image and resource:
            ri = FieldTimelineResourceImage(
                resource=resource,
                image=image
            )
            ri.save()
