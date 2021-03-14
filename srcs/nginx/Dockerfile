FROM alpine:3.12

RUN apk update && \
    mkdir -p /run/nginx && \
    apk add nginx openssl supervisor && \
    apk add telegraf --repository http://dl-2.alpinelinux.org/alpine/edge/community --allow-untrusted --no-cache

RUN rm -rf /etc/nginx/conf.d/default.conf
COPY ./my.conf /etc/nginx/conf.d/default.conf
COPY ./supervisord.conf /etc/supervisord.conf
COPY ./telegraf.conf /etc/

WORKDIR /etc/nginx/ssl/
RUN openssl req -newkey rsa:4096 -x509 -sha256 \
    -days 1 -nodes -out crt.crt -keyout key.key \
    -subj "/C=RU/ST=Tatarstan/L=Kazan/O=Ecole 42/OU=Ignis/CN=localhost"

WORKDIR /var/www/
COPY ./telegraf-1.17.3_linux_amd64.tar.gz ./
RUN tar -zxvf telegraf-1.17.3_linux_amd64.tar.gz && rm telegraf-1.17.3_linux_amd64.tar.gz
RUN mkdir /etc/telegraf
COPY ./telegraf.conf /etc/telegraf/

WORKDIR /
COPY ./run.sh ./
RUN chmod +x run.sh

EXPOSE 80/tcp
EXPOSE 443/tcp
EXPOSE 22/tcp

CMD sh run.sh