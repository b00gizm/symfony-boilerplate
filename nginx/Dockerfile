FROM ubuntu:15.04

RUN apt-get update
RUN apt-get install -y nginx

# Configure Nginx
ADD nginx.conf /etc/nginx/nginx.conf
RUN rm /etc/nginx/sites-enabled/default
ADD sites-enabled/ /etc/nginx/sites-enabled

ADD start.sh /start.sh

EXPOSE 80

ENTRYPOINT ["/start.sh"]
