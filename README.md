Code is built in python 3.9, install python3.9 before continuing.  If you use `anaconda` then jump to the `Install python via anaconda` section at the bottom before completing these steps.  

## Build this package
1. Upgrade pip and build
    ```
    python -m pip install --upgrade pip
    python -m pip install --upgrade build
    ```
2. Navigate to the base directory and build, install requirements, and install package
    ```
    python -m build
    python -m pip install -r requirements.txt
    python -m pip install -e . --no-deps
    ```

## Check style and unit tests
1. Navigate to the base directory and install requirements for code style and formatting
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
4. NOTE: you can automatically install available `mypy` types with:
    ```
    mypy --install-types
    ```


## Install python via anaconda
1. Install anaconda https://docs.anaconda.com/anaconda/install/index.html
2. Update `anaconda`: Open an anaconda prompt as administrator (only this step requires admin privileges) and execute the following commands:
   ```
   conda update anaconda
   conda update --all
   ```
3. Navigate to the base directory and run the following to create a new `conda` environment named `template`.  WARNING: This will overwrite any previous `template` environment you have on your system:
   ```
   conda env create -f environment.yml --force
   ```
4. Activate the environment
   ```
   conda activate template
   ```
5. When you are done, deactivate the environment
   ```
   conda deactivate
   ```
