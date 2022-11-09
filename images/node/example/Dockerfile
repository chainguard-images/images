# syntax=docker/dockerfile:1
# Based on https://docs.docker.com/language/nodejs/build-images/

FROM cgr.dev/chainguard/node
ENV NODE_ENV=production

COPY --chown=node:node ["package.json", "package-lock.json*", "./"]

RUN npm install --production

COPY --chown=node:node . .

CMD [ "server.js" ]
