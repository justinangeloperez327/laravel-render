#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

echo "Running composer install..."
composer install --no-dev --working-dir=/var/www/html

echo "Running npm install..."
npm install --prefix /var/www/html

echo "Running npm run prod..."
npm run build --prefix /var/www/html

echo "Running cache clear..."
php artisan cache:clear

echo "Running config clear..."
php artisan config:clear

echo "Running route clear..."
php artisan route:clear

echo "Running view clear..."
php artisan view:clear

echo "Running config cache..."
php artisan config:cache

echo "Running route cache..."
php artisan route:cache

echo "Running view cache..."
php artisan view:cache

echo "Running optimize..."
php artisan optimize

echo "Running migrations..."
php artisan migrate --force
