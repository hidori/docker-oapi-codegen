FROM golang:1.23-alpine3.20 AS builder

RUN apk update \
    && apk add --no-cache \
    ca-certificates \
    && update-ca-certificates

ENV CGO_ENABLED=0

RUN go install github.com/oapi-codegen/oapi-codegen/v2/cmd/oapi-codegen@latest \
    && cp `which oapi-codegen` /oapi-codegen

FROM alpine:3.20 AS runner

COPY --from=builder /oapi-codegen /usr/local/bin

ENTRYPOINT [ "oapi-codegen" ]
