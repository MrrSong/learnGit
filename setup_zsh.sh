#!/bin/bash
sudo apt update && sudo apt upgrade -y
sudo apt install zsh git curl wget -y
chsh -s /bin/zsh
sh -c "$(curl -fsSL https://install.ohmyz.sh)"
sudo wget -O $ZSH_CUSTOM/themes/haoomz.zsh-theme https://cdn.haoyep.com/gh/leegical/Blog_img/zsh/haoomz.zsh-theme
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
sed -i 's/ZSH_THEME=".*"/ZSH_THEME="haoomz"/' ~/.zshrc
sed -i 's/plugins=(.*)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc
exec zsh
