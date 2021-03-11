FROM alpine:3.12

RUN apk update && \
    apk add wget supervisor vsftpd openssl openrc

RUN adduser user
RUN echo -e "1234abcd\1234abcd" | chpasswd user

COPY ./supervisord.conf /etc/supervisord.conf
COPY ./vsftpd.conf /etc/vsftpd/vsftpd.conf

WORKDIR /etc/vsftpd/
RUN openssl req -newkey rsa:4096 -x509 -sha256 \
    -days 1 -nodes -out vsftpd.pem -keyout vsftpd.pem \
    -subj "/C=RU/ST=Tatarstan/L=Kazan/O=Ecole 42/OU=Ignis/CN=localhost"

WORKDIR /
COPY ./run.sh ./

EXPOSE 21/tcp

RUN chmod +x run.sh
# CMD sh run.sh
CMD sleep infinity