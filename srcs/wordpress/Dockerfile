FROM alpine:3.12

RUN apk update && \
    apk add wget php7 php7-mysqli php-fpm php-pdo php-gd php-cli php-mbstring

WORKDIR /var/www/
RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xvf latest.tar.gz && \
    rm -rf latest.tar.gz

COPY wp-config.php /var/www/wordpress/

WORKDIR /
COPY run.sh /
RUN chmod +x run.sh
EXPOSE 5050/tcp
CMD sh run.sh