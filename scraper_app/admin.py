from django.contrib import admin
from .models import ScrapedItem, ScrapeLog

admin.site.register(ScrapedItem)
admin.site.register(ScrapeLog)
