#!/bin/bash
set -e

echo "Starting MariaDB service..."
service mysql start

echo "Creating user if not exists..."
echo "CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';" | mysql

echo "Granting all privileges to the user on the database..."
echo "GRANT ALL PRIVILEGES ON *.* TO '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASSWORD';" | mysql

#echo "Granting all privileges to the root on the database..."
#echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$SQL_ROOT_PASSWORD';" | mysql

echo "Flushing privileges..."
echo "FLUSH PRIVILEGES;" | mysql

echo "Creating database if not exists..."
echo "CREATE DATABASE IF NOT EXISTS $SQL_DATABASE;" | mysql

echo "Shutting down MariaDB..."
kill $(cat /var/run/mysqld/mysqld.pid)

echo "Restarting MariaDB..."
mysqld
