FROM alpine:3.12

RUN apk update && \
    apk add mariadb mariadb-client

WORKDIR /etc/sql/
COPY wordpress.sql /etc/sql/
COPY phpmyadmin.sql /etc/sql/