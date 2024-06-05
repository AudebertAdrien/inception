FROM debian:buster

RUN	apt update -y && apt upgrade -y
RUN	apt install -y	nginx	\
			vim	\
			curl	\
			openssl	\
			net-tools

RUN	mkdir -p /etc/nginx/ssl
RUN	openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Perpignan/O=42/OU=42/CN=aaudeber.42.fr/UID=aaudeber"

RUN	mkdir -p /var/run/nginx
COPY	conf/nginx.conf /etc/nginx/nginx.conf

RUN	chmod 755 /var/www/html
RUN	chown -R www-data:www-data /var/www/html

#CMD	[ "nginx", "-g", "daemon off;" ]
