#!/bin/bash

# Download V2Ray
mkdir -p /usr/bin /etc/v2ray
wget -O /tmp/v2ray-linux.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip
unzip /tmp/v2ray-linux.zip -d /tmp/v2ray
install -m 755 /tmp/v2ray/v2ray /usr/bin/v2ray

# Start Caddy
caddy run --config /etc/caddy/Caddyfile &

# Start V2Ray with your config
/usr/bin/v2ray run -config /app/config.json
