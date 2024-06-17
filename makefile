.PHONY: all build up down clean logs

all: build up

build:
	@echo "Building Docker images..."
	sudo docker compose build

up:
	@echo "Starting Docker containers..."
	sudo docker compose up -d

down:
	@echo "Stopping Docker containers..."
	sudo docker compose down

clean: down
	@echo "Cleaning up Docker resources..."
	sudo docker system prune -a
	sudo docker volume rm -f $(docker volume ls -q)

logs:
	@echo "Displaying Docker logs..."
	sudo docker compose logs -f

re:	clean build up
