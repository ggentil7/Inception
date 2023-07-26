#!/bin/sh

mariadb-install-db

mariadbd-safe --datadir='/var/lib/mysql' --no-watch

sleep 5

mariadb -e "CREATE DATABASE $MYSQL_DATABASE"



#sh