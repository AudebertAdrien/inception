FROM debian:buster

RUN apt-get update && apt-get install -y \
    wget \
    php7.3 \
    php7.3-fpm \
    php7.3-mysql \
    mariadb-client \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN wget --timeout=30 --tries=5 https://wordpress.org/latest.tar.gz -P /var/www && \
    cd /var/www && \
    tar -xzf latest.tar.gz && \
    rm latest.tar.gz
    #mv wordpress/* /var/www/html && \
    #chown -R www-data:www-data /var/www/html && \
    #chmod -R 755 /var/www/html

#COPY php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf

#EXPOSE 9000

#CMD ["php-fpm7.3", "-F"]
ENTRYPOINT ["tail", "-f", "/dev/null"]

