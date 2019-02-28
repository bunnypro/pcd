FROM php:7.2-cli-alpine

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=bin --filename=composer \
    && php -r "unlink('composer-setup.php');" \
    && wget -O phpunit https://phar.phpunit.de/phpunit-7.phar \
    && chmod +x phpunit \
    && mv phpunit /bin/phpunit \
    && apk update --no-cache \
    && apk add --no-cache --virtual .build-deps $PHPIZE_DEPS zlib-dev \
    && apk add --no-cache libstdc++ \
    && docker-php-ext-install zip \
    && pecl install swoole \
    && docker-php-ext-enable swoole \
    && pecl install xdebug-2.6.1 \
    && docker-php-ext-enable xdebug \
    && apk del --no-cache .build-deps \
    && rm -rf /tmp/pear