FROM alpine:3.12

RUN apk update upgrade && \
    mkdir -p /run/mysqld && \
    mkdir -p /var/lib/mysql && \
    apk add mysql mysql-client supervisor openrc

COPY ./my.cnf /etc/my.cnf
COPY ./database.sql ./
COPY ./wordpress_db.sql ./
COPY ./supervisord.conf /etc/supervisord.conf

COPY run.sh ./

EXPOSE 3306

CMD sh run.sh