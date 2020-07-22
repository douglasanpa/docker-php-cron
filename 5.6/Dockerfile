FROM alpine:3.8
LABEL Maintainer="Douglas Andrade <douglasanpa@gmail.com>" \
      Description="Docker Image for PHP with CRON"

ENV GOROOT /usr/lib/go
ENV GOPATH /go
ENV PATH /go/bin:$PATH

RUN apk --update --no-cache add supervisor curl php5 bash nginx git make musl-dev go graphviz graphviz-graphs \
      font-bitstream-type1 ghostscript-fonts && \
      apk search -qe 'php5-*' | xargs apk --no-cache add && \
      apk add -U --no-cache -t .libiconv-deps -X http://dl-cdn.alpinelinux.org/alpine/v3.10/community gnu-libiconv=1.15-r2 && \
      mkdir -p ${GOPATH}/src ${GOPATH}/bin && go get github.com/korylprince/fileenv &&\
      rm -rf /etc/crontabs/root && rm -rf /var/cache/apk/*

ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so

COPY php.ini /etc/php5/conf.d/50-setting.ini
COPY php-fpm.conf /etc/php5/php-fpm.conf
COPY crontab /etc/crontabs/root
COPY start.sh /
COPY nginx.conf /etc/nginx/nginx.conf
COPY supervisord5.conf /etc/supervisor/conf.d/supervisord.conf
EXPOSE 80

WORKDIR /var/www/html

HEALTHCHECK --interval=10s --timeout=5s --start-period=30s --retries=3 CMD netstat -an | fgrep 80 | fgrep -q LISTEN

ENTRYPOINT fileenv /start.sh
