# Use stable PHP version
FROM php:8.4-cli

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git curl unzip libpq-dev libonig-dev libzip-dev zip \
    && docker-php-ext-install pdo pdo_mysql pdo_pgsql mbstring zip

# Install Composer (no external image!)
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/bin/composer

WORKDIR /var/www/html

# Copy composer files first
COPY composer.json composer.lock ./

# Force PHP version
RUN composer config platform.php 8.4

# Install dependencies
RUN composer install --no-dev --optimize-autoloader --no-scripts

# Copy app
COPY . .

# Laravel cleanup
RUN php artisan config:clear && \
    php artisan route:clear && \
    php artisan view:clear

EXPOSE 10000

CMD php -S 0.0.0.0:$PORT -t public