FROM alpine:3.12

RUN apk update upgrade && \
    apk add mysql mysql-client supervisor openrc

RUN mkdir -p /var/lib/mysql
RUN mkdir -p /run/mysqld

COPY my.cnf /etc/my.cnf
COPY database.sql /
COPY supervisor.conf /etc/supervisor.conf

COPY run.sh /
EXPOSE 3306
CMD sleep infinity