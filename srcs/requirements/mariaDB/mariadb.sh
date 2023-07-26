#!/bin/sh

mariadb-install-db

mariadbd-safe --datadir='/var/lib/mysql' --no-watch

sleep 5

mariadb -e "CREATE DATABASE $MYSQL_DATABASE"
mariadb -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'"
echo $MYSQL_PASSWORD
mariadb -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* to '$MYSQL_USER'@'%'"

mariadb -e "FLUSH PRIVILEGES"
sleep 3
mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED VIA '' USING PASSWORD('$MYSQL_ROOT_PASSWORD')"
sleep 3

pkill maria
sleep 3

mariadbd-safe --datadir='/var/lib/mysql'


#sh