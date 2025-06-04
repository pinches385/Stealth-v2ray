FROM alpine:latest

RUN apk update && \
    apk add --no-cache wget unzip caddy bash curl

WORKDIR /app

# Download and unzip v2ray
RUN wget https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip && \
    unzip v2ray-linux-64.zip && \
    mv v2ray v2ray-bin && \
    chmod +x v2ray-bin/v2ray

# Copy config files
COPY start.sh /app/start.sh
COPY config.json /app/config.json
COPY Caddyfile /etc/caddy/Caddyfile

RUN chmod +x /app/start.sh

CMD ["/bin/bash", "/app/start.sh"]
