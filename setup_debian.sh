sudo apt update
mkdir -p ~/.config/kak/
ln -s ~/git/perfect-terminal/kakrc ~/.config/kak/kakrc
ln -s ~/git/perfect-terminal/.tmux.conf ~/.tmux.conf
ln -s ~/git/perfect-terminal/.inputrc ~/.inputrc
touch ~/.bashrc
cat ~/git/perfect-terminal/append.bashrc >> ~/.bashrc

sudo apt install -y htop tree kakoune tmux
echo 'set completion-ignore-case On' | sudo tee -a /etc/inputrc
