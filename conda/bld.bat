@echo off

REM Adjust the source and target directories according to your project structure
SET SRC_DIR=%SRC_DIR%\cmake\build\%PY_VER%-%PY_TAGS%-%PLATFORM%\platlib\my_ext
SET TARGET_DIR=%PREFIX%\Lib\site-packages\my_ext

IF NOT EXIST "%TARGET_DIR%" (
    mkdir "%TARGET_DIR%"
)

xcopy /E /Y /I "%SRC_DIR%" "%TARGET_DIR%"
