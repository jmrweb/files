# docker

## commands

### build container environment from .yaml

	docker-compose build
	
### start/stop container environment 

	docker-compose up
	docker-compose down

### list running containers

	docker ps --format "{{.ID}} {{.Names}}"
	
### access container cli

	docksh <id> // Alias for: docker exec -it <id> /bin/bash