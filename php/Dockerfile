FROM php:8.2-apache

# PDO MySQL を有効化
RUN docker-php-ext-install pdo pdo_mysql

# Apache DocumentRoot
WORKDIR /var/www/html

# PHPファイル配置
COPY index.php /var/www/html/

# 権限調整
RUN chown -R www-data:www-data /var/www/html