#!/bin/bash

# Adjust the source and target directories according to your project structure
SRC_DIR="${SRC_DIR}/cmake/build/${PY_VER}-${PY_TAGS}-${PLATFORM}/platlib/my_ext"
TARGET_DIR="${PREFIX}/lib/python${PY_VER}/site-packages/my_ext"

mkdir -p "${TARGET_DIR}"
cp -r "${SRC_DIR}"/* "${TARGET_DIR}"
