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

    @echo off

    :: mamba env update -f environment.build.yml --prune
    :: mamba activate nano-occt
    
    set MY_PY_VER=3.11
    set PREFIX=<path_to_your_conda_env>
    set LIBRARY_PREFIX=%PREFIX%/Library
    set CMAKE_PREFIX_PATH=%PREFIX%;%LIBRARY_PREFIX%/include;%LIBRARY_PREFIX%/lib;%LIBRARY_PREFIX%/bin

    set OpenCASCADE_DIR=%LIBRARY_PREFIX%/lib/cmake/opencascade
    set OpenCASCADE_INCLUDE_DIR=%LIBRARY_PREFIX%/include/opencascade

    set PYTHON_EXECUTABLE=%PREFIX%/python.exe
    set PYTHON_LIBRARY=%PREFIX%/libs/python%MY_PY_VER%.lib

## Locally compile the python package

Open a terminal and navigate to the root directory.
Activate the `nano-min` environment (ie. `mamba activate nano-min`) and install the package using the following command.

```bash
pip install --no-build-isolation . -v
```

This will install the package into the `nano-min` environment and you can use it as you would any other python package.

```python
import my_ext

res = ext.add(1, 2)
print(res)
```

## Conda Build install

Open a terminal and navigate to the root directory.
Activate the `nano-min` environment (ie. `mamba activate nano-min`) and compile the conda package
using the following command.

```bash
mamba mambabuild conda -c conda-forge --python 3.11 --override-channels
mamba install --use-local nano-min
```

## Notes

* If the python stubs are not updated in your IDE during development try uninstalling and reinstalling the package.
