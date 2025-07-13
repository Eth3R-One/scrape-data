from celery import shared_task
from scraper_app.services.scraper import scrape_data, test_func

@shared_task
def scrape_data_task():
    scrape_data()


@shared_task
def debug_task():
    print(">>>>> Celery is working! <<<<<")
    test_func()
