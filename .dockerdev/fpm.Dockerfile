FROM php:7-fpm

RUN apt-get update && apt-get install -y \
  git \
  unzip \
  wget \
  libzip-dev \
  && docker-php-ext-install zip

COPY .dockerdev/fpm.ini $PHP_INI_DIR/conf.d/