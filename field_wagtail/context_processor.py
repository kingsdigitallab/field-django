from django.conf import settings
from field_wagtail.models import MailingListForm


def project_settings(request):

    ret = {
        name: getattr(settings, name)
        for name
        in settings.SETTINGS_VARS_IN_CONTEXT
    }

    return ret


def mailing_list_footer(request):

    ret = {
        'mailing_list_footer': MailingListForm()
    }

    return ret
