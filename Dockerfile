FROM python:3.10-slim-buster as base

# Install things
RUN apt-get update
RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install --upgrade build

FROM base as prod
WORKDIR /repo
ADD . .
RUN python3 -m pip install -r requirements/prod.txt
RUN python3 -m build
RUN python3 -m pip install -e . --no-deps


FROM base as dev

RUN apt-get install -y git

# Install things in separate /cache folder
WORKDIR /cache

# Install pre-commit
ADD requirements/dev.txt requirements/dev.txt
RUN python3 -m pip install -r requirements/dev.txt
ADD .pre-commit-config.yaml .
RUN git init .
RUN pre-commit install-hooks

# Cache things before requirements/prod.txt
ADD requirements/prod.txt requirements/prod.txt
RUN python3 -m pip install -r requirements/prod.txt

# Remove /cache directory
WORKDIR /repo
RUN rm -r /cache

# Build the repo
ADD . .
RUN python -m build
RUN python -m pip install -e . --no-deps

ARG src="nscacert.pem"
ARG newname="nscacert.crt"
ARG dest="/usr/local/share/ca-certificates/netskope/"
ADD ${src} ${dest}${newname}
RUN chmod 644 ${dest}
RUN chmod 755 ${dest}${newname}
RUN cat ${dest}${newname} >> /etc/ssl/certs/ca-certificates.crt
RUN update-ca-certificates