# Django Scraper

This is a Django app that scrapes wanted persons from the FBI website, tracks new / removed entries, and provides a simple HTMX-based UI to view and search.

---

## 🚀 Features

- Scrapes wanted person data (name, photo, description, DOB).
- Stores in Django database.
- Tracks changes: new, removed, unchanged.
- HTMX frontend to search and filter logs.
- Simple sidebar with scrape history.

---

## ⚙️ Installation

```bash
git clone https://github.com/yourusername/scraper_project.git
cd scraper_project
python -m venv venv
source venv/bin/activate  # or on Windows: venv\Scripts\activate
pip install -r requirements.txt
```
## .env setup
```
DEBUG=True #only for dev mode
SECRET_KEY=
DB_ENGINE=django.db.backends.mysql #for mysql
DB_NAME=
DB_USER=
DB_PASSWORD=
DB_HOST=
DB_PORT=
BASE_URL = "https://www.fbi.gov"
LIST_URL = "https://www.fbi.gov/wanted/wcc"

```

## Migrate database
```
python manage.py makemigrations
python manage.py migrate
```
## Run project 
```
python manage.py runserver
```