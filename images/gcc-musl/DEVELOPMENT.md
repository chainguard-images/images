# distroless.dev/musl-build Development

This doc covers building the musl-build distroless image locally with Docker.

## Building distroless.dev/musl-build Locally

First build the image first using apko:
```
docker run --rm -v "${PWD}:/work" -w /work \
    distroless.dev/apko build apko.yaml distroless.dev/musl-build:devel musl-build.tar
```

Next, load the image from the tarball:
```
docker load < musl-build.tar
```

Try building something:
```
docker run --rm -v "${PWD}:/work" -w /work/examples/hello \
    distroless.dev/musl-build:devel main.c -o /work/hello
```

Finally, try running it:
```
docker run --rm -v "${PWD}:/work" --entrypoint /work/hello \
    distroless.dev/musl-build:devel
```
