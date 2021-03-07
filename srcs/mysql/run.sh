#!/bin/sh

mkdir -p /var/lib/mysql
mkdir -p /run/mysqld
openrc default
mysql_install_db
rc-service mariadb start

# create new database, create user, grant priveleges
mysql < /database.sql
# mysql wordpress < database.sql

rc-service mariadb stop

/usr/bin/mysqld --datadir=/var/lib/mysql --socket=/run/mysqld/mysqld.sock

# tail -f /dev/null