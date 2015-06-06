#!/bin/bash

if [ ! -f /.root_pw_set ]; then
    /set_root_pw.sh
fi
find /app/ -name db -exec chown -R www-data:www-data {} \;
cd /app/ && git pull
/usr/sbin/sshd
exec supervisord -n
