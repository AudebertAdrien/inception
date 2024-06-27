#!/bin/bash
set -e

echo "Starting MariaDB service..."
service mysql start

echo "Granting all privileges to the root on the database..."
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';" 

echo "Flushing privileges..."
mysql -e "FLUSH PRIVILEGES;" 

echo "Creating database if not exists..."
mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"

sleep 1
echo "Shutting down MariaDB..."
service mysql stop

echo "Restarting MariaDB..."
exec "$@"
