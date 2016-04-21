FROM composer/composer:1.0.0

RUN apt-get update && apt-get install -y \
    libicu-dev \
    && docker-php-ext-install -j$(nproc) iconv intl pdo pdo_mysql mbstring bcmath

RUN pecl install apcu-4.0.10 \
    && pecl install redis \
    && docker-php-ext-enable apcu redis
