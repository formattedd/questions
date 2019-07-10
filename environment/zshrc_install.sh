#!/bin/sh

JudgeZshrcExist(){
    if [ ! -d "~/.zshrc" ]; then
        mv -f ~/.zshrc ~/.zshrc_back
    fi
}

InstallZsh(){
    echo "installing..."
    if which apt-get >/dev/null; then
        sudo apt-get install -y zsh git
    elif which brew >/dev/null;then
        brew install zsh git
    elif which yum >/dev/null;then
        sudo yum install zsh git
    else
        echo "Does not support system version"
    fi
}

InstallOhMyZsh(){
    git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
    chsh -s /bin/zsh
}

InstallThemesPlugins(){
    wget https://raw.githubusercontent.com/formateddd/questions/master/environment/Schminitz.zsh-theme -P ~/.oh-my-zsh/custom/themes/
    git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
}

WriteZshrc(){
    echo "# Path to your oh-my-zsh installation.
    export ZSH=$HOME/.oh-my-zsh

    DISABLE_AUTO_UPDATE="true"

    # See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
    ZSH_THEME='Schminitz'

    # Add wisely, as too many plugins slow down shell startup.
    plugins=(
        zsh-autosuggestions 
        git)

    source \$ZSH/oh-my-zsh.sh

    DISABLE_AUTO_UPDATE='true'

    alias scpr='rsync -Pzv --rsh=ssh'
    alias getpass='openssl rand -base64 20'
    alias www='ifconfig && python -m http.server 8000'
    alias getip='curl ipinfo.io/ip'
    alias setproxy="export ALL_PROXY=socks5://127.0.0.1:1080"
    alias unsetproxy="unset ALL_PROXY"

    # alias gs='gst'

    # alias dp='docker ps -a'
    # alias dk='docker stop \$(docker ps -a -q) && docker rm \$(docker ps -a -q)'
    # alias dr='docker rmi \$(docker images -f "dangling=true" -q)'
    # alias dc='docker-compose'
    # alias di='docker images'
    # alias dir='docker rmi'

    # python virtualenv 
    # source ~/.virtualenv/py3/bin/activate" >  ~/.zshrc
}

JudgeZshrcExist
InstallZsh
InstallOhMyZsh
InstallThemesPlugins
WriteZshrc

echo "finish ! logout and relogin"
