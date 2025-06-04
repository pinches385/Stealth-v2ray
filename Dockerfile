FROM alpine:latest

RUN apk update && \
    apk add --no-cache wget unzip caddy bash curl

WORKDIR /app

# Copy config files
COPY start.sh /app/start.sh
COPY config.json /app/config.json
COPY Caddyfile /etc/caddy/Caddyfile

# Make startup script executable
RUN chmod +x /app/start.sh

EXPOSE 80

CMD ["/app/start.sh"]
