#!/bin/bash

caddy start --config /etc/caddy/Caddyfile

sleep 3

/app/v2ray-bin/v2ray -config /app/config.json
