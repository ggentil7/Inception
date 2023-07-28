#!/bin/sh

sleep 10

wp config create	--allow-root \
					--dbname=$WP_DATABASE \
					--dbuser=$WP_USER \
					--dbpass=$WP_PASSWORD \
					--dbhost=mariadb:3306 --path='/var/www/wordpress'