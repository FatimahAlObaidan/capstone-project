build-new:
	DOCKER_BUILDKIT=1 docker build --tag queue-master .

run:
	docker run --name queue-master-container -d -p 8080:80 queue-master:latest
health:
	curl localhost:8080/health

