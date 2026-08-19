FROM golang:1.26.6-alpine3.24 AS builder

RUN apk update \
    && apk add --no-cache \
    ca-certificates \
    && update-ca-certificates

RUN go install github.com/oapi-codegen/oapi-codegen/v2/cmd/oapi-codegen@latest \
    && cp `which oapi-codegen` /oapi-codegen

FROM alpine:3.24 AS runner

COPY --from=builder /oapi-codegen /usr/local/bin

ENTRYPOINT [ "oapi-codegen" ]
