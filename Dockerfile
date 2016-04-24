FROM composer/composer:1.0.0-php5

RUN apt-get update && apt-get install -y \
    libicu-dev \
    && docker-php-ext-install -j$(nproc) iconv intl pdo pdo_mysql mbstring bcmath

RUN pecl install redis \
    && docker-php-ext-enable redis
