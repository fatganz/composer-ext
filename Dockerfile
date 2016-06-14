FROM composer/composer:1.1-php5

RUN apt-get update && apt-get install -y \
    libicu-dev \
    php5-redis \
    && docker-php-ext-install -j$(nproc) iconv intl pdo pdo_mysql mbstring bcmath

RUN useradd -ms /bin/bash composer
USER composer
