from django.conf import settings


def project_settings(request):

    # site = get_site_from_request(request, fallback_to_default=True)

    ret = {
        name: getattr(settings, name)
        for name
        in settings.SETTINGS_VARS_IN_CONTEXT
    }

    return ret
