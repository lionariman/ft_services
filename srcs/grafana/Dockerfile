FROM alpine:3.12

RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

RUN apk update && \
    apk add supervisor telegraf grafana

COPY ./supervisord.conf /etc/supervisord.conf
COPY ./telegraf.conf /etc/
COPY ./grafana.ini /etc/
COPY ./grafana.db /usr/share/grafana/data/grafana.db
COPY run.sh ./
RUN chmod +x run.sh

EXPOSE 3000

CMD sh run.sh