#!/usr/bin/env bash

/bin/sed -i "s/%FPM_HOST%/${PHPFPM_1_PORT_9000_TCP_ADDR}/" /etc/nginx/sites-enabled/symfony_boilerplate
/bin/sed -i "s/%FPM_PORT%/${PHPFPM_1_PORT_9000_TCP_PORT}/" /etc/nginx/sites-enabled/symfony_boilerplate

useradd -d /code/myapp -u 1000 www && \
    sed -i 's/www-data/www/g' /etc/nginx/nginx.conf && \
    chown -R www:www \
        /var/log/nginx \
        /code/myapp

exec /usr/sbin/nginx
