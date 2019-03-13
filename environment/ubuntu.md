
## 中文乱码
```sh
sudo apt-get -y install language-pack-zh-hans

#写入 ~/.zshrc:
LC_ALL=zh_CN.utf8
export LC_ALL

source ~/.zshrc
```


## static ip
#### path: `/etc/network/interface`

> * auto eth1
> * iface eth1 inet static
> * address 192.168.56.xx
> * netmask 255.255.255.0
> * network 192.168.56.0
> * broadcast 192.168.56.255


## 安装设置samba
> * sudo apt-get install samba
> * sudo useradd xxx
> * sudo smbpasswd -a xxx
> * sudo vi /etc/samba/smb.conf

#### 配置内加入以下内容
```sh
[dev]
comment = dev
path = /var/dev
valid user = xxx
write list = xxx
create mask = 0664
directory mask = 0775
force user = xxx
force group = xxx
public = no
available = yes
browseable = yes
security = user
```
### 重启samba【sudo service smbd restart】


## Ubuntu分区

> * efi
> * swap	交换空间
> * / ext4
> * /boot	200M左右	ext4	
> * /tmp	5G左右	ext4	


### swap

```sh
sudo fallocate -l 4G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile

sudo vim /etc/fstab
/swapfile none swap sw 0 0
```
