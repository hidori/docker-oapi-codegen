FROM node:20-alpine3.19

RUN apk update \
    && apk add --no-cache \
    ca-certificates \
    && update-ca-certificates

ENV CGO_ENABLED=0

RUN go install github.com/deepmap/oapi-codegen/cmd/oapi-codegen@latest

ENTRYPOINT [ "oapi-codegen" ]
