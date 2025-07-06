from django.shortcuts import render, get_object_or_404
from django.contrib.auth.decorators import login_required
from django.http import JsonResponse
from .models import ScrapedItem, ScrapeLog
from scraper_app.services.scraper import scrape_data


@login_required
def scraped_items(request):
    items = ScrapedItem.objects.all()
    sidebar_logs = ScrapeLog.objects.order_by('-created_at')[:10]
    return render(request, "scraper_app/home.html", {
        "items": items,
        "sidebar_logs": sidebar_logs,
    })


@login_required
def filter_items(request):
    search_query = request.GET.get("search", "")
    items = ScrapedItem.objects.filter(title__icontains=search_query)
    return render(request, "scraper_app/partials/items_list.html", {
        "items": items,
        "search_query": search_query,
    })


import json

def safe_json_list(data):
    if isinstance(data, str):
        return json.loads(data)
    return data


@login_required
def log_detail(request, log_id):
    print('sending data')
    log = get_object_or_404(ScrapeLog, id=log_id)

    new_items = safe_json_list(log.new_items)
    removed_items = safe_json_list(log.removed_items)
    unchanged_items = safe_json_list(log.unchanged_items)

    titles_new = {item["title"] for item in new_items}
    titles_removed = {item["title"] for item in removed_items}
    titles_unchanged = {item["title"] for item in unchanged_items}

    items = []
    for item in ScrapedItem.objects.all():
        status = (
            "new" if item.title in titles_new else
            "unchanged" if item.title in titles_unchanged else
            None
        )
        items.append({
            "title": item.title,
            "photo_url": item.photo_url,
            "description": item.description,
            "publication": item.publication,
            "status": status
        })

    for removed in removed_items:
        items.append({
            "title": removed["title"],
            "photo_url": removed.get("photo_url", ""),
            "description": removed.get("description", "This item was removed."),
            "publication": removed.get("publication", ""),
            "status": "removed"
        })

    sidebar_logs = ScrapeLog.objects.order_by('-created_at')[:10]

    if request.headers.get('HX-Request') == 'true':
        return render(request, "scraper_app/partials/items_list.html", {
            "items": items,
            "sidebar_logs": sidebar_logs,
        })

    return render(request, "scraper_app/home.html", {
        "items": items,
        "sidebar_logs": sidebar_logs,
    })


@login_required
def trigger_scrape(request):
    print("trigger clicked")
    if request.method == "POST":
        result = scrape_data()
        sidebar_logs = ScrapeLog.objects.order_by('-created_at')[:10]
        items = ScrapedItem.objects.all()
        return render(request, "scraper_app/partials/items_list.html", {
            "sidebar_logs": sidebar_logs,
            "items": items,
            "result": result,
        })
    return JsonResponse({"error": "Invalid request"}, status=400)
