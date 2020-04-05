FROM webdevops/php-nginx:alpine-php7

WORKDIR /app

ENV WEB_DOCUMENT_ROOT /app/public
ENV PHP_MEMORY_LIMIT 1024M
ENV FPM_RLIMIT_FILES '1000000'
ENV FPM_MAX_REQUESTS '2000'
ENV FPM_PM_START_SERVERS '30'
ENV FPM_PM_MIN_SPARE_SERVERS '20'
ENV FPM_PM_MAX_SPARE_SERVERS '30'
ENV FPM_REQUEST_TERMINATE_TIMEOUT '30'
ENV FPM_PM_MAX_CHILDREN '30'

RUN apk add --no-cache nodejs npm alpine-sdk openssl-dev php7-dev \
    && pecl install mongodb \
    && rm -rf /var/cache/apk/*
