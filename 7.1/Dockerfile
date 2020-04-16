FROM alpine:3.7
LABEL Maintainer="Douglas Andrade <douglasanpa@gmail.com>" \
      Description="Docker Image for PHP with CRON"
RUN apk --update add supervisor curl php7 bash nginx  && \
      apk search -qe 'php7-*' | xargs apk --no-cache add && \
      rm -rf /etc/crontabs/root && rm -rf /var/cache/apk/*

COPY php.ini /etc/php7/conf.d/50-setting.ini
COPY php-fpm.conf /etc/php5/php-fpm.conf
COPY crontab /etc/crontabs/root
COPY start.sh /
COPY nginx.conf /etc/nginx/nginx.conf
COPY supervisord7.conf /etc/supervisor/conf.d/supervisord.conf
EXPOSE 80

WORKDIR /var/www/html

HEALTHCHECK --interval=30s --timeout=30s --start-period=600s --retries=3 CMD curl http://localhost:80/ || exit 1

ENTRYPOINT /start.sh
