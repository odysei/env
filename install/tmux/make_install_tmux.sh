#!/bin/bash

NCORES="$@"

if [ "${NCORES}" == "" ]; then
    NCORES=1
fi

./configure --prefix=${INSTALL_LOCATION} \
    LDFLAGS="-L ${INSTALL_LOCATION}/lib" \
    CPPFLAGS="-I ${INSTALL_LOCATION}/include \
              -I ${INSTALL_LOCATION}/include/ncurses"

make -j ${NCORES}
make install
