# musl-build Image

Container image for building C applications (which do not require glibc).

This image is rebuilt nightly from a [GitHub action](https://github.com/distroless/musl-build/blob/main/.github/workflows/release.yaml).

## Get It!

The musl-build image is available on the GHCR and distroless.dev registries:

```
docker pull distroless.dev/musl-build:latest
docker pull ghcr.io/distroless/musl-build:latest
```

## Usage

To build the C application in [examples/hello/main.c](examples/hello/main.c):

```
docker run --rm -v "${PWD}:/work" -w /work/examples/hello \
    distroless.dev/musl-build main.c -o /work/hello
```

The example application will be built to `./hello`:

```
docker run --rm -v "${PWD}:/work" --entrypoint /work/hello \
    distroless.dev/musl-build
```

```
Hello World!
```

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).
