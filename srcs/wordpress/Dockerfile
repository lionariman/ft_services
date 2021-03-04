FROM alpine:3.12

RUN apk update && \
    apk upgrade && \
    apk add wget telegraf nginx php7 php7-mysqli php-fpm php-pdo php-gd php-cli php-mbstring

WORKDIR /var/www/
RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xvf latest.tar.gz && \
    rm -rf latest.tar.gz

COPY wp-config.php /var/www/wordpress/

EXPOSE 5050/tcp

CMD php -S 0.0.0.0:5050 -t /var/www/wordpress/