FROM php:7.1-cli-alpine

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=bin --filename=composer \
    && php -r "unlink('composer-setup.php');" \
    && wget -O phpunit https://phar.phpunit.de/phpunit-7.phar \
    && chmod +x phpunit \
    && mv phpunit /bin/phpunit \
    && ln -s /bin/phpunit /usr/local/lib/php/phpunit \
    && apk update --no-cache \
    && apk add --no-cache --virtual .build-deps $PHPIZE_DEPS zlib-dev \
    && docker-php-ext-install zip \
    && pecl install xdebug-2.6.1 \
    && docker-php-ext-enable xdebug \
    && echo "xdebug.profiler_enable_trigger = 1;" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && apk del --no-cache .build-deps \
    && rm -rf /tmp/pear
