FROM alpine:3.12

RUN apk update && \
    apk add wget supervisor vsftpd openssl openrc

RUN adduser -D new_user
RUN echo -e "1234abcd\n1234abcd" | passwd new_user

COPY ./supervisord.conf /etc/supervisord.conf
COPY ./vsftpd.conf /etc/vsftpd/vsftpd.conf

WORKDIR /etc/ssl/
RUN openssl req -newkey rsa:4096 -x509 -sha256 \
    -days 1 -nodes -out crt.crt -keyout key.key \
    -subj "/C=RU/ST=Tatarstan/L=Kazan/O=Ecole 42/OU=Ignis/CN=localhost"

WORKDIR /
COPY ./run.sh ./
RUN chmod +x run.sh

EXPOSE 21

CMD sh run.sh