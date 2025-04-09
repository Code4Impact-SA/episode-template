#!/bin/bash

if [[ $# -gt 0 ]]; then
    # If we pass a command, run it
    exec "$@"
else
    # Else default to starting the server
    set -e

    echo "${0}: running migrations."
    python manage.py makemigrations --noinput
    python manage.py migrate --noinput

    echo "${0}: collecting statics."

    python manage.py collectstatic --noinput


    gunicorn \
        --bind :8000 \
        --workers 2 \
        --log-level=info \
        code_for_impact.wsgi

fi