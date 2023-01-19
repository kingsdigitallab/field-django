"""
Base settings to build other settings files upon.
"""
import os
from pathlib import Path

import environ

ROOT_DIR = Path(__file__).resolve(strict=True).parent.parent.parent
# field/
APPS_DIR = ROOT_DIR / "field"
env = environ.Env()

READ_DOT_ENV_FILE = env.bool("DJANGO_READ_DOT_ENV_FILE", default=False)
if READ_DOT_ENV_FILE:
    # OS environment variables take precedence over variables from .env
    env.read_env(str(ROOT_DIR / ".env"))

# GENERAL
# ------------------------------------------------------------------------------
# https://docs.djangoproject.com/en/dev/ref/settings/#debug
DEBUG = env.bool("DJANGO_DEBUG", False)
# Local time zone. Choices are
# http://en.wikipedia.org/wiki/List_of_tz_zones_by_name
# though not all of them may be available with every OS.
# In Windows, this must be set to your system time zone.
TIME_ZONE = "UTC"
# https://docs.djangoproject.com/en/dev/ref/settings/#language-code
LANGUAGE_CODE = "en-gb"
# https://docs.djangoproject.com/en/dev/ref/settings/#site-id
SITE_ID = 1
# https://docs.djangoproject.com/en/dev/ref/settings/#use-i18n
USE_I18N = True
# https://docs.djangoproject.com/en/dev/ref/settings/#use-l10n
USE_L10N = True
# https://docs.djangoproject.com/en/dev/ref/settings/#use-tz
USE_TZ = True
# https://docs.djangoproject.com/en/dev/ref/settings/#locale-paths
LOCALE_PATHS = [str(ROOT_DIR / "locale")]

# DATABASES
# ------------------------------------------------------------------------------
# https://docs.djangoproject.com/en/dev/ref/settings/#databases
DATABASES = {"default": env.db("DATABASE_URL")}
DATABASES["default"]["ATOMIC_REQUESTS"] = True

# URLS
# ------------------------------------------------------------------------------
# https://docs.djangoproject.com/en/dev/ref/settings/#root-urlconf
ROOT_URLCONF = "config.urls"
# https://docs.djangoproject.com/en/dev/ref/settings/#wsgi-application
WSGI_APPLICATION = "config.wsgi.application"

# APPS
# ------------------------------------------------------------------------------
DJANGO_APPS = [
    "django.contrib.auth",
    "django.contrib.contenttypes",
    "django.contrib.sessions",
    "django.contrib.sites",
    "django.contrib.messages",
    "django.contrib.staticfiles",
    # "django.contrib.humanize", # Handy template tags
    "django.contrib.admin",
    "django.forms",
    # 'django_extensions', # legacy
]
THIRD_PARTY_APPS = [
    "crispy_forms",
    "allauth",
    "allauth.account",
    "allauth.socialaccount",


    "django_elasticsearch_dsl",

    # wagtail
    "wagtail.contrib.forms",
    "wagtail.contrib.redirects",
    "wagtail.contrib.settings",
    "wagtail.embeds",
    "wagtail.sites",
    "wagtail.users",
    "wagtail.snippets",
    "wagtail.documents",
    "wagtail.images",
    "wagtail.admin",
    "wagtail.core",
    'wagtail.search',  # legacy
    'wagtail.contrib.modeladmin',  # legacy
    "wagtail.contrib.sitemaps",  # puput
    'wagtail.contrib.routable_page',  # legacy
    'wagtail.contrib.table_block',  # legacy
    "modelcluster",

    "django_social_share",  # for puput
    "django_comments",  # for puput
    "taggit",  # for puput
    'puput',  # legacy
    'colorful',  # for puput
    'wagtailmenus',  # legacy
    'captcha',  # legacy, what for?
    # KDL
    'kdl_wagtail_page',  # legacy, still used?
    'controlled_vocabulary',
    'dublincore_resource',
    "kdl_wagtail.core",
    'kdl_wagtail.people',
    'django_kdl_timeline',
    'rest_framework',
    'rest_framework.authtoken'
]

LOCAL_APPS = [
    # "field.users.apps.UsersConfig", # ?
    'field_timeline',
    'field_wagtail',
    'field_game.apps.FieldGameConfig'
]
# https://docs.djangoproject.com/en/dev/ref/settings/#installed-apps
INSTALLED_APPS = DJANGO_APPS + THIRD_PARTY_APPS + LOCAL_APPS

# MIGRATIONS
# ------------------------------------------------------------------------------
# https://docs.djangoproject.com/en/dev/ref/settings/#migration-modules
MIGRATION_MODULES = {"sites": "field.contrib.sites.migrations"}

# AUTHENTICATION
# ------------------------------------------------------------------------------
# https://docs.djangoproject.com/en/dev/ref/settings/#authentication-backends
AUTHENTICATION_BACKENDS = [
    "django.contrib.auth.backends.ModelBackend",
    "allauth.account.auth_backends.AuthenticationBackend",
]

if 0:
    # https://docs.djangoproject.com/en/dev/ref/settings/#auth-user-model
    AUTH_USER_MODEL = "users.User"
    # https://docs.djangoproject.com/en/dev/ref/settings/#login-redirect-url
    LOGIN_REDIRECT_URL = "users:redirect"
    # https://docs.djangoproject.com/en/dev/ref/settings/#login-url
    LOGIN_URL = "account_login"

LOGIN_URL = '/wagtail/login/'

# PASSWORDS
# ------------------------------------------------------------------------------
# https://docs.djangoproject.com/en/dev/ref/settings/#password-hashers
PASSWORD_HASHERS = [
    # https://docs.djangoproject.com/en/dev/topics/auth/passwords/#using
    # -argon2-with-django
    "django.contrib.auth.hashers.Argon2PasswordHasher",
    "django.contrib.auth.hashers.PBKDF2PasswordHasher",
    "django.contrib.auth.hashers.PBKDF2SHA1PasswordHasher",
    "django.contrib.auth.hashers.BCryptSHA256PasswordHasher",
]
# https://docs.djangoproject.com/en/dev/ref/settings/#auth-password-validators
AUTH_PASSWORD_VALIDATORS = [
    {
        "NAME": "django.contrib.auth.password_validation"
                ".UserAttributeSimilarityValidator"
    },
    {"NAME": "django.contrib.auth.password_validation.MinimumLengthValidator"},
    {
        "NAME": "django.contrib.auth.password_validation"
                ".CommonPasswordValidator"},
    {
        "NAME": "django.contrib.auth.password_validation"
                ".NumericPasswordValidator"},
]

# MIDDLEWARE
# ------------------------------------------------------------------------------
# https://docs.djangoproject.com/en/dev/ref/settings/#middleware
MIDDLEWARE = [
    "django.middleware.security.SecurityMiddleware",
    "whitenoise.middleware.WhiteNoiseMiddleware",
    "django.contrib.sessions.middleware.SessionMiddleware",
    "django.middleware.locale.LocaleMiddleware",
    "django.middleware.common.CommonMiddleware",
    "django.middleware.csrf.CsrfViewMiddleware",
    "django.contrib.auth.middleware.AuthenticationMiddleware",
    "django.contrib.messages.middleware.MessageMiddleware",
    "django.middleware.common.BrokenLinkEmailsMiddleware",
    "django.middleware.clickjacking.XFrameOptionsMiddleware",
    "wagtail.contrib.redirects.middleware.RedirectMiddleware",

]

# STATIC
# ------------------------------------------------------------------------------
# https://docs.djangoproject.com/en/dev/ref/settings/#static-root
STATIC_ROOT = str(ROOT_DIR / "staticfiles")
# https://docs.djangoproject.com/en/dev/ref/settings/#static-url
STATIC_URL = "/static/"
# https://docs.djangoproject.com/en/dev/ref/contrib/staticfiles/#std:setting
# -STATICFILES_DIRS
STATICFILES_DIRS = [
    str(ROOT_DIR / "assets"),
    str(APPS_DIR / "static"),
    str(ROOT_DIR / "node_modules"),
]
# https://docs.djangoproject.com/en/dev/ref/contrib/staticfiles/#staticfiles
# -finders
STATICFILES_FINDERS = [
    "django.contrib.staticfiles.finders.FileSystemFinder",
    "django.contrib.staticfiles.finders.AppDirectoriesFinder",
]

# MEDIA
# ------------------------------------------------------------------------------
# https://docs.djangoproject.com/en/dev/ref/settings/#media-root
MEDIA_ROOT = str(APPS_DIR / "media")
# https://docs.djangoproject.com/en/dev/ref/settings/#media-url
MEDIA_URL = "/media/"

if not os.path.exists(MEDIA_ROOT):
    os.makedirs(MEDIA_ROOT)

# TEMPLATES
# ------------------------------------------------------------------------------
# https://docs.djangoproject.com/en/dev/ref/settings/#templates
TEMPLATES = [
    {
        # https://docs.djangoproject.com/en/dev/ref/settings/#std:setting
        # -TEMPLATES-BACKEND
        "BACKEND": "django.template.backends.django.DjangoTemplates",
        # https://docs.djangoproject.com/en/dev/ref/settings/#template-dirs
        "DIRS": [str(ROOT_DIR / "templates"), str(APPS_DIR / "templates")],
        "OPTIONS": {
            # https://docs.djangoproject.com/en/dev/ref/settings/#template
            # -loaders
            # https://docs.djangoproject.com/en/dev/ref/templates/api
            # /#loader-types
            "loaders": [
                "django.template.loaders.filesystem.Loader",
                "django.template.loaders.app_directories.Loader",
            ],
            # https://docs.djangoproject.com/en/dev/ref/settings/#template
            # -context-processors
            "context_processors": [
                "django.template.context_processors.debug",
                "django.template.context_processors.request",
                "django.contrib.auth.context_processors.auth",
                "django.template.context_processors.i18n",
                "django.template.context_processors.media",
                "django.template.context_processors.static",
                "django.template.context_processors.tz",
                "django.contrib.messages.context_processors.messages",
                "field.utils.context_processors.settings_context",
                'field_wagtail.context_processor.project_settings',
                'field_wagtail.context_processor.mailing_list_footer',
            ],
        },
    }
]

# https://docs.djangoproject.com/en/dev/ref/settings/#form-renderer
FORM_RENDERER = "django.forms.renderers.TemplatesSetting"

# http://django-crispy-forms.readthedocs.io/en/latest/install.html#template
# -packs
CRISPY_TEMPLATE_PACK = "bootstrap4"

# FIXTURES
# ------------------------------------------------------------------------------
# https://docs.djangoproject.com/en/dev/ref/settings/#fixture-dirs
FIXTURE_DIRS = (str(APPS_DIR / "fixtures"),)

# SECURITY
# ------------------------------------------------------------------------------
# https://docs.djangoproject.com/en/dev/ref/settings/#session-cookie-httponly
SESSION_COOKIE_HTTPONLY = True
# https://docs.djangoproject.com/en/dev/ref/settings/#csrf-cookie-httponly
CSRF_COOKIE_HTTPONLY = True
# https://docs.djangoproject.com/en/dev/ref/settings/#secure-browser-xss-filter
SECURE_BROWSER_XSS_FILTER = True
# https://docs.djangoproject.com/en/dev/ref/settings/#x-frame-options
X_FRAME_OPTIONS = "DENY"

# EMAIL
# ------------------------------------------------------------------------------
# https://docs.djangoproject.com/en/dev/ref/settings/#email-backend
EMAIL_BACKEND = env(
    "DJANGO_EMAIL_BACKEND",
    default="django.core.mail.backends.smtp.EmailBackend"
)
# https://docs.djangoproject.com/en/dev/ref/settings/#email-timeout
EMAIL_TIMEOUT = 5

# ADMIN
# ------------------------------------------------------------------------------
# Django Admin URL.
ADMIN_URL = "admin/"
# https://docs.djangoproject.com/en/dev/ref/settings/#admins
# ADMINS = [("""King's Digital Lab""", "kdl-info@kcl.ac.uk")]
ADMINS = [("Geoffroy", "geoffroy.noel@kcl.ac.uk")]
# https://docs.djangoproject.com/en/dev/ref/settings/#managers
MANAGERS = ADMINS

# LOGGING
# ------------------------------------------------------------------------------
# https://docs.djangoproject.com/en/dev/ref/settings/#logging
# See https://docs.djangoproject.com/en/dev/topics/logging for
# more details on how to customize your logging configuration.
LOGGING = {
    "version": 1,
    "disable_existing_loggers": False,
    "formatters": {
        "verbose": {
            "format": "%(levelname)s %(asctime)s %(module)s "
                      "%(process)d %(thread)d %(message)s"
        }
    },
    "handlers": {
        "console": {
            "level": "DEBUG",
            "class": "logging.StreamHandler",
            "formatter": "verbose",
        }
    },
    "root": {"level": "INFO", "handlers": ["console"]},
}

# django-allauth
# ------------------------------------------------------------------------------
ACCOUNT_ALLOW_REGISTRATION = env.bool("DJANGO_ACCOUNT_ALLOW_REGISTRATION",
                                      True)
# https://django-allauth.readthedocs.io/en/latest/configuration.html
ACCOUNT_AUTHENTICATION_METHOD = "username"
# https://django-allauth.readthedocs.io/en/latest/configuration.html
ACCOUNT_EMAIL_REQUIRED = True
# https://django-allauth.readthedocs.io/en/latest/configuration.html
ACCOUNT_EMAIL_VERIFICATION = "mandatory"
# https://django-allauth.readthedocs.io/en/latest/configuration.html
ACCOUNT_ADAPTER = "field.users.adapters.AccountAdapter"
# https://django-allauth.readthedocs.io/en/latest/configuration.html
SOCIALACCOUNT_ADAPTER = "field.users.adapters.SocialAccountAdapter"
# django-compressor
# ------------------------------------------------------------------------------
# https://django-compressor.readthedocs.io/en/latest/quickstart/#installation
INSTALLED_APPS += ["compressor"]
STATICFILES_FINDERS += ["compressor.finders.CompressorFinder"]

COMPRESS_CSS_FILTERS = [
    # CSS minimizer
    'compressor.filters.cssmin.CSSMinFilter'
]

COMPRESS_PRECOMPILERS = (
    ('text/x-scss', 'django_libsass.SassCompiler'),
)

# Elasticsearch
# ------------------------------------------------------------------------------
# https://github.com/django-es/django-elasticsearch-dsl
ELASTICSEARCH_DSL = {"default": {"hosts": "elasticsearch:9200"}}

# Wagtail
# ------------------------------------------------------------------------------
# https://docs.wagtail.io/en/v2.7.1/getting_started/integrating_into_django
# .html
WAGTAIL_SITE_NAME = "FIELD"
PROJECT_TITLE = 'FIELD'

# PUPUT
# ------------------------------------------------------------------------------
PUPUT_AS_PLUGIN = True

# https://github.com/APSL/puput/issues/222
PUPUT_COMMENTS_PROVIDER = 'puput.comments.DjangoCommentsCommentsProvider'

# Your stuff...
# ------------------------------------------------------------------------------

USE_BULMA = True

# 1: root, 2: site home page, 3: top level page
# default is 3, we change to 2 because our default main menu
# is just the home page, nothing else.
WAGTAILMENUS_SECTION_ROOT_DEPTH = 2

# Note that KCL was (still is?) the research grant recipient.
# Please make sure logo removal is agreed first with Wellcome & KCL.
HIDE_KCL_LOGO = True

# those settings vars will be available in template contexts
SETTINGS_VARS_IN_CONTEXT = [
    'PROJECT_TITLE',
    'GA_ID',
    'USE_BULMA',
    'MAILING_LIST_FORM_WEB_PATH',
    'HIDE_KCL_LOGO',
]

# slug of the page which is the parent of the specific communities
FIELD_COMMUNITIES_ROOT_SLUG = 'groups'

if 1:
    FABRIC_DEV_PACKAGES = [
        {
            'git': 'https://github.com/kingsdigitallab/django-kdl-wagtail.git',
            'folder_git': 'django-kdl-wagtail',
            'folder_package': 'kdl_wagtail',
            'branch': 'develop',
            'servers': ['lcl', 'dev', 'stg', 'liv'],
        }
    ]

KDL_WAGTAIL_HIDDEN_PAGE_TYPES = [
    ('kdl_wagtail_page.richpage'),
    ('kdl_wagtail_core.streampage'),
    ('kdl_wagtail_core.indexpage'),
    ('kdl_wagtail_people.peopleindexpage'),
    ('kdl_wagtail_people.personpage'),
]

KDL_WAGTAIL_KRACKDOWN_FILTERS = [
    "kdl_wagtail.core.utils.krackdown_anchor",
    "kdl_wagtail.core.utils.krackdown_link",
]

MAILING_LIST_FORM_WEB_PATH = '/mailing-list/'

# -----------------------------------------------------------------------------
# Django Simple Captcha
# -----------------------------------------------------------------------------

CAPTCHA_FONT_SIZE = 36

# Timeline settings

TIMELINE_IMAGE_FOLDER = '/images/'
TIMELINE_IMAGE_FORMAT = 'jpg'

# dublin core settings
# Set to True to disable the DublinCoreResource model and define your own
DUBLINCORE_RESOURCE_ABSTRACT_ONLY = False

# The path where resource file are uploaded, relative to your MEDIA path
DUBLINCORE_RESOURCE_UPLOAD_PATH = 'uploads/dublin_core/'

# ----------------------------------------------------------------------------
# Wagtail extra settings
# ----------------------------------------------------------------------------

WAGTAILIMAGES_IMAGE_MODEL = "field_wagtail.FieldImage"

# Google Analytics ID
GA_ID = 'UA-67707155-9'

# Field Mailchimp settings (May 2019)
MAILCHIMP_LIST_ID = env('MAILCHIMP_LIST_ID', default='')
MAILCHIMP_API_KEY = env('MAILCHIMP_API_KEY', default='')

# ----------------------------------------------------------------------------
# Rest API
# ----------------------------------------------------------------------------

REST_FRAMEWORK = {
    # Use Django's standard `django.contrib.auth` permissions,
    # or allow read-only access for unauthenticated users.
    'DEFAULT_PERMISSION_CLASSES': [
        'rest_framework.permissions.DjangoModelPermissionsOrAnonReadOnly'
    ],
    'DEFAULT_AUTHENTICATION_CLASSES': [
        'rest_framework.authentication.SessionAuthentication',
    ],

}

# ----------------------------------------------------------------------------
# Game guest account
# ----------------------------------------------------------------------------

FIELD_GAME_USER = "fieldgame"
FIELD_GAME_PASSWORD = ""
