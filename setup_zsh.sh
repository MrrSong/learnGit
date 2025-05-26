#!/bin/bash

# 更新系统并安装必要工具
sudo apt update && sudo apt upgrade -y
sudo apt install -y zsh git curl wget

# 切换默认 shell 为 zsh（仅当当前 shell 不是 zsh 时）
if [ "$SHELL" != "/bin/zsh" ]; then
  chsh -s /bin/zsh
fi

# 安装 Oh My Zsh（如果未安装）
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://install.ohmyz.sh)"
fi

# 下载自定义主题（确保 ZSH_CUSTOM 存在）
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
mkdir -p "$ZSH_CUSTOM/themes"
wget -O "$ZSH_CUSTOM/themes/haoomz.zsh-theme" https://cdn.haoyep.com/gh/leegical/Blog_img/zsh/haoomz.zsh-theme

# 安装插件：zsh-autosuggestions
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

# 安装插件：zsh-syntax-highlighting
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

# 替换 .zshrc 中的主题与插件设置
sed -i 's|^ZSH_THEME=".*"|ZSH_THEME="haoomz"|' "$HOME/.zshrc"
sed -i 's|^plugins=(.*)|plugins=(git zsh-autosuggestions zsh-syntax-highlighting)|' "$HOME/.zshrc"

# 重启 zsh 环境
exec zsh
