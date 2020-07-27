#!/bin/sh

JudgeZshrcExist(){
    [[ ! -f ~/.zshrc ]] || mv ~/.zshrc ~/.zshrc_back
    # if [ ! -d "~/.zshrc" ]; then
    #     mv -f ~/.zshrc ~/.zshrc_back
    # fi
}

InstallZsh(){
    echo "installing..."
    if which apt-get >/dev/null; then
        sudo apt-get update -y && sudo apt-get install -y zsh git
    elif which brew >/dev/null;then
        brew install zsh git
    elif which yum >/dev/null;then
        sudo yum install zsh git -y
    elif which pacman >/dev/null;then
        sudo pacman -S zsh git
    else
        echo "Does not support system version"
    fi
}

InstallOhMyZsh(){
    git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
    chsh -s $(which zsh)
}

InstallThemesPlugins(){
    git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
}

WriteZshrc(){
    wget https://raw.githubusercontent.com/formateddd/questions/master/environment/zshrc ~/.zshrc
}

JudgeZshrcExist
InstallZsh
InstallOhMyZsh
InstallThemesPlugins
WriteZshrc

echo "edit ~/.oh-my-zsh/themes/Schminitz.zsh-themes to update themes"
echo "finish ! logout and relogin"
