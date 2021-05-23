#!/usr/bin/env bash

cd
mkdir -p ~/.config/kak/
mv ~/.config/kak/kakrc ~/.config/kak/kakrc.old
mv ~/.zshrc ~/.zshrc.old
mv ~/.tmux.conf ~/.tmux.conf.old
mv ~/.inputrc ~/.inputrc.old
ln -s ~/git/perfect-terminal/.kakrc ~/.config/kak/kakrc.old
ln -s ~/git/perfect-terminal/.zshrc ~/.zshrc
ln -s ~/git/perfect-terminal/.tmux.conf ~/.tmux.conf
ln -s ~/git/perfect-terminal/.inputrc ~/.inputrc

# Add our custom bashrc append
cat ~/git/perfect-terminal/append.bashrc >> ~/.bashrc
. ~/.bashrc

cd
