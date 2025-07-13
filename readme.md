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

- in every scrape 3 arrays are stored in the db by checking if anything has changed with previously store data in the db. New items, new count, removed items removed count and unchanged items
- i created a service named scrape_data under `scraper_app/service/scraper.py` for multiple use. This method scrape data from the targeted website with given html structure and store log.
- sidebar shows the log of scraping, by clicking one log you'll see the unchanged data, new data and removed data
- click check new changes button to scrap data which calls the previous scrape_data method with htmx-get method
- differences are shown with new and removed title and some green for new and red for removed color format
- everything is wrapped with django auth, and login required decorator
- sidebar shows the log of scraping, by clicking one log you'll see the unchanged data, new data and removed data
- click check new changes button to scrap data which calls the previous scrape_data method with htmx-get method
- differences are shown with new and removed title and some green for new and red for removed color format
- everything is wrapped with django auth, and login required decorator
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
## create super user
`python manage.py createsuperuser`
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




# Deployment Guide

**Gunicorn** for running Django  
**Nginx** for serving HTTP requests  
**Supervisor or systemd** for managing the process  
**MySQL** as database  
**Static & media file handling**

---

## 1. Initial server setup

SSH into your server:
```bash
ssh root@your_server_ip
```

Update and install essential packages:
```bash
sudo apt update && sudo apt upgrade -y
sudo apt install python3-pip python3-venv python3-dev build-essential \
libmysqlclient-dev pkg-config nginx git ufw -y
```

(Optional) Enable firewall:
```bash
sudo ufw allow OpenSSH
sudo ufw allow 'Nginx Full'
sudo ufw enable
```

---

## 2. Setup MySQL database

Install MySQL:
```bash
sudo apt install mysql-server -y
sudo mysql_secure_installation
```

Create database & user:
```sql
sudo mysql
```
Inside MySQL shell:
```sql
CREATE DATABASE myproject CHARACTER SET UTF8MB4;
CREATE USER 'myuser'@'localhost' IDENTIFIED BY 'mypassword';
GRANT ALL PRIVILEGES ON myproject.* TO 'myuser'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

Export current database from your local machine:
```bash
mysqldump -u youruser -p yourdb > db_backup.sql
```

Copy dump to server & import:
```bash
scp db_backup.sql root@your_server_ip:/root/
mysql -u myuser -p myproject < /root/db_backup.sql
```

---

## 3. Setup your Django project

Clone your project to server:
```bash
cd /srv/
sudo mkdir myproject
sudo chown $USER:$USER myproject
cd myproject
git clone https://github.com/yourname/yourproject.git .
```

Create virtual environment & install packages:
```bash
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
```

Edit `settings.py` or `.env` for production DB:
```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'myproject',
        'USER': 'myuser',
        'PASSWORD': 'mypassword',
        'HOST': '127.0.0.1',
        'PORT': '3306',
    }
}
```

Run migrations & collect static files:
```bash
python manage.py migrate
python manage.py collectstatic --noinput
```

---

## 4. Gunicorn setup

Test gunicorn manually:
```bash
gunicorn --bind 0.0.0.0:8000 myproject.wsgi:application
```
(Stop with `CTRL+C`).

---

### Using systemd

Create `/etc/systemd/system/myproject.service`:

```ini
[Unit]
Description=Gunicorn instance to serve myproject
After=network.target

[Service]
User=www-data
Group=www-data
WorkingDirectory=/srv/myproject
Environment="PATH=/srv/myproject/venv/bin"
ExecStart=/srv/myproject/venv/bin/gunicorn --workers 3 --bind unix:/srv/myproject/myproject.sock myproject.wsgi:application

[Install]
WantedBy=multi-user.target
```

Enable & start the service:
```bash
sudo systemctl daemon-reload
sudo systemctl start myproject
sudo systemctl enable myproject
sudo systemctl status myproject
```

---

## 5. Configure Nginx

Create `/etc/nginx/sites-available/myproject`:

```nginx
server {
    listen 80;
    server_name your_domain.com;

    location = /favicon.ico { access_log off; log_not_found off; }

    location /static/ {
        root /srv/myproject;
    }

    location /media/ {
        root /srv/myproject;
    }

    location / {
        include proxy_params;
        proxy_pass http://unix:/srv/myproject/myproject.sock;
    }
}
```

Enable the site & restart Nginx:
```bash
sudo ln -s /etc/nginx/sites-available/myproject /etc/nginx/sites-enabled
sudo nginx -t
sudo systemctl restart nginx
```

---

## 6. Handle static & media files

Ensure static & media directories exist and have proper permissions:
```bash
mkdir -p /srv/myproject/static /srv/myproject/media
sudo chown -R www-data:www-data /srv/myproject/static /srv/myproject/media
```

Make sure your `settings.py` has:
```python
STATIC_ROOT = '/srv/myproject/static'
MEDIA_ROOT = '/srv/myproject/media'
```


Visit:
```
http://your_domain.com
```
you'll see `>>>>> Celery is working! <<<<<` and it's mean everything is working for schedule job
```
```
