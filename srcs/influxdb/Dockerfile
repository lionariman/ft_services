FROM alpine:3.12

RUN apk update && \
    mkdir -p /var/lib/influxdb/wal && \
    mkdir -p /var/lib/influxdb/meta && \
    mkdir -p /var/lib/influxdb/data && \
    apk add mysql mysql-client supervisor openrc influxdb

COPY run.sh ./
RUN chmod +x run.sh

EXPOSE 8086

CMD sh run.sh