# Melange Development Image

Container image for running [melange](https://github.com/chainguard-dev/melange) workflows to build
APK packages.

This image is rebuilt nightly from a [GitHub action](https://github.com/distroless/melange/blob/main/.github/workflows/release.yaml).

## Get It!

The melange image is available on the GHCR and distroless.dev registries:

```
docker pull distroless.dev/melange:latest
docker pull ghcr.io/distroless/melange:latest
```

## Usage

To build the melange workflow in [examples](examples/gnu-hello.yaml):

```
docker run --privileged -v "$PWD":/work distroless.dev/melange build /work/examples/gnu-hello.yaml
```

Output will be in the `packages` directory.

To build the melange package for the host architecture:

```
docker run --privileged -v "$PWD":/work distroless.dev/melange build --empty-workspace --arch $(uname -m) /work/melange.yaml
```

To get a shell, you can change the entrypoint:

```
docker run --privileged -v "$PWD":/work -it --entrypoint /bin/sh distroless.dev/melange

/ # melange version
...
```
Note that melange uses bubblewrap internally, which requires various Linux capabilities, hence the
use of `--privileged`. Because of this requirement, we recommend this image is used only for local
development and testing.

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko) and
[melange](https://github.com/chainguard-dev/melange) tooling.
