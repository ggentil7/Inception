#!/bin/bash

sleep 10

mkdir -p /run/php

cd /var/www/wordpress/

wp core install --allow-root \
    --url=${WP_URL} \
    --title=${WP_TITLE} \
    --admin_user=${WP_USER} \
    --admin_email=${WP_EMAIL} \
    --admin_password=${WP_ADMIN_PASSWORD}

wp user create --allow-root\
    ${WP_NEW_USER}\
    ${WP_EMAIL_NEW_USER} \
    --role=author\
    --user_pass=${WP_NEW_PDW}

/usr/sbin/php-fpm7.3 --nodaemonize
