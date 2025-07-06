import os
from celery import Celery
from celery.schedules import crontab

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "scraper_project.settings")

app = Celery("scraper_project")
app.config_from_object("django.conf:settings", namespace="CELERY")
app.autodiscover_tasks()

app.conf.beat_schedule = {
    "scrape_task": {
        "task": "scraper_app.tasks.scrape_data_task",
        "schedule": crontab(minute="*/60"),  # every hour
    },
    "test_task": {
        "task": "scraper_app.tasks.debug_task",
        "schedule": crontab(minute="*/1"),  # every minute
    },
}
