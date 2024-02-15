#!/bin/env bash
# Script to start Django inside docker
# There's no need to ever run this manually

# Echo any run commands by bash to stdout for readability's sake
set -v

# Run any necessary database migrations
poetry run python python-django/manage.py migrate

# Django starts using these arguments
# -> run a shell command in the poetry environment
# -> python (poetry's version) 
# -> manage.py is the script used for all django commands
# -> runserver is a command of manage.py that runs a local development server
#    This isn't how we'd run something in a professional environment,
#    but for our purposes it's fine.
# -> 0.0.0.0:8000 means "listen from any connection attempt on port 8000"
poetry run python python-django/manage.py runserver 0.0.0.0:8000
