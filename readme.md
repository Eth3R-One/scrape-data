# Django Scraper

This is a Django app that scrapes wanted persons from the FBI website, tracks new / removed entries, and provides a simple HTMX-based UI to view and search.

---

## 🚀 Features

- Scrapes wanted person data (name, photo).
- Stores in Django database.
- Tracks changes: new, removed, unchanged.
- HTMX frontend to search and filter logs.
- Simple sidebar with scrape history.

---
## Functionality

- sidebar shows the log of scraping, by clicking one log you'll see the unchanged data, new data and removed data
- click check new changes button to scrap data
- search box searches data from the current saved data in database without website reload
- there's a management command named `scrape_data_task` run it `python manage.py scrape_data_task`
- setup mail if you want update of scrape data changes, instructions given below
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

# email setup
EMAIL_HOST_USER = 
EMAIL_HOST_PASSWORD = 
DEFAULT_FROM_EMAIL = 
EMAIL_SEND_TO = ["refayth.hossain@gmail.com", "test@gmail.com"]
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

### Schedule Task

#### setup
- install redis
`sudo dnf install redis`
- start redis service
`sudo systemctl enable --now redis`
- Check if running
`sudo systemctl status redis`

you should see
```● redis.service - Redis persistent key-value database
   Loaded: loaded (/usr/lib/systemd/system/redis.service; enabled)
   Active: active (running)
   ```

other wise redis is not set up correctly, schedule task won't run.

then in two different terminal (in the project directory with virtual env enabled) run these two commands
```
celery -A scraper_project worker -l info
```

```
celery -A scraper_project beat -l info
```
you'll see `>>>>> Celery is working! <<<<<` and it's mean everything is working for schedule job