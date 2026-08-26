#!/usr/bin/env bash

cd
mkdir -p ~/.config/kak/
mkdir -p ~/.config/zellij/layouts/
mkdir -p ~/.pi/agent/bin/
mv ~/.config/kak/kakrc ~/.config/kak/kakrc.old
mv ~/.config/zellij/config.kdl ~/.config/zellij/config.kdl.old
mv ~/.config/zellij/layouts/compact-top.kdl ~/.config/zellij/layouts/compact-top.kdl.old
mv ~/.zshrc ~/.zshrc.old
mv ~/.tmux.conf ~/.tmux.conf.old
mv ~/.inputrc ~/.inputrc.old
ln -s ~/git/perfect-terminal/kakrc ~/.config/kak/kakrc
# zellij rewrites its config in place on auto-migration, so COPY (don't
# symlink) to keep the repo files clean.
cp ~/git/perfect-terminal/zellij.config.kdl ~/.config/zellij/config.kdl
cp ~/git/perfect-terminal/zellij.layout.kdl ~/.config/zellij/layouts/compact-top.kdl
ln -s ~/git/perfect-terminal/.zshrc ~/.zshrc
ln -s ~/git/perfect-terminal/.tmux.conf ~/.tmux.conf
ln -s ~/git/perfect-terminal/.inputrc ~/.inputrc
if [ -e ~/.pi/agent/settings.json ] && [ ! -L ~/.pi/agent/settings.json ]; then
  mv ~/.pi/agent/settings.json ~/.pi/agent/settings.json.old
fi
ln -sfn ~/git/perfect-terminal/pi-settings.json ~/.pi/agent/settings.json
ln -sfn ~/git/perfect-terminal/bin/pi-git ~/.pi/agent/bin/git

# Add our custom bashrc append
cat ~/git/perfect-terminal/append.bashrc >> ~/.bashrc
. ~/.bashrc

cd
