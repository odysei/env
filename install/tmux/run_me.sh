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
    return 1
fi

#
#   Functions
#
Download_src_libevent()
{
    if [ ! -f ${LIBEVENT_ARCH_NAME} ]; then
        wget ${LIBEVENT_ARCH_PATH}/${LIBEVENT_ARCH_NAME}
    fi
}

Download_src_ncurses()
{
    if [ ! -f ${NCURSES_ARCH_NAME} ]; then
        wget ${NCURSES_ARCH_PATH}/${NCURSES_ARCH_NAME}
    fi
}

Download_src_tmux()
{
    if [ ! -f ${TMUX_ARC_NAME} ]; then
        wget ${TMUX_ARC_PATH}/${TMUX_ARC_NAME}
    fi
}

Download_src()
{
    echo "Getting the needed archives"
    
    Download_src_libevent
    Download_src_ncurses
    Download_src_tmux
}

Extract_src()
{
    echo "Extracting src"
    echo "Install location: ${INSTALL_LOCATION}"
    
    echo "Creating ${INSTALL_LOCATION}/src"
    mkdir -p ${INSTALL_LOCATION}/src
    
    cd ${INSTALL_LOCATION}/src

    # extract inside of target src/
    tar -xf ${CURRENT_DIR}/${LIBEVENT_ARCH_NAME}
    tar -xf ${CURRENT_DIR}/${NCURSES_ARCH_NAME}
    tar -xf ${CURRENT_DIR}/${TMUX_ARC_NAME}

    if [ ! -e ${NCURSES_ARCH_NAME_} ]; then
        echo "Whoops! Made for ${NCURSES_ARCH_NAME_}. Update run_me_sett.sh!"
        cd ${CURRENT_DIR}
        return 1
    fi
    cd ${CURRENT_DIR}
}

Build_install_libevent()
{
    cd ${INSTALL_LOCATION}/src/${LIBEVENT_ARCH_NAME_}
    
    bash ${PARENT_PATH}/make_install_libevent.sh ${NCORES} >> \
        ${CURRENT_DIR}/${LOG_FILE} 2>&1
    if [ ! $? -eq 0 ]; then
        echo -e "Build error in ${LIBEVENT_ARCH_NAME_}. See ${LOG_FILE}"
        cd ${CURRENT_DIR}
        return 1
    fi
    
    cd ${CURRENT_DIR}
}

Build_install_ncurses()
{
    cd ${INSTALL_LOCATION}/src/${NCURSES_ARCH_NAME_}

    bash ${PARENT_PATH}/make_install_ncurses.sh ${NCORES} >> \
        ${CURRENT_DIR}/${LOG_FILE} 2>&1
    if [ ! $? -eq 0 ]; then
        echo -e "Build error in ${NCURSES_ARCH_NAME_}. See ${LOG_FILE}"
        cd ${CURRENT_DIR}
        return 1
    fi
    
    cd ${CURRENT_DIR}
}

Build_install_tmux()
{
    cd ${INSTALL_LOCATION}/src/${TMUX_ARC_NAME_}

    bash ${PARENT_PATH}/make_install_tmux.sh ${NCORES} >> \
        ${CURRENT_DIR}/${LOG_FILE} 2>&1
    if [ ! $? -eq 0 ]; then
        echo -e "Build error in ${TMUX_ARC_NAME_}. See ${LOG_FILE}"
        cd ${CURRENT_DIR}
        return 1
    fi
    
    cd ${CURRENT_DIR}
}

Build_install()
{
    echo "Building stuff (log file: ${LOG_FILE})"
    
    Build_install_libevent
    Build_install_ncurses
    Build_install_tmux
}


#
#   Execution part
#
Download_src
Extract_src
Build_install
echo "Done!"
