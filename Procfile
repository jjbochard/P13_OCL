release: python manage.py migrate
web: gunicorn oc_lettings_site.wsgi --bind 0.0.0.0:$PORT
