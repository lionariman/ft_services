#!/bin/sh

# openrc default
mysql_install_db
rc-service mariadb start
mysql < database.sql
mysql wordpress < wordpress_db.sql

rc-service mariadb stop

/usr/bin/supervisord -c /etc/supervisord.conf