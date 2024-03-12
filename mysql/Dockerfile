# Use the official MySQL image as the base
FROM mysql:latest
ENV MYSQL_ROOT_PASSWORD=supersecretpassw0rd

# Set the working directory to /docker-entrypoint-initdb.d, which is a special directory in the MySQL image
WORKDIR /docker-entrypoint-initdb.d

# Copy the SQL scripts into the container
COPY sakila-schema.sql ./sakila-schema.sql
COPY sakila-data.sql ./sakila-data.sql

# The MySQL image will automatically execute SQL scripts in /docker-entrypoint-initdb.d when the container starts