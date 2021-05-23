#!/usr/bin/env bash

cd
mv ~/.vim ~/.vim-old
mv ~/.vimrc ~/.vimrc.old
mv ~/.zshrc ~/.zshrc.old
mv ~/.tmux.conf ~/.tmux.conf.old
mv ~/.inputrc ~/.inputrc.old
ln -s ~/git/perfect-terminal/.vim ~/.vim
ln -s ~/git/perfect-terminal/.vimrc ~/.vimrc
ln -s ~/git/perfect-terminal/.zshrc ~/.zshrc
ln -s ~/git/perfect-terminal/.tmux.conf ~/.tmux.conf
ln -s ~/git/perfect-terminal/.inputrc ~/.inputrc

echo 'source ~/.vimrc' >> ~/.ideavimrc

cd ~/git/perfect-terminal/
git config submodule.recurse true
git submodule update --init

# Add our custom bashrc append
cat ~/git/perfect-terminal/append.bashrc >> ~/.bashrc
. ~/.bashrc

cd
