build-new:
	DOCKER_BUILDKIT=1 docker build --tag carts .

run:
	docker run --name carts-container -d -p 8081:80 carts:latest
health:
	curl localhost:8081/health

