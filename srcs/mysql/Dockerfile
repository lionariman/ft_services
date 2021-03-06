FROM alpine:3.12

RUN apk update && \
    apk add mariadb mariadb-client

WORKDIR /etc/sql/
COPY database.sql /etc/sql/

EXPOSE 3306/tcp