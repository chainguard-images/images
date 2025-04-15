# syntax=docker/dockerfile:1
# Based on https://docs.docker.com/language/nodejs/build-images/

ARG BUILDER=cgr.dev/chainguard/node:latest-dev
ARG BASE=cgr.dev/chainguard/node:latest

FROM ${BUILDER} AS builder
WORKDIR /build-stage
COPY package*.json ./
ENV NODE_ENV=production

# Make sure the alternative package managers got installed in the -dev image
RUN corepack --version && \
    pnpm --version && \
    yarn --version

RUN npm ci --omit=dev
# Copy the files you need
COPY . ./
# npm run build or whatever you need to do to build your app

FROM ${BASE}
COPY --from=builder /build-stage/ .
ENTRYPOINT [""]
CMD ["dumb-init", "node", "server.js"]
