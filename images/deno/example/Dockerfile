# syntax=docker/dockerfile:1
# Based on https://docs.docker.com/language/nodejs/build-images/

FROM cgr.dev/chainguard/deno

COPY --chown=deno:deno . .

CMD [ "run", "--allow-net", "webserver.ts" ]
