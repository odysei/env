#!/bin/bash

mkdir -p ${HOME}/.bash

rm ${HOME}/.bashrc
rm ${HOME}/.bash_profile

ln -s ${HOME}/.bash/rc ${HOME}/.bashrc
ln -s ${HOME}/.bash/rc ${HOME}/.bash_profile
