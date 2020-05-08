FROM rylabs/nginx-php-fpm

##################################################
# CRAFTCMS                                       #
##################################################

RUN apt-get update && apt-get install --no-install-recommends --no-install-suggests -y \
    libpq-dev \
    libmagickwand-dev \
    && apt-get remove --purge --auto-remove -y && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install -j$(nproc) pdo_pgsql \
    && pecl install imagick && docker-php-ext-enable imagick

ADD .dockerdev/php/craft.ini $PHP_INI_DIR/conf.d/craft.ini
ADD .dockerdev/nginx/default.conf /etc/nginx/conf.d/default.conf

WORKDIR /app

# run composer
COPY ./app/composer.* /app/
RUN mkdir /app/vendor
RUN composer install

COPY ./app /app

RUN chown www-data:www-data -R /app

