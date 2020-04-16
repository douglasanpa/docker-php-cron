FROM php:5.6-apache
LABEL Maintainer="Douglas Andrade <douglasanpa@gmail.com>" \
      Description="Docker Image for PHP with CRON"

RUN apt-get update -y && apt-get install -y supervisor curl cron && rm -rf /etc/crontabs/root
COPY 5.6/crontab /etc/crontabs/root
COPY 5.6/start.sh /
COPY 5.6/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

HEALTHCHECK --interval=30s --timeout=30s --start-period=600s --retries=3 CMD curl http://localhost:80/ || exit 1

ENTRYPOINT /start.sh
