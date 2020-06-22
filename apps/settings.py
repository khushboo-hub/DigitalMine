"""
Django settings for zzz project.

Generated by 'django-admin startproject' using Django 2.0.5.

For more information on this file, see
https://docs.djangoproject.com/en/2.0/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/2.0/ref/settings/
"""

import os

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/2.0/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '0ux_%=7!81&z=^uj5iw@tue#7zkfn9lk)=*d147(g+$5t$l9nz'
ENCRYPT_KEY = b'zuXLx4c01oe15FstyxBPqyjgC0RKbzMEPZKA--bUHyI='

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = ['*']


# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    # 'gdstorage',
    # 'debug_toolbar',

    'theme',
    'employee',
    'MinersTracking',
    'FireExp',
    'Controlling',
    'DGMS_Forms',
    'Strata',

    'accounts',
    'snippets',
    'gasmonitoring',
    'temp_monitoring',
    'background_task',
    'gasmonitoring_wifi',
    'inventory_management',
    'attendance',
    'Training_Rescue_Accident',
    'ProductionMonitoring',
    'sensor',
    'water_level_monitoring',
    'SMS', 
    'news',
    'emails',
    #'django_hosts',
    # 'mail_templated',
    'dashboard',
    'setting',
    'wm_test',
    'Slope',

]

MIDDLEWARE = [
    #'django_hosts.middleware.HostsRequestMiddleware',
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'debug_toolbar.middleware.DebugToolbarMiddleware',
    #'django_hosts.middleware.HostsResponseMiddleware',
]

ROOT_URLCONF = 'apps.urls'


#ROOT_HOSTCONF = 'apps.hosts'  # Change `mysite` to the name of your project
#DEFAULT_HOST = 'www'  # Name of the default host, we will create it in the next steps

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'apps.wsgi.application'


# Database
# https://docs.djangoproject.com/en/2.0/ref/settings/#databases

DATABASES = {
    'default': {
        # 'ENGINE': 'django.db.backends.sqlite3',
        # 'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'iot',
        'USER': 'csir',
        'PASSWORD': 'tpo4pf9KlQEBGkNo',
        'HOST': '127.0.0.1',
        'OPTIONS':{
            'init_command': "SET sql_mode='STRICT_TRANS_TABLES'"
        }
    }
}

# Password validation
# https://docs.djangoproject.com/en/2.0/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]

# https://docs.djangoproject.com/en/2.0/topics/i18n/

# LANGUAGE_CODE = 'hi-IN'

LANGUAGES = (
    ('en', 'English'),
    ('zn-ch', 'Simplified Chinese'),
    ('zn-tw', 'Traditional Chinese'),
)


LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'Asia/Kolkata'

USE_I18N = True

USE_L10N = True

USE_TZ = False

LOCALE_PATHS = (
    os.path.join(BASE_DIR, 'locale'),
)

# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/2.0/howto/static-files/

STATIC_URL = '/static/'
STATICFILES_DIRS = (os.path.join(BASE_DIR, 'static'),)
# STATIC_ROOT = os.path.join(BASE_DIR, 'staticfiles')
# LOGIN_URL = '/admin/login/'
LOGIN_REDIRECT_URL = '/accounts/login'
LOGOUT_REDIRECT_URL = "/"

MEDIA_URL = '/media/'
MEDIA_ROOT = os.path.join(BASE_DIR, 'media')


EMAIL_HOST = 'smtp.gmail.com'
EMAIL_PORT = 587
EMAIL_USE_TLS = True
EMAIL_HOST_USER = 'csir.cimfr.ssmishra@gmail.com'
EMAIL_HOST_PASSWORD = 'cimfr@ssmishra'

DEBUG_TOOLBAR_PANELS = [
    'debug_toolbar.panels.versions.VersionsPanel',
    'debug_toolbar.panels.timer.TimerPanel',
    'debug_toolbar.panels.settings.SettingsPanel',
    'debug_toolbar.panels.headers.HeadersPanel',
    'debug_toolbar.panels.request.RequestPanel',
    'debug_toolbar.panels.sql.SQLPanel',
    'debug_toolbar.panels.staticfiles.StaticFilesPanel',
    'debug_toolbar.panels.templates.TemplatesPanel',
    'debug_toolbar.panels.cache.CachePanel',
    'debug_toolbar.panels.signals.SignalsPanel',
    'debug_toolbar.panels.logging.LoggingPanel',
    'debug_toolbar.panels.redirects.RedirectsPanel',
    'debug_toolbar.panels.profiling.ProfilingPanel',
]

def show_toolbar(request):
    return False

DEBUG_TOOLBAR_CONFIG={
    'INTERCEPT_REDIRECTS':True,
    'SHOW_TOOLBAR_CALLBACK':show_toolbar
}
# GOOGLE_DRIVE_STORAGE_JSON_KEY_FILE ='my-project-1549610242332-d51f9c84fd50.json'
# X_FRAME_OPTIONS = 'SAMEORIGIN'