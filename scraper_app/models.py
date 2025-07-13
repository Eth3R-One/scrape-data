from django.db import models

class ScrapedItem(models.Model):
    title = models.CharField(max_length=255)
    photo_url = models.URLField(blank=True, null=True)
    description = models.TextField(blank=True, null=True)
    publication = models.CharField(max_length=255, blank=True, null=True)
    timestamp = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.title

class ScrapeLog(models.Model):
    created_at = models.DateTimeField(auto_now_add=True)
    new_count = models.IntegerField(default=0)
    removed_count = models.IntegerField(default=0)
    unchanged_count = models.IntegerField(default=0)
    
    new_items = models.JSONField(default=list)
    removed_items = models.JSONField(default=list)
    unchanged_items = models.JSONField(default=list)

    def __str__(self):
        return f"Scrape on {self.created_at.strftime('%Y-%m-%d %H:%M:%S')}: +{self.new_count} -{self.removed_count} ~{self.unchanged_count}"
