.PHONY: all build up down clean logs

all: build up

build:
	@echo "Building Docker images..."
	sudo mkdir -p /home/aaudeber/data/db /home/aaudeber/data/wp
	sudo docker compose build

up:
	@echo "Starting Docker containers..."
	sudo docker compose up -d

down:
	@echo "Stopping Docker containers..."
	sudo docker compose -f ./docker-compose.yaml down --rmi all -v

clean: down
	@echo "Cleaning up Docker resources..."
	sudo docker volume rm -f /home/aaudeber/data

logs:
	@echo "Displaying Docker logs..."
	sudo docker compose logs -f

re:	clean build up
