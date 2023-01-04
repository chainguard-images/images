# substratevm-base


Base image with just enough files to run native SubstrateVM binaries.

This image includes `glibc` and `libz`, and is designed to contain exactly what's needed to run native GraalVM/SubstrateVM binaries.

This image is meant to be used as a base image only, and is otherwise useless.  It contains the `wolfi-baselayout-data` package from Wolfi, which is just a set of data files needed to support glibc static binaries at runtime.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/substratevm-base:latest
```

## Users

The image has a single user `nonroot` with uid `65532`, belonging to gid `65532`.
