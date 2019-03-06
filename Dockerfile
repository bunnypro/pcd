FROM php:<VERSION>-cli-alpine

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=bin --filename=composer \
    && php -r "unlink('composer-setup.php');" \
    && wget -O phpunit https://phar.phpunit.de/phpunit-7.phar \
    && chmod +x phpunit \
    && mv phpunit /bin/phpunit \
    && apk update --no-cache \
    && apk add --no-cache --virtual .build-deps $PHPIZE_DEPS zlib-dev \
    && docker-php-ext-install zip \
    && pecl install xdebug-2.7.0 \
    && docker-php-ext-enable xdebug \
    && apk del --no-cache .build-deps \
    && rm -rf /tmp/pear
