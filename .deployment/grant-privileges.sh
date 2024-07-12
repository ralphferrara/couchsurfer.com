#!/bin/bash
set -e

echo "Initializing database..."
ls -l /docker-entrypoint-initdb.d  # Optional: List directory contents

# Wait for the MariaDB server to be ready
echo "Waiting for MariaDB server to be ready..."
until mysqladmin ping -h "localhost" --silent; do
  echo -n "."; sleep 1
done
echo -e "\nMariaDB server is ready."

# Grant necessary privileges for remote connections
echo "Granting privileges..."
mysql -h "localhost" -u root -p"$MYSQL_ROOT_PASSWORD" --binary-mode=1 -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;"

# Initialize the database
echo "Starting database initialization..."
mysql -h "localhost" -u root -p"$MYSQL_ROOT_PASSWORD" --binary-mode=1 "$MYSQL_DATABASE" < /docker-entrypoint-initdb.d/database.sql

if [ $? -eq 0 ]; then
  echo "Database initialized successfully."
else
  echo "Error initializing database."
fi
