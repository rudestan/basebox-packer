#/usr/bin/python
# -*- coding: utf-8 -*-
import os
import sys

sys.path.append('/home/www/env/pyblog/lib/python2.7/site-packages')
sys.path.append('/home/www/pyblog')

os.environ['DJANGO_SETTINGS_MODULE'] = 'pyblog.settings'

import django.core.handlers.wsgi
application = django.core.handlers.wsgi.WSGIHandler()