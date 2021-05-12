from django import template
from django_kdl_timeline.models import DublinCoreImage
register = template.Library()


# Resource Items
@register.inclusion_tag('field_wagtail/tags/field_resources.html',
                        takes_context=True)
def field_resources(context):
    return {
        'field_resources': DublinCoreImage.objects.all(),
        'request': context['request'],
    }
