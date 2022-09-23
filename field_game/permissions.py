from rest_framework import permissions
from django.conf import settings

class AllowedHostPermission(permissions.BasePermission):
    """
    Only allow access from local clients
    """

    def has_permission(self, request, view):
        if request.method in permissions.SAFE_METHODS:
            return True
        else:
            host_addr = request.META['REMOTE_ADDR']
            if host_addr in settings.ALLOWED_HOSTS:
                return True
            return False
