from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import include, path
from django.views import defaults as default_views
from django.views.generic import TemplateView
from wagtail.admin import urls as wagtailadmin_urls
from wagtail.core import urls as wagtail_urls
from wagtail.documents import urls as wagtaildocs_urls
from field_timeline import urls as field_timeline_urls
from puput import urls as puput_urls

# admin.autodiscover()

urlpatterns = [
    path(r'timeline/', include('field_timeline.urls')),
    path(r'wagtail/', include('wagtail.admin.urls')),
    path(r'documents/', include('wagtail.documents.urls')),
    path(r'captcha/', include('captcha.urls')),
    path('vocabularies/', include('controlled_vocabulary.urls')),

    # Django Admin, use {% url 'admin:index' %}
    path(settings.ADMIN_URL, admin.site.urls),

    # For anything not caught by a more specific rule above, hand over to
    # Wagtail's serving mechanism
    path(r'', include('puput.urls')),
    path(r'', include('wagtail.core.urls')),

    # User management
    # path("users/", include("field.users.urls", namespace="users")),
    # path("accounts/", include("allauth.urls")),
    # path("pages/", include(wagtail_urls)),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)


if settings.DEBUG:
    # This allows the error pages to be debugged during development, just visit
    # these url in browser to see how these error pages look like.
    urlpatterns += [
        path(
            "400/",
            default_views.bad_request,
            kwargs={"exception": Exception("Bad Request!")},
        ),
        path(
            "403/",
            default_views.permission_denied,
            kwargs={"exception": Exception("Permission Denied")},
        ),
        path(
            "404/",
            default_views.page_not_found,
            kwargs={"exception": Exception("Page not Found")},
        ),
        path("500/", default_views.server_error),
    ]
    if "debug_toolbar" in settings.INSTALLED_APPS:
        import debug_toolbar

        urlpatterns = [path("__debug__/", include(debug_toolbar.urls))] + urlpatterns
