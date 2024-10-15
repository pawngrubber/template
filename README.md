This is a template repository to build on top of:
- Can be packaged with `poetry`
- Working `pytest` tests in `tests` directory
- Environment installed inside a Docker Container
- `README.md` file with repeatable instructions
- Uses Python 3.12

## Develop without Docker
1. Create a new Python virtual environment, make sure the version matches the Dockerfile
1. Install `poetry`
    ```
    python -m pip install --upgrade pip
    python -m pip install poetry
    ```
3. Build and install
    ```
    python -m poetry install --with dev
    ```
4. Test things
    ```
    poetry run ruff check
    poetry run ruff format
    poetry run mypy .
    poetry run pytest
    ```

## Develop with Docker
Code development is in a Docker image, use these steps to spin up the image
1. Download and install [Docker](https://docs.docker.com/engine/install/)
2. Clone this repository
3. Build the `dev` development image and connect to the container hosting `dev`
    ```
    docker-compose build dev && docker-compose run --rm dev
    ```
4. Edit code either in your local (host) file system or in the container hosting `dev`. Either way, the container will sync the code base. Code must be run in the container hosting `dev`.
5. (Optional) Before pushing changes to `git`, make sure unit and style tests pass in the container
    1. Dev tests with `pre-commit`
        ```
        poetry run ruff check
        poetry run ruff format
        poetry run mypy .
        ```
    2. Unit tests with `pytest`
        ```
        poetry run pytest
        ```
6. Quit the running container. This will also shut down and delete the container
    ```
    exit
    ```

## Updating requirements
1. Use `poetry`
    ```
    poetry update
    ```
2. If using Docker, rebuild the container using the commands above.
    ```
    exit
    ```

## When cloning this template:
1. Change the python version across config files
2. Change the Docker image names
3. Docker GitHub Actions will fail until certain Secrets are uploaded
    1. `REPO_NAME`: The name of the Docker repository
    2. `DOCKERHUB_USERNAME`: The DockerHub username
    3. `DOCKERHUB_TOKEN`: A token for access to the repository
