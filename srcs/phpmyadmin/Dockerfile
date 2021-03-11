FROM alpine:3.12

RUN apk update && \
    mkdir -p /run/nginx && \
    apk add wget nginx openssl supervisor php7 php7-mysqli php7-fpm php-pdo php-gd php-cli php-mbstring

RUN rm -rf /etc/nginx/conf.d/default.conf
COPY ./my.conf /etc/nginx/conf.d/default.conf
COPY ./supervisord.conf /etc/supervisord.conf

WORKDIR /var/www/
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-english.tar.gz && \
    tar -xvf phpMyAdmin-5.0.4-english.tar.gz && \
    rm -rf phpMyAdmin-5.0.4-english.tar.gz && \
    mv phpMyAdmin-5.0.4-english phpmyadmin
COPY config.inc.php /var/www/

WORKDIR /etc/nginx/ssl/
RUN openssl req -newkey rsa:4096 -x509 -sha256 \
    -days 1 -nodes -out crt.crt -keyout key.key \
    -subj "/C=RU/ST=Tatarstan/L=Kazan/O=Ecole 42/OU=Ignis/CN=localhost"

WORKDIR /
COPY ./run.sh ./
EXPOSE 5000/tcp
RUN chmod +x run.sh
CMD sh run.sh