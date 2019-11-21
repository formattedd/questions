#### install
```sh
wget -qO- https://get.docker.com/ | sh

sudo usermod -aG docker $USER
```

#### /etc/docker/daemon.json

```sh
{
  "registry-mirrors": ["https://registry.docker-cn.com"]
}
```
