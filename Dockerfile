FROM python:3.12.7-slim as base

# Install things
RUN apt-get update
RUN python -m pip install --upgrade pip
RUN python -m pip install --upgrade poetry
WORKDIR /repo
ADD pyproject.toml poetry.lock ./

FROM base as prod
RUN poetry install --without dev --no-root --no-interaction --no-ansi
ADD . .
RUN poetry install --without dev --no-interaction --no-ansi

FROM base as dev
RUN poetry install --with dev --no-root --no-interaction --no-ansi
ADD . .
RUN poetry install --with dev --no-interaction --no-ansi
