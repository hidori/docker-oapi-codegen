IMAGE_NAME = hidori/oapi-codegen

.PHONY: build
build:
	docker build -f ./Dockerfile -t ${IMAGE_NAME} .

.PHONY: rebuild
rebuild:
	docker build -f ./Dockerfile -t ${IMAGE_NAME} --no-cache .

.PHONY: rmi
rmi:
	docker rmi -f ${IMAGE_NAME}

.PHONY: run
run:
	docker run --rm -w $$PWD -v $$PWD:$$PWD ${IMAGE_NAME} --help

.PHONY: version
version: build
	git checkout main
	git fetch
	git pull
	git tag `grep /oapi-codegen go.mod | awk '{print substr($$3,2)}'`
	git push --tags
