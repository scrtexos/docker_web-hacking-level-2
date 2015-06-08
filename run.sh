#!/bin/bash

if [ ! -f /.root_pw_set ]; then
    /set_root_pw.sh
fi
cd /app/ && git pull
find /app/ -name db -exec rm {}/.htdb.db \;
find /app/ -name db -exec chown -R www-data:www-data {} \;
/usr/sbin/sshd
/etc/init.d/mysql start
exec supervisord -n
