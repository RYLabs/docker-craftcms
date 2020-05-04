FROM php:7-cli

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

RUN wget https://getcomposer.org/installer -O composer-setup.php
RUN php composer-setup.php --install-dir=/usr/bin --filename=composer

WORKDIR /usr/share/nginx/html
