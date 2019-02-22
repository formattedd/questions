# wget -qO- https://raw.githubusercontent.com/formateddd/questions/master/ubuntu/install.sh | sh -x
sudo apt update 
sudo apt install zsh git wget -y

mkdir ~/.pip
echo '[global]
index-url = http://mirrors.aliyun.com/pypi/simple/
[install]
trusted-host=mirrors.aliyun.com' > ~/.pip/pip.conf

sudo apt install python-pip -y
sudo pip install virtualenv
virtualenv -p /usr/bin/python3 ~/.virtualenv/py3

source ~/.virtualenv/py3/bin/activate

wget -qO- https://raw.githubusercontent.com/formatedd/vimrc/master/setup.sh | sh -x

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

wget https://raw.githubusercontent.com/formateddd/questions/master/ubuntu/Schminitz.zsh-theme -P ~/.oh-my-zsh/custom/themes
