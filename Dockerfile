#!/bin/bash

# 更新系统包列表并安装 zsh
sudo apt update
sudo apt install -y zsh wget git

# 安装 Oh My Zsh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

# 设置默认终端为 zsh
chsh -s $(which zsh)

# 下载 haoomz 主题
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
sudo wget -O $ZSH_CUSTOM/themes/haoomz.zsh-theme https://cdn.haoyep.com/gh/leegical/Blog_img/zsh/haoomz.zsh-theme

# 设置主题为 haoomz
sed -i 's/^ZSH_THEME=".*"/ZSH_THEME="haoomz"/' ~/.zshrc

# 安装 zsh-autosuggestions 插件
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# 安装 zsh-syntax-highlighting 插件
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# 启用插件
sed -i 's/^plugins=(\(.*\))/plugins=(\1 zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc

# 应用更改
source ~/.zshrc

echo "Oh My Zsh 已成功安装并配置！请重新启动终端以应用更改。"
