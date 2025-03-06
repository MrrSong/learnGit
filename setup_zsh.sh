#!/bin/bash

# 确保脚本在 Ubuntu 系统上运行
if [[ "$(lsb_release -is)" != "Ubuntu" ]]; then
    echo "这个脚本仅适用于 Ubuntu 系统。"
    exit 1
fi

# 更新软件源并升级现有软件包
sudo apt update && sudo apt upgrade -y

# 安装 zsh、git 和 curl
sudo apt install zsh git curl wget -y

# 切换默认 shell 到 zsh
chsh -s /bin/zsh

# 安装 Oh My Zsh
sh -c "$(curl -fsSL https://install.ohmyz.sh)"

# 下载 haoomz.zsh-theme 主题到 Oh My Zsh 的自定义主题目录
ZSH_CUSTOM=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}
wget -O $ZSH_CUSTOM/themes/haoomz.zsh-theme https://cdn.haoyep.com/gh/leegical/Blog_img/zsh/haoomz.zsh-theme

# 克隆 zsh-autosuggestions 插件到 Oh My Zsh 的自定义插件目录
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

# 克隆 zsh-syntax-highlighting 插件到 Oh My Zsh 的自定义插件目录
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# 更新 .zshrc 文件以使用新主题和插件
sed -i 's/ZSH_THEME=".*"/ZSH_THEME="haoomz"/' ~/.zshrc
sed -i 's/plugins=(.*)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc

# 重新加载 .zshrc 文件
source ~/.zshrc

echo "Zsh 设置完成！请重启你的终端以应用更改。"
