NAME = weaveworksdemos/catalogue
DBNAME = weaveworksdemos/catalogue-db

TAG=$(TRAVIS_COMMIT)

INSTANCE = catalogue

.PHONY: default copy test

default: test

release:
	docker build -t $(NAME) -f ./docker/catalogue/Dockerfile .

test: 
	GROUP=weaveworksdemos COMMIT=test ./scripts/build.sh
	./test/test.sh unit.py
	./test/test.sh container.py --tag $(TAG)

dockertravisbuild: build
	docker build -t $(NAME):$(TAG) -f docker/catalogue/Dockerfile-release docker/catalogue/
	docker build -t $(DBNAME):$(TAG) -f docker/catalogue-db/Dockerfile docker/catalogue-db/
	docker login -u $(DOCKER_USER) -p $(DOCKER_PASS)
	scripts/push.sh
build-new:
	DOCKER_BUILDKIT=1 docker build --tag catalogue .

run:
	docker run --name catalogue-container -d -p 8080:80 catalogue:latest
health:
	curl localhost:8080/health
