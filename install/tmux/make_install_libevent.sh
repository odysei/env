#!/bin/bash

NCORES="$@"

if [ "${NCORES}" == "" ]; then
    NCORES=1
fi

# ./configure --prefix=${INSTALL_LOCATION} # legacy versions
rm -rf build
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=${INSTALL_LOCATION} ..

make -j ${NCORES}
make install
