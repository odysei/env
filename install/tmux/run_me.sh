#!/bin/bash

CURRENT_DIR=${PWD}
PARENT_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")"; pwd -P)

. ${PARENT_PATH}/run_me_sett.sh

#
#   Prerequisites
#
if [ ! -f ${PARENT_PATH}/make_install_libevent.sh ] && \
   [ ! -f ${PARENT_PATH}/make_install_ncurses.sh ] && \
   [ ! -f ${PARENT_PATH}/make_install_tmux.sh ]; then
    echo "Helper scripts not found!"
    return
fi

#
#   Functions
#
Download_src()
{
    echo "Getting the needed archives"
    if [ ! -f ${LIBEVENT_ARCH_NAME} ]; then
        wget ${LIBEVENT_ARCH_PATH}/${LIBEVENT_ARCH_NAME}
    fi

    if [ ! -f ${NCURSES_ARCH_NAME} ]; then
        wget ${NCURSES_ARCH_PATH}/${NCURSES_ARCH_NAME}
    fi 

    if [ ! -f ${TMUX_ARC_NAME} ]; then
        wget ${TMUX_ARC_PATH}/${TMUX_ARC_NAME}
    fi
}

Extract_src()
{
    echo "Extracting src"
    echo "Install location: ${INSTALL_LOCATION}"
    mkdir -p ${INSTALL_LOCATION}/src
    echo ${INSTALL_LOCATION}/src
    cd ${INSTALL_LOCATION}/src

    tar -xf ${CURRENT_DIR}/${LIBEVENT_ARCH_NAME}
    tar -xf ${CURRENT_DIR}/${NCURSES_ARCH_NAME}
    tar -xf ${CURRENT_DIR}/${TMUX_ARC_NAME}

    if [ ! -e ${NCURSES_ARCH_NAME_} ]; then
        echo "Whoops! Made for ${NCURSES_ARCH_NAME_}. Update run_me_sett.sh!"
        cd ${CURRENT_DIR}
        return
    fi
}

Build_install()
{
    echo "Building stuff (log file: ${LOG_FILE})"
    cd ${INSTALL_LOCATION}/src
    
    cd ${LIBEVENT_ARCH_NAME_}
    . ${PARENT_PATH}/make_install_libevent.sh ${NCORES} >> \
        ${CURRENT_DIR}/${LOG_FILE} 2>&1
    if [ ! $? -eq 0 ]; then
        echo -e "Build error in ${LIBEVENT_ARCH_NAME_}. See ${LOG_FILE}"
        cd ${CURRENT_DIR}
        return 1
    fi

    cd ../${NCURSES_ARCH_NAME_}
    . ${PARENT_PATH}/make_install_ncurses.sh ${NCORES} >> \
        ${CURRENT_DIR}/${LOG_FILE} 2>&1
    if [ ! $? -eq 0 ]; then
        echo -e "Build error in ${NCURSES_ARCH_NAME_}. See ${LOG_FILE}"
        cd ${CURRENT_DIR}
        return 1
    fi

    cd ${TMUX_ARC_NAME_}
    cd ../${TMUX_ARC_NAME_}
    . ${PARENT_PATH}/make_install_tmux.sh ${NCORES} >> \
        ${CURRENT_DIR}/${LOG_FILE} 2>&1
    if [ ! $? -eq 0 ]; then
        echo -e "Build error in ${TMUX_ARC_NAME_}. See ${LOG_FILE}"
        cd ${CURRENT_DIR}
        return 1
    fi

    cd ${CURRENT_DIR}
}


#
#   Execution part
#
Download_src
Extract_src
Build_install
echo "Done!"
