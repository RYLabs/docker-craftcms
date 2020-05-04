FROM php:7-cli

RUN apt-get update && apt-get install -y \
  git \
  unzip \
  wget \
  libzip-dev \
  && docker-php-ext-install zip

RUN wget https://getcomposer.org/installer -O composer-setup.php
RUN php composer-setup.php --install-dir=/usr/bin --filename=composer

WORKDIR /usr/share/nginx/html
