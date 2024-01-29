COMPOSE := docker compose
COMPOSE_FILE := srcs/docker-compose.yml

all : up

#Create and start containers
up :
	mkdir -p ~/data/wordpress;
	mkdir -p ~/data/mariadb;
	$(COMPOSE) -f $(COMPOSE_FILE) up -d --build

#Stop services
#stop :
#	$(COMPOSE) -f $(COMPOSE_FILE) stop

#list containers
status :
	$(COMPOSE) -f $(COMPOSE_FILE) ps

clean :
	docker stop $$(docker ps -qa); docker rm $$(docker ps -qa);
	docker rmi -f $$(docker images -qa);
	docker volume rm $$(docker volume ls -q);
	docker network rm $$(docker network ls -qf "name=inception") 2>/dev/null

fclean : clean
	sudo rm -rf ~/data 2>delete.log

sclean :
	docker system prune

#Stop and remove containers, networks
down :
	$(COMPOSE) -f $(COMPOSE_FILE) down

#start services
start :
	$(COMPOSE) -f $(COMPOSE_FILE) start