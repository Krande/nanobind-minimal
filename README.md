# NanoBind Minimal Example

A minimal example of wrapping c++ code with python using [NanoBind](https://nanobind.readthedocs.io/en/latest/).
The python project shall only use pyproject.toml and will use
[scikit-build-core](https://github.com/scikit-build/scikit-build-core) as a build system.

The example should cover the following:

- [x] Minimal C++ code example
- [x] Minimal Python wrapper example using `NanoBind`
- [x] Minimal `pyproject.toml` file
- [x] Minimal `CMakeLists.txt` file
- [x] Build system using `scikit-build-core`
- [x] Build and test code in a `mambabuild` package compilation (so that it can easily be uploaded to conda)

## Installing Development Setup

First install the pre-requisites for `nanobind` and `scikit-build-core` build requirements from conda-forge.

```bash
mamba env update -f environment.yml --prune
```

If you are using CLION and want to get type hints from the c++ packages in your conda environment, 
I recommend creating a batch files to set the environment variables and use that as an environment file. 
See Build, Execution, Deployment > Toolchains -> Add Environment -> Environment file. 

Here is an example of a `setup.bat` file that I use to set the environment variables for CLION.

    :: setup.bat
    @echo off
    
    :: mamba env update -f environment.yml --prune
    :: mamba activate nano-occt
    
    set CMAKE_PREFIX_PATH=<path_to_conda_env>
    set CMAKE_INSTALL_PREFIX=%CMAKE_PREFIX_PATH%
    set OpenCASCADE_DIR=%CMAKE_PREFIX_PATH%/Library/lib/cmake/opencascade
    set OpenCASCADE_INCLUDE_DIR=%CMAKE_PREFIX_PATH%/Library/include/opencascade
    set Python_EXECUTABLE=%CMAKE_PREFIX_PATH%/python.exe
    set PYTHON_INCLUDE_DIR=%CMAKE_PREFIX_PATH%/include
    set PYTHON_LIBRARY=%CMAKE_PREFIX_PATH%/Library
    set LIBRARY_PREFIX=%CMAKE_PREFIX_PATH%/Library


## Locally compile the python package

### Fast (editable) install

Activate the `nano-min` environment and install the package in editable mode and build packages
located in the current env (much faster, but at the expense of no type hints for your IDE).

```bash
pip install --no-build-isolation -ve.
```

### Slow (non-editable) install

Build the package and install it in the current environment.

```bash
pip install -v . --no-deps --ignore-installed
```

### Conda Build install

Installing as conda package

```bash
mamba mambabuild . -c conda-forge --python 3.11 --override-channels
mamba install --use-local nano-min
```