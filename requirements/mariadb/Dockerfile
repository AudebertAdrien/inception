FROM debian:buster

RUN apt update -y && apt upgrade -y
RUN apt install -y 	mariadb-server	\
			vim

#RUN rm -rf /var/lib/apt/lists/*

RUN mkdir -p /docker-entrypoint-initdb.d

COPY ./init_db.sh /docker-entrypoint-initdb.d
COPY ./50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod +x /docker-entrypoint-initdb.d/init_db.sh
RUN chmod +x /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

#ENTRYPOINT ["tail", "-f", "/dev/null"]
ENTRYPOINT ["/docker-entrypoint-initdb.d/init_db.sh"]
#CMD ["mysqld", "--bind-address=0.0.0.0"]
