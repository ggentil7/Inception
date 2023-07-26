FROM debian:buster

RUN apt-get update
RUN apt-get install -y mariadb-server \
    mariadb-client \
    zsh \
    vim 

COPY my_conf.cnf /etc/mysql
COPY my_conf.cnf /etc/my_conf.cnf
COPY "./mariadb.sh" .


CMD ["./mariadb.sh"]
