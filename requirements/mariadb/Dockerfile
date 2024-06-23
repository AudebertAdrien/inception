FROM debian:buster

RUN apt update -y && apt upgrade -y
RUN apt install -y 	mariadb-server	\
			mariadb-client	\
			vim

RUN rm -rf /var/lib/apt/lists/*

RUN mkdir -p /docker-entrypoint-initdb.d

RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld/
RUN chmod 777 /var/run/mysqld/

COPY ./50-server.cnf /etc/mysql/conf.d/50-server.cnf
COPY ./init_db.sh /docker-entrypoint-initdb.d

RUN chmod +x /docker-entrypoint-initdb.d/init_db.sh
RUN chmod +x /etc/mysql/conf.d/50-server.cnf

EXPOSE 3306

#ENTRYPOINT ["tail", "-f", "/dev/null"]
ENTRYPOINT ["/docker-entrypoint-initdb.d/init_db.sh"]


