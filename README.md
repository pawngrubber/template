This repository is a template for future repositories.  Features:
- Can be packaged with `pip`
- Working `pytest` tests in `tests` directory
- Install with `requirements/prod.txt` and `requirements/dev.txt`
- Environment installed inside a Docker Container
- `README.md` file with repeatable instructions
- Style checks using `flake8`, `mypy`, and `black` bundled into a single `pre-commit` action
- GitHub Actions automates style and unit tests across matrixed Python versions
- Uses Python 3.10 because stable [TensorFlow](https://www.tensorflow.org/install/pip) doesn't yet support Python 3.11

## Develop without Docker
1. Create a new Python virtual environment, make sure the version matches the Dockerfile
2. In this virtual environment, install necessary requirements files
    ```
    python -m pip install -r requirements/dev.txt
    python -m pip install -r requirements/prod.txt
    ```
3. Build and install
    ```
    python -m build
    python -m pip install -e . --no-deps
    ```
4. Test things
    ```
    pre-commit run --all-files
    pytest
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
    1. Style tests with `pre-commit`
        ```
        pre-commit run --all-files
        ```
    2. Unit tests with `pytest`
        ```
        pytest
        ```
6. Quit the running container. This will also shut down and delete the container
    ```
    exit
    ```

## Updating requirements directory
1. Use pip-compile to build a new pinned requirements file.
    ```
    pip-compile requirements/prod.in --output-file=requirements/prod.txt
    pip-compile requirements/dev.in --output-file=requirements/dev.txt
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
