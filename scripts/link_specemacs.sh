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

# * Destination
PRIVATE_PATH=~/.emacs.d/private
SPACEMACS_PATH=~/.spacemacs
LATEXMK_PATH=~/.latexmkrc

# * Source
SPACEMACS_FILE=spacemacs
PRIVATE_DIR=private
LATEXMK_FILE=latexmkrc

# * Root Dir
CONF_ROOT=${PWD%/scripts}

# * Check Files Exist And Delete

if [ "$1" == "linux" ]; then
    SPACEMACS_FILE=spacemacs-linux
fi

if [ -e $PRIVATE_PATH ]; then
    echo "Remove $PRIVATE_PATH"
    rm -rf $PRIVATE_PATH
fi

if [ -e $SPACEMACS_PATH ]; then
    echo "Remove $SPACEMACS_PATH"
    rm -rf $SPACEMACS_PATH
fi

if [ -e $LATEXMK_PATH ]; then
    echo "Remove $LATEXMK_PATH"
    rm -rf $LATEXMK_PATH
fi

# * Create Soft Link

echo "Link $SPACEMACS_FILE to $SPACEMACS_PATH"
ln -s $CONF_ROOT/$SPACEMACS_FILE $SPACEMACS_PATH
echo "Link $PRIVATE_DIR to $PRIVATE_PATH"
ln -s $CONF_ROOT/$PRIVATE_DIR $PRIVATE_PATH
echo "Link $LATEXMK_FILE to $LATEXMK_PATH"
ln -s $CONF_ROOT/$LATEXMK_FILE $LATEXMK_PATH
