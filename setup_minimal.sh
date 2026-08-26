#!/usr/bin/env bash

mkdir -p ~/.config/helix/
mkdir -p ~/.config/zellij/layouts/
mkdir -p ~/.pi/agent/bin/
ln -s ~/git/perfect-terminal/helix.config.toml ~/.config/helix/config.toml
# zellij rewrites its config in place on auto-migration, so COPY (don't
# symlink) to keep the repo files clean.
cp ~/git/perfect-terminal/zellij.config.kdl ~/.config/zellij/config.kdl
cp ~/git/perfect-terminal/zellij.layout.kdl ~/.config/zellij/layouts/compact-top.kdl
ln -s ~/git/perfect-terminal/.tmux.conf ~/.tmux.conf
ln -s ~/git/perfect-terminal/.inputrc ~/.inputrc
if [ -e ~/.pi/agent/settings.json ] && [ ! -L ~/.pi/agent/settings.json ]; then
  mv ~/.pi/agent/settings.json ~/.pi/agent/settings.json.old
fi
ln -sfn ~/git/perfect-terminal/pi-settings.json ~/.pi/agent/settings.json
ln -sfn ~/git/perfect-terminal/bin/pi-git ~/.pi/agent/bin/git
touch ~/.bashrc
cat ~/git/perfect-terminal/append.bashrc >> ~/.bashrc

echo 'set completion-ignore-case On' | sudo tee -a /etc/inputrc
sudo apt install -y htop tree tmux
