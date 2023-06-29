NAME    =    inception

COMPOSE    =    -f srcs/docker-compose.yml
ENV        =    --env-file srcs/.env
DOCK    =    docker-compose ${COMPOSE} ${ENV} -p ${NAME}

all:     build start

build:
        ${DOCK} build --no-cache

start:
        ${DOCK} up -d

wordpress:
        ${DOCK} build wordpress
        ${DOCK} up -d wordpress

nginx:
        ${DOCK} build nginx
        ${DOCK} up -d nginx

mariadb:
        ${DOCK} build mariadb
        ${DOCK} up -d mariadb

down:
        ${DOCK} down
clean:
        ${DOCK} down --volumes

vclean:
        docker volume prune -f

iclean:
        docker system prune -a --force

aclean : clean vclean iclean

re:        clean all

mariadbrun:
        ${DOCK} exec mariadb sh

wprun:
        ${DOCK} exec wordpress sh

ngrun:
        ${DOCK} exec nginx sh

.PHONY:    all build wordpress nginx mariadb start down clean vclean aclean re