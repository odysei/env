#!/bin/bash

PARENT_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")"; pwd -P)

ln -s `readlink -f ${PARENT_PATH}/../../.bash/rc` \
    ${HOME}/.bash/rc

ln -s `readlink -f ${PARENT_PATH}/../../.bash/environment_ssha` \
    ${HOME}/.bash/environment_ssha

ln -s `readlink -f ${PARENT_PATH}/../../.bash/tmux` \
    ${HOME}/.bash/tmux
