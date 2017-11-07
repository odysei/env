#!/bin/bash

NCORES="$@"

if [ "${NCORES}" == "" ]; then
    NCORES=1 
fi

./configure --prefix=${INSTALL_LOCATION} \
    --enable-symlinks CPPFLAGS="-P"

make -j ${NCORES}
make install
