This repository is a template for future repositories.  Features:
- Can be packaged with `pip`
- Working `pytest` tests in `tests` directory
- Install with `requirements.txt` and `requirements-dev.txt`
- environment installed inside a Docker Container
- `README.md` file with repeatable instructions
- Style checks using `flake8`, `mypy`, and `black` bundled into a single `pre-commit` action
- GitHub Actions automates style and unit tests across matrixed Python versions
- Uses Python 3.10 because stable [TensorFlow](https://www.tensorflow.org/install/pip) doesn't yet support Python 3.11

## Develop in Docker
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
