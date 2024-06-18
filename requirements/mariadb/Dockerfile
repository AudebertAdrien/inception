FROM debian:buster

RUN apt update -y && apt upgrade -y
RUN apt install -y mariadb-server

RUN mkdir -p /docker-entrypoint-initdb.d

COPY ./50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./init_db.sh /docker-entrypoint-initdb.d

RUN mkdir -p /var/lib/mysql
RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/lib/mysql/
RUN chown -R mysql:mysql /var/run/mysqld/
RUN chmod 755 /var/lib/mysql/ /var/run/mysqld/

RUN chmod +x /docker-entrypoint-initdb.d/init_db.sh

EXPOSE 3306

#CMD ["sh", "-c", "/docker-entrypoint-initdb.d/init_db.sh"]
ENTRYPOINT ["tail", "-f", "/dev/null"]


