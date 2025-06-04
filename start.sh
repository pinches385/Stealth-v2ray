#!/bin/bash

# Create necessary directories
mkdir -p /usr/bin /etc/v2ray

# Download latest v2ray-core release
wget -O /tmp/v2ray-linux.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip

# Unzip and install
unzip /tmp/v2ray-linux.zip -d /tmp/v2ray
install -m 755 /tmp/v2ray/v2ray /usr/bin/v2ray
install -m 755 /tmp/v2ray/v2ctl /usr/bin/v2ctl

# Start v2ray in the background
/usr/bin/v2ray run -config /app/config.json &

# Start caddy after v2ray is ready
caddy run --config /etc/caddy/Caddyfile
