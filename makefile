.PHONY: all build down clean logs

all: build
	@echo "Building Docker images..."
	mkdir -p /home/yorito/data/db /home/yorito/data/wp
	docker compose -f ./docker-compose.yaml up -d --build

down:
	@echo "Stopping Docker containers..."
	docker compose -f ./docker-compose.yaml down

clean:
	@echo "Cleaning up Docker resources..."
	docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi $$(docker image ls -q);\
	docker volume rm $$(docker volume ls -q);\

logs:
	@echo "Displaying Docker logs..."
	docker compose logs -f

re:	down clean build 
