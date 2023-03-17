# oapi-codegen container image

This container image contains following components:

* oapi-codegen: <https://github.com/deepmap/oapi-codegen>

## USAGE

```bash
docker pull hidori/oapi-codegen
```

## EXAMPLE

```bash
docker run --rm -w $PWD -v $PWD:$PWD hidori/oapi-codegen -generate types,server -package oapi ./petstore.yaml
```
