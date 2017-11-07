#
# Settings for run_me.sh
#

INSTALL_LOCATION=${HOME}/local

TMUX_ARC_PATH="https://github.com/tmux/tmux/releases/download/2.5/"
TMUX_ARC_NAME="tmux-2.5.tar.gz"
LIBEVENT_ARCH_PATH="https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/"
LIBEVENT_ARCH_NAME="libevent-2.1.8-stable.tar.gz"
NCURSES_ARCH_PATH="ftp://ftp.gnu.org/gnu/ncurses/"
NCURSES_ARCH_NAME="ncurses-6.0.tar.gz"

NCORES=$(nproc)
LOG_FILE=build.log

TMUX_ARC_NAME_=`echo ${TMUX_ARC_NAME} | sed "s:.tar.gz::"`
LIBEVENT_ARCH_NAME_=`echo ${LIBEVENT_ARCH_NAME} | sed "s:.tar.gz::"`
NCURSES_ARCH_NAME_=`echo ${NCURSES_ARCH_NAME} | sed "s:.tar.gz::"`

#
# Historic references
#
# https://sourceforge.net/projects/levent/files/libevent/libevent-2.0/${LIBEVENT_ARCH_NAME}
# https://github.com/libevent/libevent/releases/download/release-2.0.22-stable/libevent-2.0.22-stable.tar.gz
# https://github.com/libevent/libevent/releases/download/release-2.1.8-stable/libevent-2.1.8-stable.tar.gz
# 
# https://github.com/tmux/tmux/releases/download/2.0/tmux-2.0.tar.gz
# https://github.com/tmux/tmux/releases/download/2.5/tmux-2.5.tar.gz
