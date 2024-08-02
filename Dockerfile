FROM golang:1.22-alpine3.20

RUN apk update \
    && apk add --no-cache \
    ca-certificates \
    && update-ca-certificates

ENV CGO_ENABLED=0

RUN go install github.com/oapi-codegen/oapi-codegen/v2/cmd/oapi-codegen@latest

ENTRYPOINT [ "oapi-codegen" ]
