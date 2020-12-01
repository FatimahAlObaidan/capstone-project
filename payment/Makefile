NAME = weaveworksdemos/payment
INSTANCE = payment

.PHONY: default copy test

default: test

copy:
	docker create --name $(INSTANCE) $(NAME)-dev
	docker cp $(INSTANCE):/app/main $(shell pwd)/app
	docker rm $(INSTANCE)

release:
	docker build -t $(NAME) -f ./docker/payment/Dockerfile-release .

test:
	GROUP=weaveworksdemos COMMIT=$(COMMIT) ./scripts/build.sh
	./test/test.sh unit.py
	./test/test.sh container.py --tag $(COMMIT)

build-new:
	DOCKER_BUILDKIT=1 docker build --tag payment .

run:
	docker run --name payment-container -d -p 8082:80 payment:latest
health:
	curl localhost:8082/health

