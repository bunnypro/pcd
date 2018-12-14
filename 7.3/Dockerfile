FROM php:7.3-cli-alpine

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=bin --filename=composer \
    && php -r "unlink('composer-setup.php');" \
    && wget -O phpunit https://phar.phpunit.de/phpunit-7.phar \
    && chmod +x phpunit \
    && mv phpunit /bin/phpunit \
    && ln -s /bin/phpunit /usr/local/lib/php/phpunit
