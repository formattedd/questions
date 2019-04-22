#!/bin/bash

# sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

JudgeZshrcExists(){
    if [ ! -d "~/.oh-my-zsh" ]; then
        mv -f ~/.oh-my-zsh ~/oh-my-zsh-old
    fi
    if [ ! -a "~/.zshrc" ]; then
        cp ~/.zshrc ~/.zshrc.orig
    fi
}

InstallGitZsh(){
    echo "installing..."
    if which apt-get >/dev/null; then
        sudo apt-get install -y git zsh
    elif which brew >/dev/null;then
        brew install git zsh
    elif which yum >/dev/null;then
        sudo yum install -y git zsh
    else
        echo "Can not judge system"
    fi
}

DownloadZshrc(){
    git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

    git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

    wget https://raw.githubusercontent.com/formateddd/questions/master/environment/Schminitz.zsh-theme -P ~/.oh-my-zsh/custom/themes
    echo "      Download zsh and plugins finish"
}

UpdateZshrc(){
    echo "
DISABLE_AUTO_UPDATE="true"

# source ~/.virtualenv/py2/bin/activate
source ~/.virtualenv/py3/bin/activate

alias gs='gst'
alias vi='vim'

alias dp='docker ps -a'
alias dk='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'
alias dr='docker rmi $(docker images -f "dangling=true" -q)'
# docker rmi $(docker images | grep "none" | awk '{print $3}')
alias dc='docker-compose'
alias di='docker images'
alias dir='docker rmi'

alias getpass='openssl rand -base64 20'
alias www='python -m http.server 8000'
alias getip='curl ipinfo.io/ip'

function ccat() {
    local style="monokai"
    if [ $# -eq 0 ]; then
        pygmentize -P style=$style -P tabsize=4 -f terminal256 -g
    else
        for NAME in $@; do
            pygmentize -P style=$style -P tabsize=4 -f terminal256 -g "$NAME"
        done
    fi
}

plugins=(
zsh-autosuggestions
git)
ZSH_THEME=\"Schminitz\"

export ZSH=$HOME/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

# export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
# 
# export GOROOT=/usr/local/Cellar/go/1.11.1/libexec
# export GOPATH=/Users/jinlong/Codes/go
# export PATH=$PATH:/usr/local/Cellar/go/1.11.1/bin/:$GOPATH/bin
# export GOBIN=$GOPATH/bin " > ~/.zshrc

    # cat ~/.oh-my-zsh/templates/zshrc.zsh-template | while read line
    # do
    #     echo $line >> ~/.zshrc
    # done

}

JudgeZshrcExists
InstallGitZsh
DownloadZshrc
UpdateZshrc

echo "install finish !"
