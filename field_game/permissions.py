from rest_framework import permissions
from django.conf import settings

class IsCreatorOrReadOnly(permissions.BasePermission):
    """
    Custom permission to only allow creators of games to edit them
    if the user is game guest
    """

    def has_object_permission(self, request, view, obj):
        # Read permissions are allowed to any request,
        # so we'll always allow GET, HEAD or OPTIONS requests.
        if request.method in permissions.SAFE_METHODS:
            return True

        # Write permissions are only allowed to the owner of the snippet.
        if request.user == settings.FIELD_GAME_USER:
            obj.owner == request.user
        else:
            # let ordinary authentication handle it
            return True

