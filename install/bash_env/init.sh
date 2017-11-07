#!/bin/bash

mkdir -p ${HOME}/.bash

rm -f ${HOME}/.bashrc
rm -f ${HOME}/.bash_profile

ln -s ${HOME}/.bash/rc ${HOME}/.bashrc
ln -s ${HOME}/.bash/rc ${HOME}/.bash_profile
