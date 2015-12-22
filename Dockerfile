FROM php:7.0-fpm

# Install modules
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        libicu-dev \
        libsqlite-dev \
        libsqlite3-dev \
    && docker-php-ext-install intl iconv mcrypt pdo pdo_mysql pdo_sqlite mbstring tokenizer\
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && docker-php-ext-install opcache

CMD ["php-fpm"]
