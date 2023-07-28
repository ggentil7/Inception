FROM debian:buster

RUN apt-get update
RUN apt-get install
RUN apt-get -y install wget

RUN apt-get install -y php7.3\
						php-fpm\
						php-mysql\
						mariadb-client

RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www

RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

RUN	chown -R root:root /var/www/wordpress

COPY www.conf /etc/php/7.3/fpm/pool.d/

COPY "./entrypoint.sh" .

RUN chmod +x entrypoint.sh

RUN mkdir /var/www/html

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000


CMD ["./entrypoint.sh"]
