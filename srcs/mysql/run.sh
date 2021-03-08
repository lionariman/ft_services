#!/bin/sh

openrc default
mysql_install_db
rc-service mariadb start

# create new database, create user, grant priveleges
mysql < /database.sql
# mysql wordpress < database.sql

# rc-service mariadb stop

#/usr/bin/supervisord -c /etc/supervisor.conf

# sleep infinity