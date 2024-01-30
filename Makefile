COMPOSE := docker compose
COMPOSE_FILE := srcs/docker-compose.yml

all : up

#Create and start containers
up :
	mkdir -p ~/data/wordpress;
	mkdir -p ~/data/mariadb;
	$(COMPOSE) -f $(COMPOSE_FILE) up -d --build

#Stop and remove containers, networks by default
down :
	$(COMPOSE) -f $(COMPOSE_FILE) down
	
#start services
start :
	$(COMPOSE) -f $(COMPOSE_FILE) start

stop :
	$(COMPOSE) -f $(COMPOSE_FILE) stop

#stop services; delete containers; delete images; delete volumes; delete networks
clean :
	docker stop $$(docker ps -qa); docker rm $$(docker ps -qa);
	docker rmi -f $$(docker images -qa);
	docker volume rm $$(docker volume ls -q);
	docker network rm $$(docker network ls -qf "name=inception") 2>/dev/null

fclean : clean
	sudo rm -rf ~/data

sclean :
	docker system prune

#list containers
status :
	$(COMPOSE) -f $(COMPOSE_FILE) ps

