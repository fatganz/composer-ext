FROM composer:1.6

RUN apk --no-cache --virtual .build-deps add icu-dev autoconf \
		dpkg-dev dpkg \
		file \
		g++ \
		gcc \
		libc-dev \
		make \
		pkgconf \
		re2c \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && docker-php-ext-install -j$(nproc) iconv intl pdo pdo_mysql mbstring bcmath \
    && apk del .build-deps \
    && apk --no-cache add icu-dev
