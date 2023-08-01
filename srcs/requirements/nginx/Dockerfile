FROM    debian:buster

#install all the program
RUN     apt-get update
RUN     apt-get install -y nginx \
        openssl

# nginx SSL
RUN     mkdir /etc/nginx/ssl
RUN     openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/ggentil.crt \
        -keyout /etc/nginx/ssl/ggentil.key \
        -subj "/C=CH/ST=Vaud/L=Renens/O=42/OU=ggentil/CN=ggentil.42.fr/UID=login"

# nginx config
RUN mkdir -p /var/run/nginx

COPY ./conf/default.conf /etc/nginx/conf.d

RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html

# Start nginx
CMD ["nginx", "-g", "daemon off;"]