# NOTE: if you modify any requirements file, you must
# reinstall the requirements in your dev container, or
# rebuild the docker image.

FROM python:3.10-slim as base

RUN apt-get update
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install --upgrade build

# replace "repo" with project name
WORKDIR /repo


FROM base as prod
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
ADD .pre-commit-config.yaml .
RUN python3 -m pip install -r requirements-dev.txt
RUN git init .
RUN pre-commit install-hooks

# Cache things before requirements.txt
ADD requirements.txt .
RUN python3 -m pip install -r requirements.txt

# Build the repo
WORKDIR /repo
ADD . .
RUN python -m build
RUN python -m pip install -e . --no-deps
