#!/usr/bin/env bash

chown root:root /etc/crontabs/root
chown xfs:xfs /var/tmp/nginx -R
/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
