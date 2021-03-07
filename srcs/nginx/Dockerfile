FROM alpine:3.12

RUN apk update && \
    mkdir -p /run/nginx && \
    apk add nginx openssl openssh supervisor

#???
RUN adduser -D 'www' -g www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
# RUN chown -R nginx:nginx /var/www/

WORKDIR /etc/nginx/ssl/
RUN openssl req -newkey rsa:4096 -x509 -sha256 \
    -days 1 -nodes -out crt.crt -keyout key.key \
    -subj "/C=RU/ST=Tatarstan/L=Kazan/O=Ecole 42/OU=Ignis/CN=localhost"

COPY my.conf /etc/nginx/nginx.conf
COPY supervisor.conf /etc/supervisor.conf

WORKDIR /
COPY run.sh /
RUN chmod +x run.sh
EXPOSE 80/tcp
EXPOSE 443/tcp
EXPOSE 22/tcp
CMD sh run.sh