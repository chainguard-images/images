# cgr.dev/chainguard/gcc-musl Development

This doc covers building the gcc-musl image locally with Docker.

## Building cgr.dev/chainguard/gcc-musl Locally

First build the image first using apko:
```
docker run --rm -v "${PWD}:/work" -w /work \
    cgr.dev/chainguard/apko build apko.yaml cgr.dev/chainguard/gcc-musl:devel gcc-musl.tar
```

Next, load the image from the tarball:
```
docker load < gcc-musl.tar
```

Try building something:
```
docker run --rm -v "${PWD}:/work" -w /work/examples/hello \
    cgr.dev/chainguard/gcc-musl:devel main.c -o /work/hello
```

Finally, try running it:
```
docker run --rm -v "${PWD}:/work" --entrypoint /work/hello \
    cgr.dev/chainguard/gcc-musl:devel
```
