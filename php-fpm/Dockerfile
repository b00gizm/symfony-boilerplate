FROM ubuntu:15.04

RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y \
    php5-fpm \
    php5-curl \
    php5-json \
    php5-mysql \
    php5-pgsql \
    php5-redis \
    php5-xdebug

# Configure PHP
ENV PHP_EXT_DIR /usr/lib/php5/20131226
ENV PHP_INI_DIR /etc/php5/fpm
ENV PHP_INI     ${PHP_INI_DIR}/php.ini

RUN sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php5/fpm/php-fpm.conf
RUN sed -i "s/;clear_env = no/clear_env = no/" /etc/php5/fpm/pool.d/www.conf
RUN sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" $PHP_INI
RUN sed -i "s/display_errors = Off/display_errors = On/" $PHP_INI
RUN sed -i "s/;date.timezone =/date.timezone = Europe\/Berlin/" $PHP_INI

# Configure Xdebug
ADD conf/xdebug.ini ${PHP_INI_DIR}/conf.d/20-xdebug.ini

ADD start.sh /start.sh

EXPOSE 9000

WORKDIR /code

ENTRYPOINT ["/start.sh"]
