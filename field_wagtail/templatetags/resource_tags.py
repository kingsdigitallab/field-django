from django import template
from field_wagtail.models import FieldDublinCoreResource
register = template.Library()


# Resource Items
@register.inclusion_tag('field_wagtail/tags/field_resources.html',
                        takes_context=True)
def field_resources(context):
    return {
        'field_resources': FieldDublinCoreResource.objects.all(),
        'request': context['request'],
    }
