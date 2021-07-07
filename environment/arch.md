# VPS Providers
# https://gitlab.com/drizzt/vps2arch/-/wikis/Tested-VPS-Providers

VPS Provider                                   | Original Linux Distro      | Status              | Note
-----------------------------------------------|----------------------------|---------------------|------
[Aruba Cloud](http://arubacloud.com/)          | Ubuntu 14.04               | Supported           |
[BandwagonHost](https://bandwagonhost.com/)    | Debian 9 (x86_64)          | Supported           |
[CloudAtCost](http://cloudatcost.com/)         | CentOS 6 (x86, x86_64)     | Supported           |
[CloudAtCost](http://cloudatcost.com/)         | CentOS 7 (x86_64)          | Supported           |
[CloudAtCost](http://cloudatcost.com/)         | Ubuntu 14.04               | Supported           | See comments in [#13](../issues/13)
[CloudAtCost](http://cloudatcost.com/)         | Debian 8                   | Not Supported       | See comments in [#17](../issues/17)
[Digital Ocean](https://www.digitalocean.com/) | Debian 8 (x86, x86_64)     | Supported           |
[Digital Ocean](https://www.digitalocean.com/) | Ubuntu 14.04 (x86, x86_64) | Partially Supported | Kernel can't be changed, use Debian 8 image instead
[Digital Ocean](https://www.digitalocean.com/) | Centos 6.5 (x86, x86_64)   | Not Supported       | Kernel doesn't work for some selinux problems, use Debian 8 image instead
[Digital Ocean](https://www.digitalocean.com/) | Centos 7 (x86_64)          | Supported           | 
[DGCHost](https://www.dgchost.net/)            | Ubuntu 16.04               | Supported           |
[OVH VPS Classic](http://www.ovh.com/)         | Debian 7 (x86, x86_64)     | Supported           | OpenVZ VPS
[OVH VPS Classic](http://www.ovh.com/)         | Debian 8 (x86_64)          | Not Supported       | Cannot remove some directories and I can't find why, use Debian 7 image instead
[CheapVPS](http://www.cheapvps.co.uk/)         | Ubuntu 14.04 (x86_64)      | Supported           | Reported in [#4](../issues/4)
[Wable](https://wable.com/)                    | Debian 7                   | Supported           | Reported in [#5](../issues/5)
[Vscale](http://vscale.io)                     | Debian 8                   | Supported           | Reported in [#6](../issues/6)
[Afterburst](http://afterburst.com/)           | Debian 7 (x86_64)          | Supported           | Reported in [#7](../issues/7)
[DataShack](https://www.datashack.net/)        | Ubuntu 15.10 (x86_64)      | Supported           | Reported in [#7](../issues/7)
[HOST1PLUS](https://manage.host1plus.com/)     | ?                          | Supported           | Reported in [#8](../issues/8)
[Axfone](https://www.axfone.eu/)               | Debian 8 (x86_64)          | Supported           | Reported via mail
[Azure](https://azure.microsoft.com/)          | Ubuntu 14.04               | Supported           | Reported in [#10](../issues/10)
[LeaseWeb](https://www.leaseweb.com/)          | Ubuntu 14.04 (x86_64)      | Supported           | See comments in [#11](../issues/11)
[Wholesale](https://www.wholesaleinternet.net/)| ?                          | Supported           | See comments in [#12](../issues/12)
[Amazon EC2](https://aws.amazon.com/ec2/)      | Ubuntu 14.04 (ami-dc48dcb0)| Supported           | See comments in [#21](../issues/21)
[NorthHosts](https://northhosts.co.uk)                  | Ubuntu 16.04 (x86_64)      | Supported            | See comments in [#29](../issues/29)
[Scaleway](https://www.scaleway.com) | Ubuntu 16.04 (x86_64) | Supported | [See instructions](https://github.com/drizzt/vps2arch/wiki/How-to-use-on-Scaleway)
[Vultr](https://vultr.com) | Ubuntu 17.04 (x86_64) | Not supported | Completely breaks VPS, can't access basic Linux commands


# wget https://tinyurl.com/vps2arch 也会被重定向到以下 url
wget https://gitlab.com/drizzt/vps2arch/-/raw/master/vps2arch
# 赋予执行权限
chmod +x vps2arch
# 启动脚本！
./vps2arch
# 当你从脚本默认的源下载速度较慢的时候，可以使用 -m 参数指定源，例如
# ./vps2arch -m https://mirrors.neusoft.edu.cn/archlinux/

sync ; reboot -f

# 使用 ntp
pacman -S ntp
timedatectl set-ntp true
# 设置时区
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc

编辑 /etc/locale.gen 取消一下行的注释（你可能需要一个编辑器，如 vim，请自行安装）

en_GB.UTF-8 UTF-8
zh_CN.UTF-8 UTF-8

执行 locale-gen

创建 /etc/locale.conf 并编辑 LANG 这一 变量，比如：

LANG=zh_CN.UTF-8

/etc/pacman.conf
[archlinuxcn]
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch
