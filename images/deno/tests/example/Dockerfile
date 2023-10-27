# syntax=docker/dockerfile:1
# Based on https://docs.docker.com/language/nodejs/build-images/

ARG base cgr.dev/chainguard/deno

FROM $base

COPY --chown=deno:deno . .

CMD [ "run", "--allow-net", "webserver.ts" ]
