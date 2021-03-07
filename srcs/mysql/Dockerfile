FROM alpine:3.12

RUN apk update && apk upgrade && \
    apk add mysql mysql-client && \
    apk add openrc

COPY my.cnf /etc/my.cnf
COPY database.sql /

COPY run.sh /
EXPOSE 3306
CMD sh run.sh