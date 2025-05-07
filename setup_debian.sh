#!/usr/bin/env bash

sudo apt update
mkdir -p ~/.config/kak/
ln -s ~/git/perfect-terminal/kakrc ~/.config/kak/kakrc
ln -s ~/git/perfect-terminal/.tmux.conf ~/.tmux.conf
ln -s ~/git/perfect-terminal/.inputrc ~/.inputrc
touch ~/.bashrc
cat ~/git/perfect-terminal/append.bashrc >> ~/.bashrc

sudo apt install -y htop tree kakoune tmux
echo 'set completion-ignore-case On' | sudo tee -a /etc/inputrc

echo "deb https://mistertea.github.io/debian-et/debian-source/ bullseye main" | sudo tee /etc/apt/sources.list.d/et.list
curl -sS https://mistertea.github.io/debian-et/et.gpg | sudo apt-key add -
sudo apt update
sudo apt install et
