FROM alpine:3.7

ENV TIMEZONE UTC
ENV PHP_MEMORY_LIMIT 512M
ENV MAX_UPLOAD 50M
ENV PHP_MAX_FILE_UPLOAD 200
ENV PHP_MAX_POST 100M

RUN apk update && apk upgrade && \
    apk add --update tzdata ssmtp && \
    apk add --update curl && \
    cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
    echo "${TIMEZONE}" > /etc/timezone && \
    apk add --update php7 && \
    apk add --update php7-fpm && \
    apk add --update php7-opcache && \
    apk add --update \
        php7-mbstring \
        php7-mcrypt \
        php7-soap \
        php7-openssl \
        php7-gmp \
        php7-pdo_odbc \
        php7-json \
        php7-dom \
        php7-pdo \
        php7-zip \
        php7-mysqli \
        php7-sqlite3 \
        php7-apcu \
        php7-pdo_pgsql \
        php7-bcmath \
        php7-gd \
        php7-odbc \
        php7-opcache \
        php7-pdo_mysql \
        php7-pdo_sqlite \
        php7-pgsql \
        php7-gettext \
        php7-xmlreader \
        php7-xmlrpc \
        php7-ldap \
        php7-bz2 \
        php7-memcached \
        php7-iconv \
        php7-pdo_dblib \
        php7-curl \
        php7-ctype \
        php7-zlib && \
    sed -i -e "s/;daemonize\s*=\s*yes/daemonize = no/g" /etc/php7/php-fpm.conf && \
    sed -i "s#;pid = /run/php-fpm7.pid#pid = /run/php-fpm7.pid#g" /etc/php7/php-fpm.conf && \
    sed -i "s#;events.mechanism = epoll#events.mechanism = epoll#g" /etc/php7/php-fpm.conf && \
    sed -i "s#;log_level = notice#log_level = error#g" /etc/php7/php-fpm.conf && \
    sed -i -e "s/listen\s*=\s*127.0.0.1:9000/listen = 127.0.0.1:9000/g" /etc/php7/php-fpm.d/www.conf && \
    sed -i "s/;listen.owner = nobody/listen.owner = nobody/g" /etc/php7/php-fpm.d/www.conf && \
    sed -i "s/;listen.group = nobody/listen.group = nobody/g" /etc/php7/php-fpm.d/www.conf && \
    sed -i "s|;date.timezone =.*|date.timezone = ${TIMEZONE}|" /etc/php7/php.ini && \
    sed -i "s|memory_limit =.*|memory_limit = ${PHP_MEMORY_LIMIT}|" /etc/php7/php.ini && \
    sed -i "s|upload_max_filesize =.*|upload_max_filesize = ${MAX_UPLOAD}|" /etc/php7/php.ini && \
    sed -i "s|max_file_uploads =.*|max_file_uploads = ${PHP_MAX_FILE_UPLOAD}|" /etc/php7/php.ini && \
    sed -i "s|post_max_size =.*|max_file_uploads = ${PHP_MAX_POST}|" /etc/php7/php.ini && \
    sed -i "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/" /etc/php7/php.ini && \
    sed -i "s|;error_log = syslog|error_log = /var/log/php_errors.log|" /etc/php7/php.ini && \
    sed -i "s|;opcache.enable=1|opcache.enable=1|" /etc/php7/php.ini && \
    sed -i "s|;opcache.enable_cli=0|opcache.enable_cli=1|" /etc/php7/php.ini && \
    sed -i "s|;opcache.max_wasted_percentage=5|opcache.max_wasted_percentage=10|" /etc/php7/php.ini && \
    sed -i "s|;opcache.use_cwd=1|opcache.use_cwd=1|" /etc/php7/php.ini && \
    sed -i "s|;opcache.validate_timestamps=1|opcache.validate_timestamps=0|" /etc/php7/php.ini && \
    sed -i "s|;opcache.log_verbosity_level=1|opcache.log_verbosity_level=1|" /etc/php7/php.ini && \
    sed -i "s|max_execution_time = 32|max_execution_time = 120|" /etc/php7/php.ini && \
    sed -i "s|session.gc_maxlifetime = 1440|session.gc_maxlifetime = 7200|" /etc/php7/php.ini && \
    echo "FromLineOverride=YES" >> /etc/ssmtp/ssmtp.conf && \
    echo 'sendmail_path = "/usr/sbin/ssmtp -t"' >> /etc/php7/php.ini && \
    apk del tzdata && \
    rm -rf /var/cache/apk/*

# Expose ports
EXPOSE 9000

# Entry point
ENTRYPOINT ["/usr/sbin/php-fpm7"]
CMD ["--nodaemonize"]
