from django.core.management.base import BaseCommand
from scraper_app.services.scraper import scrape_data

class Command(BaseCommand):
    help = "Scrape data with change tracking"

    def handle(self, *args, **kwargs):
        result = scrape_data()
        self.stdout.write(self.style.SUCCESS(
            f"Scrape completed. New: {result['new_count']}, Removed: {result['removed_count']}"
        ))
