#!/bin/sh
ssh-keygen -A
adduser admin
echo "admin:admin" | chpasswd
/usr/bin/supervisord -c /etc/supervisor.conf