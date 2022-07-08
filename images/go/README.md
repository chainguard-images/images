# Go Builder Image

Container image for building Go applications.

This image is rebuilt nightly from a [GitHub action](https://github.com/distroless/go/blob/main/.github/workflows/release.yaml).

## Get It!

The go image is available on the GHCR and distroless.dev registries:

```
docker pull distroless.dev/go:latest
docker pull ghcr.io/distroless/go:latest
```

## Usage

To build the Go application in [examples/hello/main.go](examples/hello/main.go)
using the host architecture:

```
docker run --rm -v "${PWD}:/work" -w /work/examples/hello \
    -e GOOS="$(go env GOOS)" -e GOARCH="$(go env GOARCH)" \
    distroless.dev/go build -o /work/hello .
```

The example application will be built to `./hello`:
```
$ ./hello
Hello World!
```

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).
