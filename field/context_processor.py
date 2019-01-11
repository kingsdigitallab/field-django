from django.conf import settings

SETTINGS_VARS_PASSED_TO_CONTEXT = [
    'PROJECT_TITLE',
    'GA_ID',
    'USE_BULMA',
]


def project_settings(request):

    # site = get_site_from_request(request, fallback_to_default=True)

    ret = {
        name: getattr(settings, name)
        for name
        in SETTINGS_VARS_PASSED_TO_CONTEXT
    }

    return ret
