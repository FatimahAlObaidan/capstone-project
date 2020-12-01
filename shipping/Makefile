build:
	DOCKER_BUILDKIT=1 docker build --tag shippings .

run-java:
	docker run --entrypoint sh -it --rm shipping:latest
health:
	curl http://localhost:8080/health	
run:
	docker run --name shipping  -d -p 80:8080 shipping:latest
