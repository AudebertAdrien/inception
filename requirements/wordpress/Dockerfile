FROM wordpress:latest

WORKDIR /var/www/html

RUN apt update && apt upgrade -y

RUN apt update && apt install -y \
    wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Configure PHP and WordPress settings
# COPY php.ini /usr/local/etc/php/conf.d/custom.ini
# COPY wp-config.php /var/www/html/wp-config.php

RUN chown -R www-data:www-data /var/www/html

EXPOSE 80

CMD ["apache2-foreground"]

