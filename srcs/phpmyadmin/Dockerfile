FROM alpine:3.12

RUN apk update && \
    apk upgrade && \
    mkdir -p /run/nginx && \
    apk add wget openssl nginx php7 php7-mysqli php-fpm php-pdo php-gd php-cli php-mbstring

WORKDIR /var/www/
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-english.tar.gz && \
    tar -xvf phpMyAdmin-5.0.4-english.tar.gz && \
    rm -rf phpMyAdmin-5.0.4-english.tar.gz

COPY config.inc.php /var/www/phpMyAdmin-5.0.4-english/
COPY my.conf /etc/nginx/conf.d/

WORKDIR /
COPY run.sh /
RUN chmod +x run.sh
EXPOSE 5000/tcp
CMD sh run.sh