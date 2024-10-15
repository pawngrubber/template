FROM python:3.12.7-slim as base

# Install things
RUN apt-get update
RUN python -m pip install --upgrade pip
RUN python -m pip install --upgrade poetry

FROM base as prod
WORKDIR /repo
ADD pyproject.toml poetry.lock ./
RUN poetry install --without dev,pre-commit --no-root --no-interaction --no-ansi
ADD . .
RUN poetry install --without dev,pre-commit --no-interaction --no-ansi

FROM base as dev

RUN apt-get install -y git

# Install things in separate /cache folder
WORKDIR /cache

# Install pre-commit
ADD requirements-pre-commit.txt requirements-pre-commit.txt
RUN pip install -r requirements-pre-commit.txt
ADD .pre-commit-config.yaml .
RUN git init .
RUN pre-commit install-hooks

# Remove /cache directory
WORKDIR /repo
RUN rm -r /cache

# Build the repo
ADD . .
RUN poetry install --with dev,pre-commit --no-interaction --no-ansi
