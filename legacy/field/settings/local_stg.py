from .base import *  # noqa

MEDIA_URL = '/media/'
MEDIA_ROOT = os.path.join(BASE_DIR, MEDIA_URL.strip('/'))


ALLOWED_HOSTS = ['field-stg.kdl.kcl.ac.uk']

CACHE_REDIS_DATABASE = '1'
CACHES['default']['LOCATION'] = '127.0.0.1:6379:' + CACHE_REDIS_DATABASE

INTERNAL_IPS = INTERNAL_IPS + ['']
ALLOWED_HOSTS = ['']

DATABASES = {
    'default': {
        'ENGINE': db_engine,
        'NAME': 'app_field_stg',
        'USER': 'app_field',
        'PASSWORD': '',
        'HOST': ''
    },
}

SECRET_KEY = ''
