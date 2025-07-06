
from scraper_app.models import ScrapedItem, ScrapeLog
from bs4 import BeautifulSoup
import requests
from datetime import datetime
import time
import json
import random

from env import get_env_variable

BASE_URL = get_env_variable("BASE_URL")
LIST_URL = get_env_variable("LIST_URL")


def fetch_page(url):
    headers = {"User-Agent": "Mozilla/5.0"}
    response = requests.get(url, headers=headers, timeout=10)
    response.raise_for_status()
    return response.text

def scrape_data():
    print("Starting scrape...")
    html = fetch_page(LIST_URL)
    soup = BeautifulSoup(html, "html.parser")
    items = soup.select("li.portal-type-person")
    print(f"Found {len(items)} items on main page.")

    existing_titles = set(ScrapedItem.objects.values_list("title", flat=True))
    scraped_titles = set()
    new_items = []
    unchanged_items = []
    removed_items = []
    
    for item in items:
        link_tag = item.select_one("h3.title a")
        if not link_tag:
            continue
        title = link_tag.get_text(strip=True)
        link = link_tag["href"]
        if not link.startswith("http"):
            link = BASE_URL + link

        img_tag = item.select_one(".focuspoint img")
        photo_url = img_tag["src"] if img_tag else ""

        # Fetch detail page
        detail_html = fetch_page(link)
        detail_soup = BeautifulSoup(detail_html, "html.parser")

        description = ""
        desc_el = detail_soup.select_one("div.field-name-description")
        if desc_el:
            description = desc_el.get_text(strip=True)

        publication = ""
        pub_el = detail_soup.find("dt", string=lambda s: s and "Date(s) of Birth Used" in s)
        if pub_el:
            publication = pub_el.find_next_sibling("dd").get_text(strip=True)

        scraped_titles.add(title)

        if title not in existing_titles:
            ScrapedItem.objects.create(
                title=title,
                photo_url=photo_url,
                description=description,
                publication=publication,
                timestamp=datetime.now()
            )
            new_items.append({
                "title": title,
                "photo_url": photo_url,
                "description": description,
                "publication": publication,
                "timestamp": str(datetime.now())
            })
            print(f"New: {title}")
        else:
            unchanged_items.append({
                "title": title,
                "photo_url": photo_url,
                "description": description,
                "publication": publication,
                "timestamp": str(datetime.now())
            })

        time.sleep(0.5)  # polite

    # Handle removed items
    for old_title in existing_titles - scraped_titles:
        item = ScrapedItem.objects.get(title=old_title)
        removed_items.append({
            "title": item.title,
            "photo_url": item.photo_url,
            "description": item.description,
            "publication": item.publication,
            "timestamp": str(item.timestamp)
        })
        item.delete()
        print(f"Removed: {old_title}")

    # Log everything
    ScrapeLog.objects.create(
        new_count=len(new_items),
        removed_count=len(removed_items),
        new_items=json.dumps(new_items),
        removed_items=json.dumps(removed_items),
        unchanged_items=json.dumps(unchanged_items),
    )

    print(f"Scrape done. New: {len(new_items)}, Removed: {len(removed_items)}, Unchanged: {len(unchanged_items)}")

    return {
        "new_count": len(new_items),
        "removed_count": len(removed_items),
        "unchanged_count": len(unchanged_items),
        "new_items": new_items,
        "removed_items": removed_items,
        "unchanged_items": unchanged_items,
    }
