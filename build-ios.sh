#!/bin/bash
# Remove previous build
rm -rf dist/

# Build mxnet in-case anything is not ready
./build-mxnet.sh

# Build amalgamation
AMALGAMATION_PATH=mxnet/amalgamation
SOURCE_FNAME=mxnet_predict-all.cc
BKUP_FNAME=${SOURCE_FNAME}.original

cd "${AMALGAMATION_PATH}"
echo Path changed
make

# Adapt source to iOS
cp ${SOURCE_FNAME} ${BKUP_FNAME}

cd ../..

python ios_adapt.py

cd ${AMALGAMATION_PATH}
make
rm -f ${SOURCE_FNAME}
mv ${BKUP_FNAME} ${SOURCE_FNAME}
cd ../..

LIB_NAME=libmxnet_predict.a
mkdir dist
cp ${AMALGAMATION_PATH}/${LIB_NAME} dist/${LIB_NAME}
