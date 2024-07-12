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
	docker run --rm -w $$PWD -v $$PWD:$$PWD hidori/oapi-codegen -generate types,server -package oapi ./petstore.yaml
