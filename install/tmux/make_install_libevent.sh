#!/bin/bash

NCORES="$@"

if [ "${NCORES}" == "" ]; then
    NCORES=1
fi

./configure --prefix=${INSTALL_LOCATION}

make -j ${NCORES}
make install
