# install PHP / Apache
FROM php:7.1-apache

WORKDIR /var/www

# Install server packages
RUN apt-get update && \
    apt-get install -y git zip unzip && \
    docker-php-ext-install mysqli pdo pdo_mysql && \
    apt-get -y autoremove && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    a2enmod rewrite

# copy all files to root directory
COPY . .