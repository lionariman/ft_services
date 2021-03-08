FROM alpine:3.12

RUN apk update upgrade && \
    mkdir -p /run/nginx && \
    apk add wget nginx openssl supervisor php7 php7-mysqli php-fpm php-pdo php-gd php-cli php-mbstring

WORKDIR /var/www/
RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xvf latest.tar.gz && \
    rm -rf latest.tar.gz

WORKDIR /etc/nginx/ssl/
RUN openssl req -newkey rsa:4096 -x509 -sha256 \
    -days 1 -nodes -out crt.crt -keyout key.key \
    -subj "/C=RU/ST=Tatarstan/L=Kazan/O=Ecole 42/OU=Ignis/CN=localhost"

COPY wp-config.php /var/www/wordpress/
COPY my.conf /etc/nginx/conf.d/
COPY supervisor.conf /etc/supervisor.conf

WORKDIR /
COPY run.sh /
RUN chmod +x run.sh
EXPOSE 5050/tcp
CMD sh run.sh