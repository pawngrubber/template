FROM python:3.10.6-slim-buster as base

ENV POETRY_VERSION=1.2.2

# Prerequisite Installs
RUN apt-get update
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install "poetry==$POETRY_VERSION"
RUN python3 -m pip install --upgrade build

FROM base as dev
RUN apt-get install -y git

# # Build the repo
ADD . .
RUN python -m build
RUN python -m pip install -e . --no-deps
