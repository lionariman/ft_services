#!/bin/sh

# rc update
# rc default
# rc-service php-fpm7 start

/usr/bin/supervisord -c /etc/supervisord.conf