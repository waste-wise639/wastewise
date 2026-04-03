# Use stable PHP version
FROM php:8.4-cli

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git curl unzip libpq-dev libonig-dev libzip-dev zip \
    && docker-php-ext-install pdo pdo_mysql pdo_pgsql mbstring zip

# Install Composer (SAFE WAY)
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/bin/composer

WORKDIR /var/www/html

# Copy composer files first (better caching)
COPY composer.json composer.lock ./

# Force PHP version for Composer
RUN composer config platform.php 8.4

# Install dependencies
RUN composer install --no-dev --optimize-autoloader --no-scripts

# Copy rest of the app
COPY . .

# Laravel optimization
RUN php artisan config:clear && \
    php artisan route:clear && \
    php artisan view:clear

# Expose Render port
EXPOSE 10000

# Start Laravel
CMD php -S 0.0.0.0:$PORT -t public