from .base import *  # noqa

ALLOWED_HOSTS = ['field.kdl.kcl.ac.uk']

INTERNAL_IPS = INTERNAL_IPS + ['']

DATABASES = {
    'default': {
        'ENGINE': db_engine,
        'NAME': 'app_field_liv',
        'USER': 'app_field',
        'PASSWORD': '',
        'HOST': ''
    },
}

SECRET_KEY = ''
