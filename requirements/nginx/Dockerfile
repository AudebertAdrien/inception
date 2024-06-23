FROM debian:buster

WORKDIR	/etc/nginx

RUN	apt update -y && apt upgrade -y
RUN	apt install -y	nginx	\
			vim	\
			curl	\
			openssl

RUN	mkdir -p /etc/nginx/ssl
RUN	openssl req -x509 -nodes \
	-out /etc/nginx/ssl/inception.crt \
	-keyout /etc/nginx/ssl/inception.key \
	-subj "/C=FR/ST=IDF/L=Perpignan/O=42/OU=42/CN=aaudeber.42.fr/UID=aaudeber"

COPY	nginx.conf ./conf.d 

EXPOSE	443

CMD ["nginx", "-g", "daemon off;"]
