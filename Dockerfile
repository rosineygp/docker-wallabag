FROM php:5-apache

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y \
        wget \
        libtidy-dev \
        libcurl4-openssl-dev \
        sqlite3 \
        libsqlite3-dev \
        gettext \
        gettext \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
        zip \
        unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


RUN docker-php-ext-install iconv mcrypt pdo_sqlite curl json tidy gettext gd mbstring zip pdo pdo_mysql

RUN wget https://github.com/wallabag/wallabag/archive/2.0.2.tar.gz && \
    tar -zxvf 2.0.2.tar.gz && \
    cp -rf wallabag-2.0.2/* /var/www/html  && \
    rm -rf wallabag-2.0.2  && \
    cd /var/www/html && \
    curl -s http://getcomposer.org/installer | php && \
    php composer.phar install && \
    chown -R www-data:www-data /var/www/html

VOLUME /var/www/html
EXPOSE 80
