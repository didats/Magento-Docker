FROM php:8.2-fpm

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        unzip \
        git \
        curl \
        libpng-dev \
        libjpeg-dev \
        libfreetype6-dev \
        libzip-dev \
        libonig-dev \
        libxml2-dev \
        libicu-dev \
        libxslt1-dev \
        libssl-dev \
        libcurl4-openssl-dev \
        libgd-dev \
        zlib1g-dev \
        && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install pdo_mysql mbstring zip exif pcntl bcmath intl gd soap xsl sockets ftp

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
