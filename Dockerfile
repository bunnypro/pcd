FROM php:7.2-cli-alpine

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=bin --filename=composer \
    && php -r "unlink('composer-setup.php');" \
    && wget -O phpunit https://phar.phpunit.de/phpunit-7.phar \
    && chmod +x phpunit \
    && mv phpunit /bin/phpunit \
    && ln -s /bin/phpunit /usr/local/lib/php/phpunit \
    && apk update --no-cache \
    && apk add --no-cache $PHPIZE_DEPS \
    && pecl install xdebug-2.6.0 \
    && docker-php-ext-enable xdebug \
    && apk del --no-cache --purge $PHPIZE_DEPS
