#!/bin/bash
set -e

echo "Starting MariaDB service..."
service mysql start

#echo "CREATE USER 'root'@'%' IDENTIFIED BY 'yourpassword';" | mysql
#GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
#FLUSH PRIVILEGES;


#echo "Creating user if not exists..."
#echo "CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';" | mysql 

#echo "Granting all privileges to the user on the database..."
#echo "GRANT ALL PRIVILEGES ON *.* TO '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';" | mysql
#echo "test"
#echo "SELECT user, host FROM mysql.user;" | mysql

echo "Granting all privileges to the root on the database..."
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';" 


#echo "Flushing privileges..."
#mysql -e "FLUSH PRIVILEGES;" 

#echo "Creating database if not exists..."
#echo "CREATE DATABASE IF NOT EXISTS '$SQL_DATABASE';" | mysql

#echo "Shutting down MariaDB..."
#kill $(cat /var/run/mysqld/mysqld.pid)

#echo "Restarting MariaDB..."
#mysqld_safe
#mysql -u root -p$MYSQL_ROOT_PASSWORD
#mysql

#exec "$@"
