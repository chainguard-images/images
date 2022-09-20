# cgr.dev/chainguard/go Development

This doc covers building the go image locally with Docker.

## Building cgr.dev/chainguard/go Locally

First build the image first using apko:
```
docker run --rm -v "${PWD}:/work" -w /work \
    cgr.dev/chainguard/apko build apko.yaml cgr.dev/chainguard/go:devel go.tar
```

Next, load the image from the tarball:
```
docker load < go.tar
```

Try building something (optionally setting to use your system's `GOOS` / `GOARCH`):
```
docker run --rm -v "${PWD}:/work" -w /work/examples/hello \
    -e GOOS="$(go env GOOS)" -e GOARCH="$(go env GOARCH)" \
    cgr.dev/chainguard/go:devel build -o /work/hello .
```

Finally, try running it:
```
./hello
```
