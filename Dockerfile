FROM nginx

EXPOSE 80
EXPOSE 443


RUN rm /usr/share/nginx/html/*
COPY www/* /usr/share/nginx/html
COPY config /etc/nginx

RUN ls /usr/share/nginx/html

RUN apt-get update && \
	apt-get install certbot -y
