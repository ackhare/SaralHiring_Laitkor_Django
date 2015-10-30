"""
Django settings for MySaralSite project.

For more information on this file, see
https://docs.djangoproject.com/en/1.7/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.7/ref/settings/
"""

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
import sys
import os
from django import templatetags

try:
    # dateutil is an absolute requirement
    import dateutil
except ImportError:
    raise ImportError(
        'django-swingtime requires the "dateutil" package '
        '(http://labix.org/python-dateutil): $ pip install python-dateutil'
    )
SETTINGS_DIR = os.path.dirname(__file__)
BASE_DIR = os.path.dirname(os.path.dirname(__file__))
# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.7/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '24ihtu##+pj#b3vbiw+s!l#-y*!cdu7nu3qwz&@5^w1mui0oma'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True
PROJECT_PATH = os.path.join(SETTINGS_DIR, os.pardir)
PROJECT_PATH = os.path.abspath(PROJECT_PATH)
STATIC_PATH = os.path.join(PROJECT_PATH, 'static')
TEMPLATE_DEBUG = True

ALLOWED_HOSTS = []

# Printing paths for sanity's sake
print ("Settings directory:", SETTINGS_DIR)
print ("Project root:", PROJECT_PATH)
print ("Static:", STATIC_PATH)


# Application definition

INSTALLED_APPS = (
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'saralproject',
    'Sp_Discipline',
    'Sp_Projects',
    'Sp_Divisions',
         'haystack',
    'Sp_TimeEntries',
    'Sp_Companies',
    'swingtime',
    'myCalendar',
    'templatetags',
    'Sp_Invoice',
    'Sp_Contacts',
    'Sp_Teams',

 'pure_pagination',
    'Sp_Users',
    'Sp_Project_Po',
    'Sp_ProjectClient',


)
PAGINATION_SETTINGS = {
    'PAGE_RANGE_DISPLAYED': 3,
    'MARGIN_PAGES_DISPLAYED': 2,
}
HAYSTACK_CONNECTIONS = {
    'default': {
        'ENGINE': 'haystack.backends.whoosh_backend.WhooshEngine',
        'PATH': os.path.join(os.path.dirname(__file__), 'whoosh_index'),
    },
}
MIDDLEWARE_CLASSES = (
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.auth.middleware.SessionAuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
)


ROOT_URLCONF = 'MySaralSite.urls'

WSGI_APPLICATION = 'MySaralSite.wsgi.application'


# Database
# https://docs.djangoproject.com/en/1.7/ref/settings/#databases


DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': '/home/chetan/PycharmProjects/SaralProject___cured_of_dep_hell/MySaralSite/saralproject_Db12',

    }
}

EMAIL_USE_TLS = True
EMAIL_HOST = 'smtp.gmail.com'
EMAIL_PORT = 587
EMAIL_HOST_USER = 'chetan.khare@laitkor.com'
EMAIL_HOST_PASSWORD = 'drxdzpcbbgvvjkao'
DEFAULT_FROM_EMAIL = 'chetan.khare@laitkor.com'
DEFAULT_TO_EMAIL = 'bairagisirfire@gmail.com'
# Internationalization
# https://docs.djangoproject.com/en/1.7/topics/i18n/
#EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
LANGUAGE_CODE = 'en-us'
# Additional locations of static files
STATICFILES_DIRS = (
    # Put strings here, like "/home/html/static" or "C:/www/django/static".
    # Always use forward slashes, even on Windows.
    # Don't forget to use absolute paths, not relative paths.
    STATIC_PATH,
)

# List of finder classes that know how to find static files in
# various locations.
STATICFILES_FINDERS = (
    'django.contrib.staticfiles.finders.FileSystemFinder',
    'django.contrib.staticfiles.finders.AppDirectoriesFinder',
#    'django.contrib.staticfiles.finders.DefaultStorageFinder',
)
TEMPLATE_CONTEXT_PROCESSORS = (
    'django.core.context_processors.debug',
    'django.core.context_processors.media',
    'django.contrib.auth.context_processors.auth',
    'django.contrib.messages.context_processors.messages',
    'swingtime.context_processors.current_datetime',
     'django.core.context_processors.request'
)
TIME_ZONE = 'UTC'

SWINGTIME_SETTINGS_MODULE = 'MySaralSite.swingtime_settings'

USE_I18N = True

USE_L10N = True
PAGINATION_SETTINGS = {
    'PAGE_RANGE_DISPLAYED': 10,
    'MARGIN_PAGES_DISPLAYED': 2,
}
#USE_TZ = True

TEMPLATE_DIRS = (
    os.path.join(BASE_DIR,  'templates'),
)
# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.7/howto/static-files/
sys.path.extend([
    os.path.abspath('..'),    # relative path to mycalendar app
    os.path.abspath('../..'), # relative location of swingtime app
])
STATIC_URL = '/static/'

try:
    import django_extensions
except ImportError:
    pass
else:
    INSTALLED_APPS += ('django_extensions',)

MEDIA_ROOT = os.path.join(PROJECT_PATH, 'uploads')

# URL that handles the media served from MEDIA_ROOT. Make sure to use a
# trailing slash.
# Examples: "http://example.com/media/", "http://media.example.com/"
MEDIA_URL = '/uploads/'




#Custom Settings
ROLE_EMP=2
ROLE_CLIENT=1
NUM_RECORDS_PER_PAGE=5
DEFAULT_COMPANY_NAME='laitkor'
DEFAULT_COMPANY_CODE='laitkor'
DEFAULT_COMPANY_SHORT_NAME='laitkor'
DEFAULT_FIRST_NAME='gaze'
DEFAULT_SECOND_NAME='baze'

DEFAULT_EMAIL_ADMIN='my@laitkor.com'
#from db
DEFAULT_PM_DISC='2'
