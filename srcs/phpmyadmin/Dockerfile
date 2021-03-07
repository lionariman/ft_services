FROM alpine:3.12

RUN apk update && \
    apk upgrade && \
    mkdir -p /run/nginx && \
    apk add wget nginx php7 php7-mysqli php-fpm php-pdo php-gd php-cli php-mbstring

WORKDIR /var/www/
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-english.tar.gz && \
    tar -xvf phpMyAdmin-5.0.4-english.tar.gz && \
    rm -rf phpMyAdmin-5.0.4-english.tar.gz && \
    mv phpMyAdmin-5.0.4-english phpmyadmin

COPY config.inc.php /var/www/phpmyadmin/
COPY my.conf /etc/nginx/conf.d/

WORKDIR /
COPY run.sh /
RUN chmod +x run.sh
EXPOSE 5000/tcp
CMD sh run.sh