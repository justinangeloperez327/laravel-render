#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Running composer install..."
composer install --no-dev --working-dir=/var/www/html

echo "Running npm install..."
npm install --prefix /var/www/html

echo "Running npm run prod..."
npm run build --prefix /var/www/html

echo "Running migrations..."
php artisan migrate --force
