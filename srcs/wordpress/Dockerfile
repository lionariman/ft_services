FROM alpine:3.12

#services
RUN apk update && \
    apk add nginx && \
    apk add openssl && \
    apk add openssh

RUN adduser keuclide
RUN echo "admin\nadmin" | passwd keuclide

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
EXPOSE 80 443
EXPOSE 22
CMD sh run.sh