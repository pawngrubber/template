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
1. Start (build if it doesn't exist) `dev` image and container
    ```
    docker-compose -f docker-compose-dev.yml up --detach
    ```
2. Connect to the running container
    ```
    docker exec -it template_dev_container /bin/sh
    ```
3. Build the projects as wheels and install them as editable
    ```
    python -m pip install --upgrade build
    python -m build
    python -m pip install -e . --no-deps
    ```
4. Initialize pre-commit
    ```
    pre-commit run --all-files
    ```
5. Quit the running container
    ```
    exit
    ```
6. Shut down container (without deleting them). If you delete the container you will have to repeat these steps.
    ```
    docker-compose -f docker-compose-dev.yml stop
    ```

## TODO:
* Update `mypy.ini`

* `docker-compose -f docker-compose-dev.yml build`
