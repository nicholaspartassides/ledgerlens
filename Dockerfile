FROM caddy:2-alpine
COPY index.html /srv/index.html
COPY Caddyfile /etc/caddy/Caddyfile
COPY start.sh /start.sh
CMD ["sh", "/start.sh"]
