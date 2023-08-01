#!/bin/sh

#service mysql start;

#sleep 5

# Connexion et création de la base de données
#mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "CREATE DATABASE ${MYSQL_DATABASE}"

# Connexion et création de l'utilisateur
#mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "CREATE USER '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}'"

# Attribution des privilèges à l'utilisateur
#mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}'"

# Sauvegarde des privilèges
#mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES"

# Démarrage du serveur MariaDB
#exec mysqld_safe

#sh


service mysql start;
sleep 5

mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
mysql -u root -p"${MY_SQL_ROOT_PASSWORD}" -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -u root -p"${MY_SQL_ROOT_PASSWORD}" -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -u root -p"${MY_SQL_ROOT_PASSWORD}" -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MY_SQL_ROOT_PASSWORD}';"
mysql -u root -p"${MY_SQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p"${MY_SQL_ROOT_PASSWORD}" shutdown

exec mysqld_safe
