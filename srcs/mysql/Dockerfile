FROM alpine:3.12

RUN apk update upgrade && \
    apk add mysql mysql-client supervisor openrc

COPY my.cnf /etc/my.cnf
COPY database.sql /
COPY supervisord.conf /etc/supervisord.conf

RUN mkdir -p /var/lib/mysql
RUN mkdir -p /run/mysqld

COPY run.sh /
EXPOSE 3306
CMD sleep infinity