#!/usr/bin/env bash

source setup_common.sh

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "set completion-ignore-case On" >> ~/.inputrc
echo "set editing-mode vi" >> ~/.editrc
echo "bind "^R" em-inc-search-prev" >> ~/.editrc
echo "set completion-ignore-case On" >> ~/.editrc
defaults write NSGlobalDomain KeyRepeat -int 1

