
- ## 安装 zsh

    ```sh
    sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

    themes, 可更改
    wget https://raw.githubusercontent.com/formateddd/questions/master/environment/Schminitz.zsh-theme -P ~/.oh-my-zsh/custom/themes/

    plgins,
    git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

    or run it,
    sh -c "$(wget https://raw.githubusercontent.com/formateddd/questions/master/environment/zshrc_install.sh -O -)"

    ```
- ##### [其他zshrc配置](https://github.com/formateddd/questions/blob/master/environment/zshrc)

------------
- ## ssh/config

    ```sh
    Host virtual
    HostName xxx
    User xxx
    IdentitiesOnly yes
    IdentityFile ~/.ssh/id_rsa
    ServerAliveInterval 120
    # ssh-copy-id -i ~/.ssh/id_rsa.pub virtual
    ```

------------
- ## git

##### config
* git config --global user.name ""
* git config --global user.email ""
* ssh-keygen -t rsa -C ""

##### proxy
* ~/.gitconfig
* [http]
* proxy = socks5://127.0.0.1:1080
* [https]
* proxy = socks5://127.0.0.1:1080

------------

- ## pip config

    ```sh
    sudo pip install virtualenv
    virtualenv -p /usr/bin/python2.7 xxx
    # pip freeze > requirements.txt
    ```

##### pip.conf
```sh
# 直接用国内源安装
pip install web.py -i http://pypi.douban.com/simple --trusted-host pypi.douban.com
```

##### 修改配置文件：
linux:`~/.pip/pip.conf`
windows:`%HOMEPATH%\pip\pip.ini）`
```sh
[global]
index-url = http://mirrors.aliyun.com/pypi/simple/
[install]
trusted-host=mirrors.aliyun.com
```

##### 其他源：
```sh
清华大学 https://pypi.tuna.tsinghua.edu.cn/simple/
阿里云 http://mirrors.aliyun.com/pypi/simple/
中国科技大学 https://pypi.mirrors.ustc.edu.cn/simple/
豆瓣(douban) https://pypi.douban.com/simple/
中国科学技术大学 http://pypi.mirrors.ustc.edu.cn/simple/
```

##### error: locale.Error: unsupported locale setting
```sh
export LC_ALL=C
```

