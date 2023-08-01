FROM debian:buster

RUN apt-get update
RUN apt-get install -y mariadb-server \
    zsh \
    vim 

COPY my_conf.cnf /etc/mysql/mariadb.conf.d/my_conf.cnf 

COPY mariadb.sh /

RUN chmod +x mariadb.sh


CMD ["./mariadb.sh"]
