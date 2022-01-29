Code is built in python 3.8, install python3.8 before continuing.  If you use `anaconda` then jump to the `Install python via anaconda` section at the bottom before completing these steps.  

## Build this package
1. Upgrade pip
    ```
    python -m pip install --upgrade pip
    ```
2. Navigate to the base directory
3. Make sure you have the latest version of PyPA's build installed
    ```
    python -m pip install --upgrade build
    ```
4. Build
    ```
    python -m build
    ```
5. Install requirements
    ```
    python -m pip install -r requirements.txt
    ```
6. Install package
    ```
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
3. Periodically run unit tests from the base directory
    ```
    pytest
    ```

## Install python via anaconda
If you have anaconda installed on your system, these are the steps to setup python within anaconda for this project.

1. Install anaconda https://docs.anaconda.com/anaconda/install/index.html
2. Update `anaconda`: Open an anaconda prompt as administrator (only this step requires admin privileges) and execute the following commands:
   ```
   conda update anaconda
   conda update --all
   ```
3. Navigate to the base directory
4. The following command will create a new `conda` environment named `template`.  WARNING: This will overwrite any previous `template` environment you have on your system:
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
6. NOTE: When using `anaconda`, ALL `pip ...` commands should be replaced with `python -m pip ...`
