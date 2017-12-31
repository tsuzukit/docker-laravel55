FROM php:7.1.0-fpm-alpine

RUN apk --no-cache add curl libmcrypt-dev zlib-dev git
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer
RUN docker-php-ext-install pdo_mysql mysqli mbstring mcrypt zip
