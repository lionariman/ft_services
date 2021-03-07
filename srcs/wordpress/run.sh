#!/bin/sh

apk add openrc
openrc default
rc-service php7-fpm start

nginx -g 'daemon off;'