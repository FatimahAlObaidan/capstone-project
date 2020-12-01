build:
	DOCKER_BUILDKIT=1 docker build --progress=plain --tag orders .

run:
	docker run --name orders-container -d -p 8082:80 orders:latest
health:
	curl localhost:8082/health
