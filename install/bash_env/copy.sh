#!/bin/bash

PARENT_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")"; pwd -P)

cp ${PARENT_PATH}/../../.bash/rc \
    ${HOME}/.bash/

cp ${PARENT_PATH}/../../.bash/environment_ssha \
    ${HOME}/.bash/

cp ${PARENT_PATH}/../../.bash/tmux \
    ${HOME}/.bash/
