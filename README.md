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
1. Start `dev` development image and container. Conveniently also builds `dev` if it doesn't already exist.
    ```
    docker-compose -f docker-compose-dev.yml up --detach
    ```
2. Connect to the container hosting the `dev` image
    ```
    docker exec -it template_dev_container /bin/sh
    ```
3. Build the projects for imports. Only needs to be run the first time the container is created.
    ```
    python -m pip install --upgrade build
    python -m build
    python -m pip install -e . --no-deps
    ```
4. Initialize `pre-commit`. Only needs to be run the first time the container is created.
    ```
    pre-commit run --all-files
    ```
5. Edit the code base either in the container hosting `dev` or outside of the container. The container will sync the code base. Run the code in the container hosting `dev` as needed.
6. Quit the running container
    ```
    exit
    ```
7. Shut down the container without deleting the container (to avoid repeating steps 3 and 4).
    ```
    docker-compose -f docker-compose-dev.yml stop
    ```

## TODO:
* Update `mypy.ini`
