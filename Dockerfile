FROM python:3.12.7-slim as base

# Install things
RUN apt-get update
RUN python -m pip install --upgrade pip
RUN python -m pip install --upgrade uv
WORKDIR /repo
ADD pyproject.toml uv.lock ./

FROM base as prod
RUN python -m uv sync --no-dev --no-interaction --no-ansi
ADD . .
RUN python -m uv sync --no-dev --no-interaction --no-ansi

FROM base as dev
RUN python -m uv sync --all-extras --no-interaction --no-ansi
ADD . .
RUN python -m uv sync --all-extras --no-interaction --no-ansi
