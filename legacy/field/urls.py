from django.conf import settings
from django.contrib import admin
from django.urls import include, re_path, path
from kdl_ldap.signal_handlers import \
    register_signal_handlers as kdl_ldap_register_signal_hadlers
from wagtail.core import urls as wagtail_urls
from wagtail.admin import urls as wagtailadmin_urls
from wagtail.documents import urls as wagtaildocs_urls
from field_timeline import urls as field_timeline_urls
from puput import urls as puput_urls
from django.conf.urls import url
kdl_ldap_register_signal_hadlers()

admin.autodiscover()

# https://docs.wagtail.io/en/v2.4/advanced_topics/
# settings.html?highlight=urls.py#urls-py
urlpatterns = [
    path('admin/', admin.site.urls),
    re_path(r'^timeline/', include(field_timeline_urls)),
    re_path(r'^wagtail/', include(wagtailadmin_urls)),
    re_path(r'^documents/', include(wagtaildocs_urls)),
    re_path(r'^captcha/', include('captcha.urls')),
    path('vocabularies/', include('controlled_vocabulary.urls')),
    # For anything not caught by a more specific rule above, hand over to
    # Wagtail's serving mechanism
    url(r'', include(puput_urls)),
    re_path(r'', include(wagtail_urls)),
]

# -----------------------------------------------------------------------------
# Django Debug Toolbar URLS
# -----------------------------------------------------------------------------
try:
    if settings.DEBUG:
        import debug_toolbar
        urlpatterns = [
            re_path(r'^__debug__/', include(debug_toolbar.urls)),
        ] + urlpatterns
except ImportError:
    pass

# -----------------------------------------------------------------------------
# Static file DEBUGGING
# -----------------------------------------------------------------------------
if settings.DEBUG:
    from django.conf.urls.static import static
    from django.contrib.staticfiles.urls import staticfiles_urlpatterns
    import os.path

    urlpatterns += staticfiles_urlpatterns()
    urlpatterns += static(settings.MEDIA_URL + 'images/',
                          document_root=os.path.join(settings.MEDIA_ROOT,
                                                     'images'))
