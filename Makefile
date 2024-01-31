COMPOSE := docker compose
COMPOSE_FILE := srcs/docker-compose.yml

all : dir
	$(COMPOSE) -f $(COMPOSE_FILE) up -d --build

build:
	$(COMPOSE) -f $(COMPOSE_FILE) build

#Create and start containers
up :
	$(COMPOSE) -f $(COMPOSE_FILE) up -d

#Stop and remove containers, networks by default
down :
	$(COMPOSE) -f $(COMPOSE_FILE) down

#start services
start :
	$(COMPOSE) -f $(COMPOSE_FILE) start

stop :
	$(COMPOSE) -f $(COMPOSE_FILE) stop

#stop containers; delete containers; delete images; delete volumes; delete networks for evaluation
#clean :
#	docker stop $$(docker ps -qa); docker rm $$(docker ps -qa);
#	docker rmi -f $$(docker images -qa);
#	docker volume rm $$(docker volume ls -q);
#	docker network rm $$(docker network ls -qf "name=inception") 2>/dev/null

#stop containers; delete containers; delete images; delete volumes; delete networks
clean :
	$(COMPOSE) -f $(COMPOSE_FILE) down --rmi all -v

fclean : clean
	sudo rm -rf ~/data

sclean :
	docker system prune

dir :
	mkdir -p ~/data/wordpress;
	mkdir -p ~/data/mariadb;

#list containers
status :
	$(COMPOSE) -f $(COMPOSE_FILE) ps

.PHONY: all build up down start stop clean fclean sclean dir status