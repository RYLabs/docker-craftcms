FROM docker-craftcms-composer:latest as composer
FROM php:7-fpm

RUN apt-get update && apt-get install -y \
  libzip-dev \
  libpq-dev \
  libmagickwand-dev \
  --no-install-recommends \
  && docker-php-ext-install -j$(nproc) pdo_pgsql \
  && pecl install imagick && docker-php-ext-enable imagick

COPY .dockerdev/fpm.ini $PHP_INI_DIR/conf.d/

WORKDIR /app

COPY ./app /app
COPY --from=composer /app/vendor /app/vendor
