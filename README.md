This repository is a template for future repositories.  Features:
- Can be packaged with `pip`
- Working `pytest` tests in `tests` directory
- Install with `requirements.txt` and `requirements-dev.txt`
- Anaconda environment prepared with `environment.yml`
- `README.md` file with repeatable instructions
- Style checks using `flake8`, `mypy`, and `black` bundled into a single `pre-commit` action
- GitHub Actions automates style and unit tests across matrixed Python versions
- Uses Python 3.9 (because stable [TensorFlow](https://www.tensorflow.org/install/pip) doesn't yet support Python 3.10)

## Create virtual environment with Anaconda
1. Install [Anaconda](https://docs.anaconda.com/anaconda/install/index.html)
2. Run in an Anaconda Prompt (as administrator) to update Anaconda:
   ```
   conda update anaconda
   conda update --all
   ```
3. Create an [Anaconda Environment](https://docs.conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html):
   ```
   conda env create -f environment.yml --force
   ```
4. When developing, open a fresh Anaconda Prompt and activate the environment with `conda activate template`

## Build and Install
1. Upgrade pip
    ```
    python -m pip install --upgrade pip
    ```
2. Install requirements
    ```
    python -m pip install -r requirements.txt
    ```
3. Build
    ```
    python -m pip install --upgrade build
    python -m build
    python -m pip install -e . --no-deps
    ```

## Set up style and unit tests
1. Install style/unit test requirements
    ```
    python -m pip install -r requirements-dev.txt
    ```
2. Periodically check style and formatting
    ```
    pre-commit run --all-files
    ```
3. Periodically run unit tests (from the base directory)
    ```
    pytest
    ```
