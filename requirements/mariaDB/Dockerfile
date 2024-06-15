FROM debian:buster

RUN apt update -y && apt upgrade -y
RUN apt install -y mariadb-server

RUN sudo userdel mysql
RUN sudo useradd --uid 999 mysql

RUN sudo mkdir -p /data/mysql
RUN sudo chown -R mysql:mysql /data/mysql

COPY conf/50-server.cnf /etc/mysql/conf.d/50-server.cnf
COPY init_db.sh /docker-entrypoint-initdb.d/

RUN chmod 644 /etc/mysql/conf.d/50-server.cnf
RUN chmod +x /docker-entrypoint-inidb.d/init_db.sh

EXPOSE 3306

CMD ["sh", "-c", "/docker-entrypoint-initdb.d/init_db.sh"]

