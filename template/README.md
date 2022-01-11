Code is built in python 3.9, install python3.9 before continuing.  If you use `anaconda` then jump to the `Install python via anaconda` section at the bottom before completing these steps.  

## Build this package
1. Navigate to the base directory `path/to/repository/projects/template`
2. Make sure you have the latest version of PyPA's build installed
    ```
    python -m pip install --upgrade build
    ```
3. Build
    ```
    python -m build
    ```
4. Install
    ```
    python -m pip install -e . --no-deps
    ```

## Do things
1. (Optional) Install tensorflow GPU support https://www.tensorflow.org/install/gpu
2. Upgrade pip before continuing:
    ```
    python -m pip install --upgrade pip
    ```
3. Navigate to the base directory `path/to/repository/template/template` and install requirements
    ```
    python -m pip install -r requirements.txt
    ```

## Check style and unit tests
1. Navigate to the base directory `path/to/repository/template/template` and install requirements for code style and formatting
    ```
    python -m pip install -r requirements-dev.txt
    ```
2. Periodically check style and formatting
    ```
    pre-commit run --all-files
    ```
3. Periodically run unit tests from the base directory
    ```
    python -m unittest discover -v
    ```

## Install python via anaconda
If you have anaconda installed on your system, these are the steps to setup python within anaconda for this project.

1. Install anaconda https://docs.anaconda.com/anaconda/install/index.html
2. Update `anaconda`: Open an anaconda prompt as administrator (only this step requires admin privileges) and execute the following commands:
   ```
   conda update anaconda
   conda update --all
   ```
3. Navigate to the base directory `path/to/repository/template/template`
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
