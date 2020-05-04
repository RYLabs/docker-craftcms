FROM php:7-fpm

RUN apt-get update && apt-get install -y \
  git \
  unzip \
  wget \
  libzip-dev \
  libpq-dev \
  libmagickwand-dev \
  --no-install-recommends \
  && docker-php-ext-install -j$(nproc) zip \
  && docker-php-ext-install -j$(nproc) pdo_pgsql \
  && pecl install imagick && docker-php-ext-enable imagick

COPY .dockerdev/fpm.ini $PHP_INI_DIR/conf.d/