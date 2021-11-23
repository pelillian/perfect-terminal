#!/usr/bin/env bash

source setup_common.sh

# Remove trash can from desktop
gsettings set org.gnome.nautilus.desktop trash-icon-visible false

# Perfect GNOME dock
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock autohide true
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock multi-monitor true
gsettings set org.gnome.desktop.background show-desktop-icons false

sudo apt install -y htop tree libncursesw5-dev pkg-config
mkdir -p ~/git/term
cd ~/git/term
git clone https://github.com/mawww/kakoune.git
cd kakoune
make || make -stdlib=libc++
PREFIX=$HOME/.local make install || (PREFIX=$HOME/.local make install -stdlib=libc++ && PREFIX=$HOME/.local make install)
cd ~/git/term

git clone https://github.com/ranger/ranger
cd ranger
sudo make install
mkdir -p ~/.config/ranger/
mv ~/.config/ranger/rc.conf ~/.config/ranger/rc.conf.old
ln -s ~/git/perfect-terminal/rc.conf ~/.config/ranger/rc.conf
git clone https://github.com/alfunx/ranger-colorschemes ~/.config/ranger/colorschemes/
cd

# Case-insensitive tab completion
echo 'set completion-ignore-case On' | sudo tee -a /etc/inputrc

sudo apt-get install -y software-properties-common
sudo add-apt-repository ppa:jgmath2000/et
sudo apt-get update
sudo apt-get install et
