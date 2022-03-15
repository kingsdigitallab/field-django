from django.conf import settings
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import include, path
from django.views import defaults as default_views

# admin.autodiscover()

urlpatterns = [
    path('timeline/', include('field_timeline.urls')),
    path('wagtail/', include('wagtail.admin.urls')),
    path('documents/', include('wagtail.documents.urls')),
    path('captcha/', include('captcha.urls')),
    path('vocabularies/', include('controlled_vocabulary.urls')),
    path('game/', include('field_game.urls')),
    path('comments/', include('django_comments.urls')),

    # Django Admin, use {% url 'admin:index' %}
    path(settings.ADMIN_URL, admin.site.urls),

    # User management
    # path("users/", include("field.users.urls", namespace="users")),
    # path("accounts/", include("allauth.urls")),
    # path("pages/", include(wagtail_urls)),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)

# settings.DEBUG
error_pages_enabled = True

if error_pages_enabled:
    # This allows the error pages to be debugged during development.
    # just visit these url in browser to see how these error pages look like.
    urlpatterns += [
        path(
            "test/400/",
            default_views.bad_request,
            kwargs={"exception": Exception("Bad Request!")},
        ),
        path(
            "test/403/",
            default_views.permission_denied,
            kwargs={"exception": Exception("Permission Denied")},
        ),
        path(
            "test/404/",
            default_views.page_not_found,
            kwargs={"exception": Exception("Page not Found")},
        ),
        path("test/500/", default_views.server_error),
    ]
    if "debug_toolbar" in settings.INSTALLED_APPS:
        import debug_toolbar

        urlpatterns = [path("__debug__/", include(debug_toolbar.urls))] + urlpatterns

urlpatterns += [
    # For anything not caught by a more specific rule above, hand over to
    # Wagtail's serving mechanism
    path(r'', include('puput.urls')),
    path(r'', include('wagtail.core.urls')),
]
