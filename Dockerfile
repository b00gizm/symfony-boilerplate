FROM ubuntu:15.04

RUN apt-get update
RUN apt-get install -y curl git nginx
RUN apt-get install -y php5-fpm php5-curl php5-json php5-mysql

# Configure Nginx
ADD nginx/nginx.conf /etc/nginx/nginx.conf
RUN rm /etc/nginx/sites-enabled/default
ADD nginx/sites-enabled/ /etc/nginx/sites-enabled

# Configure PHP
ENV PHP_EXT_DIR /usr/lib/php5/20131226
ENV PHP_INI_DIR /etc/php5/fpm
ENV PHP_INI     ${PHP_INI_DIR}/php.ini

RUN sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php5/fpm/php-fpm.conf
RUN sed -i "s/;clear_env = no/clear_env = no/" /etc/php5/fpm/pool.d/www.conf
RUN sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" $PHP_INI
RUN sed -i "s/display_errors = Off/display_errors = On/" $PHP_INI
RUN sed -i "s/;date.timezone =/date.timezone = Europe\/Berlin/" $PHP_INI

# Symfony installer
RUN curl -LsS http://symfony.com/installer -o /usr/local/bin/symfony
RUN chmod a+x /usr/local/bin/symfony

# Install composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

RUN mkdir -p /code/myapp
WORKDIR /code/myapp

RUN useradd -d /code/myapp -u 1000 www && \
    sed -i 's/www-data/www/g' /etc/nginx/nginx.conf && \
    sed -i "s/www-data/www/g" /etc/php5/fpm/pool.d/www.conf && \
    sed -i "s/www-data/www/g" /etc/php5/fpm/pool.d/www.conf && \
    chown -R www:www \
        /var/log/nginx \
        /code/myapp

CMD ["../startup.sh"]