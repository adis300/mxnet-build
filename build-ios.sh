#!/bin/bash
./build-mxnet.sh

AMALGAMATION_PATH=mxnet/amalgamation
SOURCE_FNAME=mxnet_predict-all.cc
BKUP_FNAME=${SOURCE_FNAME}.original

cd "${AMALGAMATION_PATH}"
echo Path changed
make

#cp ${SOURCE_FNAME} ${BKUP_FNAME}

#cd ../..

#python ios_adapt.py

#cd ${AMALGAMATION_PATH}
#make
#rm -f ${SOURCE_FNAME}
#mv ${BKUP_FNAME} ${SOURCE_FNAME}
