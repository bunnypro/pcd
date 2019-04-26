FROM php:7.3-cli-alpine

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=bin --filename=composer \
    && php -r "unlink('composer-setup.php');" \
    && wget -O phpunit https://phar.phpunit.de/phpunit-8.phar \
    && chmod +x phpunit \
    && mv phpunit /bin/phpunit \
    && apk update --no-cache \
    && apk add --no-cache --virtual .build-deps $PHPIZE_DEPS \
    && apk add --no-cache libzip-dev libstdc++ \
    && docker-php-ext-install zip \
    && pecl install swoole \
    && docker-php-ext-enable swoole \
    && pecl install xdebug-2.7.0 \
    && docker-php-ext-enable xdebug \
    && apk del --no-cache .build-deps \
    && rm -rf /tmp/pear
