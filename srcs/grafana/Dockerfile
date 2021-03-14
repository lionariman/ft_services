FROM alpine:3.12

RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

RUN apk update && \
    apk add mysql mysql-client supervisor openrc telegraf

COPY ./telegraf.conf /etc/

WORKDIR /var/www/
RUN wget https://dl.grafana.com/enterprise/release/grafana-enterprise-7.3.7.linux-amd64.tar.gz && \
    tar -zxvf grafana-enterprise-7.3.7.linux-amd64.tar.gz && \
    rm grafana-enterprise-7.3.7.linux-amd64.tar.gz

WORKDIR /
COPY run.sh ./
RUN chmod +x run.sh

EXPOSE 3000

CMD sh run.sh