#!/bin/bash

mkdir -p /usr/share/caddy
wget -O /usr/share/caddy/index.html https://github.com/AYJCSGM/mikutap/archive/master.zip
wget -O /usr/bin/caddy https://raw.githubusercontent.com/Lbingyi/HerokuXray/master/etc/caddy
chmod +x /usr/bin/caddy
sed -i "s/b5fa18f4-a281-4230-b2c5-bd9a1754552e/$UUID/g" /etc/v2ray/config.json
wget -O /etc/v2ray/config.json https://raw.githubusercontent.com/Lbingyi/HerokuXray/master/etc/config.json
mkdir -p /etc/v2ray
wget -O /etc/v2ray/config.json https://raw.githubusercontent.com/Lbingyi/HerokuXray/master/etc/config.json
ls -la /etc/v2ray
caddy run --config /etc/caddy/Caddyfile --adapter caddyfile &
/usr/bin/v2ray -config /etc/v2ray/config.json
