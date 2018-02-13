FROM nginx
COPY www /usr/share/nginx/html
COPY config /etc/nginx
