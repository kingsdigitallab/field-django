from .base import *  # noqa

ALLOWED_HOSTS = ['127.0.0.1',
                 'localhost'
                 '[::1]',
                 'field-dev.kdl.kcl.ac.uk']

# CACHE_REDIS_DATABASE = '2'
# CACHES['default']['LOCATION'] = '127.0.0.1:6379:' + CACHE_REDIS_DATABASE

DEBUG = True

INTERNAL_IPS = INTERNAL_IPS + ['']

DATABASES = {
    'default': {
        'ENGINE': db_engine,
        'NAME': 'app_field_dev',
        'USER': 'app_field',
        'PASSWORD': '',
        'HOST': ''
    },
}

LOGGING_LEVEL = logging.DEBUG

LOGGING['loggers']['field'] = {}
LOGGING['loggers']['field']['handlers'] = ['console']
LOGGING['loggers']['field']['level'] = logging.DEBUG

MEDIA_URL = 'media/'
MEDIA_ROOT = os.path.join(BASE_DIR, MEDIA_URL.strip('/'))


SECRET_KEY = ''

# -----------------------------------------------------------------------------
# Django Debug Toolbar
# http://django-debug-toolbar.readthedocs.org/en/latest/
# -----------------------------------------------------------------------------

try:
    import debug_toolbar  # noqa

    INSTALLED_APPS = INSTALLED_APPS + ['debug_toolbar', ]
    MIDDLEWARE += [
        'debug_toolbar.middleware.DebugToolbarMiddleware']
    DEBUG_TOOLBAR_PATCH_SETTINGS = True
except ImportError:
    pass


# -----------------------------------------------------------------------------
# Local settings
# -----------------------------------------------------------------------------

try:
    from .local import *  # noqa
except ImportError:
    print('failed to import local settings')

    from test import *  # noqa
    print('the project is running with test settings')
    print('please create a local settings file')
