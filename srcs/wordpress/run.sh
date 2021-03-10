#!/bin/sh

apk add openrc
openrc default
rc-service php7-fpm start

/usr/bin/supervisord -c /etc/supervisord.conf