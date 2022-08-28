This repository is a template for future repositories.  Features:
- Can be packaged with `pip`
- Working `pytest` tests in `tests` directory
- Install with `requirements.txt` and `requirements-dev.txt`
- environment installed inside a Docker Container
- `README.md` file with repeatable instructions
- Style checks using `flake8`, `mypy`, and `black` bundled into a single `pre-commit` action
- GitHub Actions automates style and unit tests across matrixed Python versions
- Uses Python 3.10 (because stable [TensorFlow](https://www.tensorflow.org/install/pip) doesn't yet support Python 3.11)

## Develop in Docker
Code development is in a Docker image, use these steps to spin up the image
1. Download and install [Docker](https://docs.docker.com/engine/install/)
2. Build and connect to the `dev` development image
    ```
    docker-compose build dev && docker-compose run --rm dev
    ```
3. Code can be edited either in your local (host) file system or in the container hosting `dev`. Either way, the container will sync the code base. Run the code in the container hosting `dev` as needed during development.

## (Optional) Run unit and style tests
Before pushing changes to `git`, make sure unit tests and style tests pass
1. style tests with `pre-commit`
    ```
    pre-commit run --all-files
    ```
2. Unit tests with `pytest`
    ```
    pytest
    ```

## Stop work for the day
1. Quit the running container
    ```
    exit
    ```
2. Shut down and delete the container
    ```
    docker-compose -f docker-compose-dev.yml down
    ```
