FROM nginx

EXPOSE 80
EXPOSE 443


RUN rm /usr/share/nginx/html/*
COPY www/* /usr/share/nginx/html
COPY config /etc/nginx

RUN ls /usr/share/nginx/html

#VOLUME /etc/letsencryp
RUN apt-get update && \
	apt-get install certbot -y

#RUN add-apt-repository ppa:certbot/certbot -y
#RUN	apt-get update && \
#	apt-get install python-certbot-nginx -y


#RUN certbot --authenticator webroot --installer nginx  \
#	--agree-tos --email max.dstu@gmail.com --quiet \
#	--domains web-tree.org \
#	--webroot-path web-tree.org
