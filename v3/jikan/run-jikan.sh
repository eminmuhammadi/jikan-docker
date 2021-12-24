#!/usr/bin/env bash
# allow write permission
chmod -R a+w storage/

# Optimization
php artisan config:cache
php artisan route:cache

php artisan optimize --force
composer dumpautoload -o


# php:7.3.14-apache-buster ENTRYPOINT
# docker-php-entrypoint apache2-foreground
php -S 127.0.0.1:60080 -t public
