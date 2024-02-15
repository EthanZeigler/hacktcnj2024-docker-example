# Everything in this file assumes docker will be run from the root of
# the repository. When looking at files that are copied, use that as your point
# of reference, not the folder this file is in.

# Build starting from a container with latest python minor version
FROM --platform=$BUILDPLATFORM python:3-alpine AS builder

# Port 8000 of the container is bound to port 8000 of the host computer
EXPOSE 8000

# We want to set up the project in a folder named app at the root of the container
WORKDIR /app

# Install python package manager
RUN pip3 install poetry

# Copies these files from the host to the container, placing them in /app/
COPY pyproject.toml poetry.lock ./

# Install all the project dependencies listed in pyproject.toml,
# ignoring any documentation files or develop-only packages
RUN poetry install --only main

# Copy all the rest of the files into the container
COPY . ./

# Docker starts the container by running the borne shell
ENTRYPOINT ["sh"]

# And bash is told to execute the entrypoint.sh file
CMD ["python-django/docker/entrypoint.sh"]
