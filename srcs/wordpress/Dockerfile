FROM alpine:3.12

RUN apk update && \
    mkdir -p /run/nginx && \
    apk add wget nginx supervisor openrc \
    php7-fpm php7-mysqli php7-xml php7-simplexml php7-json \
    php7-iconv php7-tokenizer php7-xmlwriter php7-session php7-mbstring && \
    apk add telegraf --repository http://dl-2.alpinelinux.org/alpine/edge/community --allow-untrusted --no-cache

RUN rm -rf /etc/nginx/conf.d/default.conf
COPY ./my.conf /etc/nginx/conf.d/default.conf
COPY ./supervisord.conf /etc/supervisord.conf
COPY ./telegraf.conf /etc/

WORKDIR /var/www/
RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xvf latest.tar.gz && \
    rm -rf latest.tar.gz
COPY ./wp-config.php /var/www/wordpress

WORKDIR /
COPY ./run.sh ./
RUN chmod +x run.sh

EXPOSE 5050

CMD sh run.sh