
## git
  ``` shell
  # public key
  git config --global user.name ""
  git config --global user.email ""
  ssh-keygen -t rsa -b 4096 -C ""

  # git config
  git config --global http.https://github.com.proxy socks5://127.0.0.1:1080
  git config --global https.https://github.com.proxy socks5://127.0.0.1:1080

  # or vi ~/.gitconfig

  [http "https://github.com"]
    proxy = socks5://127.0.0.1:1080
    postBuffer = 524288000
  [https "https://github.com"]
    proxy = socks5://127.0.0.1:1080
    postBuffer = 524288000
  ```


## ohmyzsh
```sh
# 分步安装
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# themes:
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

# plgins:
git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting

# 一键安装
sh <(curl -fsSL https://raw.githubusercontent.com/formateddd/questions/master/environment/zshrc_install.sh)
```

## ssh/config
```sh
Host virtual
    HostName xxx
    User xxx
    IdentitiesOnly yes
    IdentityFile ~/.ssh/id_rsa
    ServerAliveInterval 120
# ssh-copy-id -i ~/.ssh/id_rsa.pub virtual
# ssh -D 1082 -f -C -q -N xx
```

# pip config
```sh
(sudo) pip install virtualenv
virtualenv -p /usr/bin/python3.7 ~/.virtualenv/py3
# pip freeze > requirements.txt

# pip.conf
# 用国内源安装
pip install web.py -i http://pypi.douban.com/simple --trusted-host pypi.douban.com

# 临时

# 清华源
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
# 阿里源
pip config set global.index-url https://mirrors.aliyun.com/pypi/simple/
# 腾讯源
pip config set global.index-url http://mirrors.cloud.tencent.com/pypi/simple
# 豆瓣源
pip config set global.index-url http://pypi.douban.com/simple/

# 永久配置
# linux:`~/.pip/pip.conf`
# windows:`%HOMEPATH%\pip\pip.ini）`
[global]
  index-url = http://mirrors.aliyun.com/pypi/simple/
[install]
  trusted-host=mirrors.aliyun.com

# error: locale.Error: unsupported locale setting
export LC_ALL=C
```

## yarn && npm
```sh
yarn config set registry 'https://registry.npm.taobao.org'
yarn config get registry

yarn global add yrm
yrm ls
yrm use taobao
yrm test

npm config set registry https://registry.npm.taobao.org
npm config get registry
```

## docker
```sh
# install
wget -qO- https://get.docker.com/ | sh
sudo usermod -aG docker $USER

# config path: /etc/docker/daemon.json
{
  "registry-mirrors": ["http://hub-mirror.c.163.com"]
}

# lazydocker
docker run -it -v /var/run/docker.sock:/var/run/docker.sock -v /tmp:/.config/jesseduffield/lazydocker lazyteam/lazydocker
```
