FROM alpine:3.8
LABEL Maintainer="Douglas Andrade <douglasanpa@gmail.com>" \
      Description="Docker Image for PHP with CRON"
RUN apk --update add supervisor curl php5 bash nginx  && \
      apk search -qe 'php5-*' | xargs apk --no-cache add && \
      rm -rf /etc/crontabs/root && rm -rf /var/cache/apk/*

COPY 5.6/php.ini /etc/php5/conf.d/50-setting.ini
COPY 5.6/php-fpm.conf /etc/php5/php-fpm.conf
COPY 5.6/crontab /etc/crontabs/root
COPY 5.6/start.sh /
COPY 5.6/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY 5.6/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

WORKDIR /var/www/html

HEALTHCHECK --interval=30s --timeout=30s --start-period=600s --retries=3 CMD curl http://localhost:80/ || exit 1

ENTRYPOINT /start.sh
