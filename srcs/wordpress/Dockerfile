FROM alpine:3.12

RUN apk update upgrade && \
    mkdir -p /run/nginx && \
    mkdir -p /etc/nginx/snippets && \
    apk add wget nginx openssl supervisor php7 php7-mysqli php-fpm php-pdo php-gd php-cli php-mbstring

#copy nginx conf
RUN rm -rf /etc/nginx/conf.d/default.conf
COPY ./my.conf /etc/nginx/conf.d/default.conf
#copy supervisor conf
COPY supervisord.conf /etc/supervisord.conf

WORKDIR /var/www/
RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xvf latest.tar.gz && \
    rm -rf latest.tar.gz
COPY wp-config.php /var/www/
# INSTALL GLIBC
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.33-r0/glibc-2.33-r0.apk
RUN apk add glibc-2.33-r0.apk

WORKDIR /etc/nginx/ssl/
RUN openssl req -newkey rsa:4096 -x509 -sha256 \
    -days 1 -nodes -out crt.crt -keyout key.key \
    -subj "/C=RU/ST=Tatarstan/L=Kazan/O=Ecole 42/OU=Ignis/CN=localhost"

EXPOSE 5050/tcp
COPY ./run.sh ./
RUN chmod +x run.sh
CMD sh run.sh