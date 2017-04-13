#!/bin/bash
#
# The script install emacs in Ubuntu16.04!
#
# Author Mephis Pheies
# Email mephistommm@gmail.com

add-apt-repository ppa:kelleyk/emacs
apt-get update
apt-get install emacs25

if [ -e ~/.emacs.d ]; then
    rm -rf ~/.emacs.d
fi
if [ -e ~/.emacs ]; then
    rm -rf ~/.emacs
fi

git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

${PWD%/scripts}/scripts/link_spacemacs.sh
