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
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-english.tar.gz && \
    tar -xvf phpMyAdmin-5.0.4-english.tar.gz && \
    rm -rf phpMyAdmin-5.0.4-english.tar.gz && \
    mv phpMyAdmin-5.0.4-english phpmyadmin && \
    mkdir /var/www/phpmyadmin/tmp && \
    chmod 777 /var/www/phpmyadmin/tmp
COPY ./config.inc.php /var/www/phpmyadmin

WORKDIR /
COPY ./run.sh ./
RUN chmod +x run.sh

EXPOSE 5000

CMD sh run.sh