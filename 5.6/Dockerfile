# Forked from TrafeX/docker-php-nginx (https://github.com/TrafeX/docker-php-nginx/)

FROM php:5.6-apache
LABEL Maintainer="Douglas Andrade <douglasanpa@gmail.com>" \
      Description="Docker Image for PHP with CRON"

RUN apk --no-cache supervisor curl
COPY crontab /etc/crontabs/root
COPY start.sh /
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

HEALTHCHECK --interval=30s --timeout=30s --start-period=600s --retries=3 CMD curl http://localhost:80/ || exit 1

ENTRYPOINT /start.sh
