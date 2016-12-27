#!/bin/bash
#
# link spacemacs and private dir to ~/.spacemacs and ~/.emacs.d/private
# usage for mac:
#   ./link_spacemacs.sh
# usage for linux:
#   ./link_spacemacs.sh linux
#
# Author Mephis Pheies
# Email mephistommm@gmail.com

PRIVATE_PATH=~/.emacs.d/private
SPACEMACS_PATH=~/.spacemacs

SPACEMACS_FILE=spacemacs
PRIVATE_DIR=private

if [ "$1" == "linux" ]; then
    SPACEMACS_FILE=spacemacs-linux
fi

if [ -e $PRIVATE_PATH ]; then
    rm -rf $PRIVATE_PATH
fi

if [ -e $SPACEMACS_PATH ]; then
    rm -rf $SPACEMACS_PATH
fi

ln -s ${PWD%/scripts}/$SPACEMACS_FILE $SPACEMACS_PATH
ln -s ${PWD%/scripts}/$PRIVATE_DIR $PRIVATE_PATH
