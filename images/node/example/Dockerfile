# syntax=docker/dockerfile:1
# Based on https://docs.docker.com/language/nodejs/build-images/

FROM cgr.dev/chainguard/node
ENV NODE_ENV=production

WORKDIR /app

COPY ["package.json", "package-lock.json*", "./"]

RUN npm install --production

COPY . .

CMD [ "server.js" ]
