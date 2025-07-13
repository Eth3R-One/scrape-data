from django.urls import path
from . import views

app_name = "scraper_app"

urlpatterns = [
    path('', views.scraped_items, name='scraped_items'),
    path('filter/', views.filter_items, name='filter_items'),
    path('scrape/', views.trigger_scrape, name='trigger_scrape'),
    path('log/<int:log_id>/', views.log_detail, name='log_detail'),

]

