# NOTE: if you modify any requirements file, you must
# reinstall the requirements in your dev container, or
# rebuild the docker image.

FROM python:3.10-slim as base

RUN apt-get update
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install --upgrade build

# replace "repo" with project name
WORKDIR /repo

ADD requirements.txt .
RUN python3 -m pip install -r requirements.txt


FROM base as prod

# warning: this will re-ADD requirements.txt
ADD . .

RUN python3 -m build
RUN python3 -m pip install -e . --no-deps


FROM base as dev

RUN apt-get install -y git

WORKDIR /repo
ADD requirements-dev.txt .
RUN python3 -m pip install -r requirements-dev.txt


FROM dev as test

# warning: this will re-ADD requirements.txt and requirements-dev.txt
ADD . .
RUN python3 -m build
RUN python3 -m pip install -e . --no-deps
