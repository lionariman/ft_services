FROM alpine:3.12

RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

RUN apk update && \
    mkdir -p /var/lib/influxdb/wal && \
    mkdir -p /var/lib/influxdb/meta && \
    mkdir -p /var/lib/influxdb/data && \
    apk add supervisor influxdb telegraf

COPY ./supervisord.conf /etc/supervisord.conf
COPY ./telegraf.conf /etc/

COPY run.sh ./
RUN chmod +x run.sh

EXPOSE 8086

CMD sh run.sh