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

ADD requirements-dev.txt .
RUN python3 -m pip install -r requirements-dev.txt
RUN apt-get install -y git

# in docker-compose, as part of running the dev container,
# mount your local repository and build the wheels with
#   RUN python3 -m build
#   RUN python3 -m pip install -e . --no-deps
CMD ["python", "-m", "pip", "install", "-e", ".", "--no-deps"]
