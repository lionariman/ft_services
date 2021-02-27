FROM alpine:3.12

#services
RUN apk update && \
    apk add nginx && \
    apk add openssl

COPY /nginx.conf /etc/nginx/conf.d/default.conf

#openssl
WORKDIR /etc/nginx/ssl/
RUN openssl req -newkey rsa:4096 -x509 -sha256 \
    -days 1 -nodes -out crt.crt -keyout key.key \
    -subj "/C=RU/ST=Tatarstan/L=Kazan/O=Ecole 42/OU=Ignis/CN=localhost"

WORKDIR /
COPY run.sh .
RUN chmod +x run.sh
RUN mkdir -p /run/nginx
CMD sh run.sh