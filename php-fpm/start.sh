#!/usr/bin/env bash
export VERSION=`php -r "echo PHP_MAJOR_VERSION.PHP_MINOR_VERSION;"` \
    && curl -A "Docker" -o /tmp/blackfire-probe.tar.gz -D - -L -s https://blackfire.io/api/v1/releases/probe/php/linux/amd64/${VERSION} \
    && tar zxpf /tmp/blackfire-probe.tar.gz -C /tmp \
    && mv /tmp/blackfire-*.so ${PHP_EXT_DIR}/blackfire.so \
    && echo "extension=blackfire.so" > ${PHP_INI_DIR}/conf.d/blackfire.ini \
    && echo "blackfire.agent_socket=${BLACKFIRE_1_PORT_8707_TCP}" >> ${PHP_INI_DIR}/conf.d/blackfire.ini \
    && echo "blackfire.server_id=${BLACKFIRE_ENV_BLACKFIRE_SERVER_ID}" >> ${PHP_INI_DIR}/conf.d/blackfire.ini \
    && echo "blackfire.server_token=${BLACKFIRE_ENV_BLACKFIRE_SERVER_TOKEN}" >> ${PHP_INI_DIR}/conf.d/blackfire.ini \
    && echo "blackfire.log_file=/tmp/blackfire.log" >> ${PHP_INI_DIR}/conf.d/blackfire.ini \
    && echo "blackfire.log_level=${BLACKFIRE_ENV_BLACKFIRE_LOG_LEVEL}" >> ${PHP_INI_DIR}/conf.d/blackfire.ini

sed -i "s@listen = /var/run/php5-fpm.sock@listen = 9000@" /etc/php5/fpm/pool.d/www.conf

useradd -d /code/myapp -u 1000 www && \
    sed -i "s/www-data/www/g" /etc/php5/fpm/pool.d/www.conf && \
    sed -i "s/www-data/www/g" /etc/php5/fpm/pool.d/www.conf

exec /usr/sbin/php5-fpm --nodaemonize
