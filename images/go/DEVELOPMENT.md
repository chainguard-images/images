# distroless.dev/go Development

This doc covers building the go distroless image locally with Docker.

## Building distroless.dev/go Locally

First build the image first using apko:
```
docker run --rm -v "${PWD}:/work" -w /work \
    distroless.dev/apko build apko.yaml distroless.dev/go:devel go.tar
```

Next, load the image from the tarball:
```
docker load < go.tar
```

Try building something (optionally setting to use your system's `GOOS` / `GOARCH`):
```
docker run --rm -v "${PWD}:/work" -w /work/examples/hello \
    -e GOOS="$(go env GOOS)" -e GOARCH="$(go env GOARCH)" \
    distroless.dev/go:devel build -o /work/hello .
```

Finally, try running it:
```
./hello
```
