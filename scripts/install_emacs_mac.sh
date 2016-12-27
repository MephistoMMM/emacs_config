#!/bin/bash
#
# The script install emacs in macOS!
#
# Author Mephis Pheies
# Email mephistommm@gmail.com

brew tap d12frosted/emacs-plus
brew install emacs-plus
brew linkapps emacs-plus

if [ -e ~/.emacs.d ]; then
    rm -rf ~/.emacs.d
fi
if [ -e ~/.emacs ]; then
    rm -rf ~/.emacs
fi

git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

${PWD%/scripts}/scripts/link_spacemacs.sh
