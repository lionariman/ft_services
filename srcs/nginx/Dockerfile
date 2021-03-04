FROM alpine:3.12

RUN apk update && \
    apk upgrade && \
    apk add nginx openssl openssh supervisor

RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www

COPY my.conf /etc/nginx/nginx.conf
COPY supervisor.conf /etc/supervisor.conf

WORKDIR /etc/nginx/ssl/
RUN openssl req -newkey rsa:4096 -x509 -sha256 \
    -days 1 -nodes -out crt.crt -keyout key.key \
    -subj "/C=RU/ST=Tatarstan/L=Kazan/O=Ecole 42/OU=Ignis/CN=localhost"

WORKDIR /
COPY run.sh /
RUN chmod +x run.sh
RUN mkdir -p /run/nginx
EXPOSE 80/tcp
EXPOSE 443/tcp
EXPOSE 22/tcp
CMD sh run.sh