## server:
```sh
pip install shadowsocks

# path : /etc/shadowsocks.json
{
    "server":"0.0.0.0",
    "port_password": {
        "8000": "password"
    },
    "timeout":300,
    "method":"aes-256-cfb",
    "fast_open":true,
    "workers": 1
}

(sudo) ssserver -c /etc/shadowsocks.json -d start
sudo ssserver -d stop

https://github.com/shadowsocks/shadowsocks/wiki/Shadowsocks-%E4%BD%BF%E7%94%A8%E8%AF%B4%E6%98%8E
```


#### 开启bbr
```sh
wget --no-check-certificate https://github.com/teddysun/across/raw/master/bbr.sh

chmod +x bbr.sh

./bbr.sh

sysctl net.ipv4.tcp_available_congestion_control
#返回值一般为：
#net.ipv4.tcp_available_congestion_control = bbr cubic reno

sysctl net.ipv4.tcp_congestion_control
#返回值一般为：
#net.ipv4.tcp_congestion_control = bbr

sysctl net.core.default_qdisc
#返回值一般为：
#net.core.default_qdisc = fq

lsmod | grep bbr
#返回值有 tcp_bbr 模块即说明bbr已启动。
```

## client
#### ubuntu下使用， Mac下载 https://github.com/shadowsocks/ShadowsocksX-NG/releases/
```sh
pip install shadowsocks

path : ~/.shadowsocks/shadowsocks.json

{
  "server":"my_server_ip",
  "server_port":my_server_port,
  "password":"my_password",
  "local_address": "127.0.0.1",
  "local_port":1080,
  "timeout":300,
  "method":"aes-256-cfb"
  "fast_open":true,
  "pid-file": "/path",
  "log-gile": "/path"
}

sslocal -c ~/.shadowsocks/shadowsocks.json -d start
可先在系统设置里设置全局代理，在浏览器里安装 https://chrome.google.com/webstore/detail/proxy-switchyomega/padekgcemlokbadohgkifijomclgjgif
```
