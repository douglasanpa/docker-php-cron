#!/usr/bin/env bash

chown root:root /etc/crontabs/root
chown xfs:xfs /var/tmp/nginx -R
chown xfs:xfs /var/tmp/nginx -R
chown xfs:xfs /var/lib/php* -R
/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
