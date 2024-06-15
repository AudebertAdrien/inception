#!/bin/bash
set -e

echo "Starting MariaDB service..."
service mysql start

echo "Creating database if not exists..."
mariadb -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

echo "Creating user if not exists..."
mariadb -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"

echo "Granting all privileges to the user on the database..."
mariadb -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

echo "Updating root user password..."
mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

echo "Flushing privileges..."
mariadb -e "FLUSH PRIVILEGES;"

echo "Creating table if not exists..."
mariadb -e "USE \`${SQL_DATABASE}\`; CREATE TABLE IF NOT EXISTS example_table (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(100) NOT NULL, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);"

echo "Shutting down MariaDB..."
mysqladmin -u root -p"${SQL_ROOT_PASSWORD}" shutdown

echo "Restarting MariaDB in safe mode..."
exec mysqld_safe
