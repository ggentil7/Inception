FROM    debian:buster

#install all the program
RUN     apt-get update
RUN     apt-get install -y nginx \
        openssl

# nginx SSL
#RUN     mkdir /etc/nginx/ssl
#RUN     RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
     #  -out /etc/nginx/ssl/vbachele.crt \
      # -keyout /etc/nginx/ssl/vbachele.key \
      # -subj "/C=CH/ST=Vaud/L=Renens/O=42 Lausanne/OU=ggentil/CN=ggentil"

#COPY ./conf/nginx.conf /etc/nginx/conf.d

# nginx config
#RUN mkdir -p /run/nginx

#the only port allowed
EXPOSE	443

# Start nginx
CMD ["nginx", "-g", "daemon off;"]