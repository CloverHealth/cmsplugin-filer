from django.apps import AppConfig
try:
    from django.utils.translation import ugettext_lazy as _
except ImportError:
    from django.utils.translation import gettext_lazy as _


class FilerImageConfig(AppConfig):
    name = 'cmsplugin_filer_image'
    verbose_name = _('django filer image')
