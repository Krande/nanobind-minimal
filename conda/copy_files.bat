@echo off

python -m pip install . -v --no-build-isolation --no-deps --ignore-installed --no-cache-dir

REM Adjust the source and target directories according to your project structure
SET SRC_DIR=%SRC_DIR%\cmake\build\%PY_VER%-%PY_TAGS%-%PLATFORM%\platlib\%PACKAGE_NAME%
SET TARGET_DIR=%PREFIX%\Lib\site-packages\%PACKAGE_NAME%

IF NOT EXIST "%TARGET_DIR%" (
    mkdir "%TARGET_DIR%"
)

xcopy /E /Y /I "%SRC_DIR%" "%TARGET_DIR%"
