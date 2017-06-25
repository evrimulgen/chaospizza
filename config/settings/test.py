# pylint: disable=C0111
# pylint: disable=W0401
# pylint: disable=W0614
"""
Test settings.

For testing in development environment and CI:
- The secret key is hardcoded in the file
- A console email backend is used
"""
from .base import *  # noqa

# Note: This key only used for development and testing.
SECRET_KEY = 'ld3x@708pu@pk550rawkc3d@&s=9bu0hk01gl7znw*c%5l79m)'

# EMAIL CONFIGURATION
# ------------------------------------------------------------------------------
EMAIL_BACKEND = env('DJANGO_EMAIL_BACKEND', default='django.core.mail.backends.console.EmailBackend')