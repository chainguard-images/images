# gcc-musl Image

Container image for building C applications (which do not require glibc).

This image is rebuilt nightly from a [GitHub action](https://github.com/distroless/gcc-musl/blob/main/.github/workflows/release.yaml).

## Get It!

The gcc-musl image is available on the GHCR and distroless.dev registries:

```
docker pull distroless.dev/gcc-musl:latest
docker pull ghcr.io/distroless/gcc-musl:latest
```

## Usage

To build the C application in [examples/hello/main.c](examples/hello/main.c):

```
docker run --rm -v "${PWD}:/work" -w /work/examples/hello \
    distroless.dev/gcc-musl main.c -o /work/hello
```

The example application will be built to `./hello`:

```
docker run --rm -v "${PWD}:/work" --entrypoint /work/hello \
    distroless.dev/gcc-musl
```

```
Hello World!
```

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).
