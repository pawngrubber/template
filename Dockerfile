FROM python:3.10-slim as base

# Install things
RUN apt-get update
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install --upgrade build

FROM base as prod
WORKDIR /repo
ADD . .
RUN python3 -m pip install -r requirements.txt
RUN python3 -m build
RUN python3 -m pip install -e . --no-deps


FROM base as dev

RUN apt-get install -y git

# Install things in separate /cache folder
WORKDIR /cache

# Install pre-commit
ADD requirements-dev.txt .
RUN python3 -m pip install -r requirements-dev.txt
ADD .pre-commit-config.yaml .
RUN git init .
RUN pre-commit install-hooks

# Cache things before requirements.txt
ADD requirements.txt .
RUN python3 -m pip install -r requirements.txt

# Remove /cache directory
WORKDIR /repo
RUN rm -r /cache

# Build the repo
ADD . .
RUN python -m build
RUN python -m pip install -e . --no-deps
