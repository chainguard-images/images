# distroless.dev/gcc-musl Development

This doc covers building the gcc-musl distroless image locally with Docker.

## Building distroless.dev/gcc-musl Locally

First build the image first using apko:
```
docker run --rm -v "${PWD}:/work" -w /work \
    distroless.dev/apko build apko.yaml distroless.dev/gcc-musl:devel gcc-musl.tar
```

Next, load the image from the tarball:
```
docker load < gcc-musl.tar
```

Try building something:
```
docker run --rm -v "${PWD}:/work" -w /work/examples/hello \
    distroless.dev/gcc-musl:devel main.c -o /work/hello
```

Finally, try running it:
```
docker run --rm -v "${PWD}:/work" --entrypoint /work/hello \
    distroless.dev/gcc-musl:devel
```
