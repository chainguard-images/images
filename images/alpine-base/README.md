# alpine-base

Alpine base image built with distroless tools (e.g. `apko`)

This image is a replacement for `docker.io/alpine`, and is rebuilt
nightly from Alpine `edge`.

As interest develops, tracking branches will be added to enable
tracking the release branches too.

## How to use

```
docker run distroless.dev/alpine-base echo "hello distroless"
```