#!/bin/bash
set -e

if [ ! -d /var/lib/mysql/mysql ]; then
	echo "Initializing database..."
	mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
	chown -R mysql:mysql /var/lib/mysql
fi

echo "Starting MariaDB service..."
service mysql start

while [ ! -e /var/run/mysqld/mysqld.sock]; do
	echo "Still waiting..."
	sleep 2
done

echo "Creating database if not exists..."
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

echo "Creating user if not exists..."
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"

echo "Granting all privileges to the user on the database..."
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%';"

echo "Updating root user password..."
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

echo "Flushing privileges..."
mysql -e "FLUSH PRIVILEGES;"

echo "Creating table if not exists..."
mysql -e "USE \`${SQL_DATABASE}\`; CREATE TABLE IF NOT EXISTS example_table (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(100) NOT NULL, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);"

echo "Shutting down MariaDB..."
mysqladmin -u root -p"${SQL_ROOT_PASSWORD}" shutdown

echo "Restarting MariaDB in safe mode..."
exec mysqld_safe
