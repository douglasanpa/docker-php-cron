#!/usr/bin/env bash

chown root:root /etc/crontabs/root
/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
