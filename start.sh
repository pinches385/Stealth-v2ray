#!/bin/bash

# Install V2Ray
mkdir -p /usr/bin /etc/v2ray
wget -O /tmp/v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip
unzip /tmp/v2ray.zip -d /tmp/v2ray
install -m 755 /tmp/v2ray/v2ray /usr/bin/v2ray

# Run Caddy (reverse proxy) in background
caddy run --config /etc/caddy/Caddyfile &

# Run V2Ray (main process)
v2ray run -config /app/config.json
