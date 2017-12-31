FROM mysql:5.7.16
COPY my.cnf /etc/mysql/my.cnf
ADD ./sql/mysql-create-database.sql /docker-entrypoint-initdb.d/
ADD ./sql/mysql-create-user.sql /docker-entrypoint-initdb.d/

