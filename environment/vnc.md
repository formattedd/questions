sudo apt-get install x11vnc

x11vnc -storepasswd

x11vnc -auth guess -once -loop -noxdamage -repeat -rfbauth ~/.vnc/passwd -rfbport 5900 -shared

x11vnc -forever

https://www.realvnc.com/en/connect/download/viewer/


arch:
    yay -S x11vnc net-tools
    update -> /etc/gdm/custom.conf:
        WaylandEnable=false

