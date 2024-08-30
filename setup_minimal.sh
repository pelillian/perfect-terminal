mkdir -p ~/.config/helix/
ln -s ~/git/perfect-terminal/helix.config.toml ~/.config/helix/config.toml
ln -s ~/git/perfect-terminal/.tmux.conf ~/.tmux.conf
ln -s ~/git/perfect-terminal/.inputrc ~/.inputrc
touch ~/.bashrc
cat ~/git/perfect-terminal/append.bashrc >> ~/.bashrc

echo 'set completion-ignore-case On' | sudo tee -a /etc/inputrc
sudo apt install -y htop tree tmux
