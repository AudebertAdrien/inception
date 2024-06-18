#!/bin/bash
set -e

echo "Starting MariaDB service..."
service mysql start

echo "Creating user if not exists..."
mysql -u root -p"$SQL_ROOT_PASSWORD" -e "CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';"

echo "Granting all privileges to the user on the database..."
mysql -u root -p"$SQL_ROOT_PASSWORD" -e "GRANT ALL PRIVILEGES ON *.* TO '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';"

echo "Granting all privileges to the root on the database..."
mysql -u root -p"$SQL_ROOT_PASSWORD" -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$SQL_ROOT_PASSWORD';"

echo "Creating database if not exists..."
mysql -u root -p"$SQL_ROOT_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;"

echo "Flushing privileges..."
mysql -u root -p"$SQL_ROOT_PASSWORD" -e "FLUSH PRIVILEGES;"

echo "Shutting down MariaDB..."
kill -SIGTERM $(cat /var/run/mysqld/mysqld.pid)

echo "Restarting MariaDB in safe mode..."
exec mysqld_safe
