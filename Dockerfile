FROM php:8.2-apache

RUN apt-get update && apt-get install -y \
    tesseract-ocr \
    unzip \
    zip \
    git

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html

COPY . .

RUN composer install

RUN mkdir -p uploads && chmod 777 uploads

EXPOSE 80