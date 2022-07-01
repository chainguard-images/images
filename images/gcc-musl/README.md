# Template Repository for Distroless Images

This repository contains some basic files to spin up a new distroless image.

## How to use

```
apko build .apko.yaml c-build c-build.tar
```

```
docker load < c-build.tar
```

```
docker run --rm -v $(pwd):/workspace -w /workspace c-build gcc hello.c -o hello
```

```
docker run --rm -v $(pwd):/workspace -w /workspace c-build ./hello
```

## Image Configuration

To add a new image distribution to the distroless org, create its repository
by clicking on the
"[Use this template button](https://github.com/distroless/template/generate)".
This will create a new repository using the files contained here.

Modify the sample `.apko.yaml` file to define the configuration of the new image:

```yaml
contents:
  repositories:
    - http://dl-cdn.alpinelinux.org/alpine/edge/main
  packages:
    - ca-certificates-bundle
    - alpine-baselayout-data
```

For more information about all the apko configuration options, please check
the documentation and the [examples](https://github.com/chainguard-dev/apko/tree/main/examples).

## Image Readme

Remember to describe the purpose of the new image by editing the README.md file.

## Release Workflow

By default, the new repository will contain a
[release workflow](.github/workflow/release.yaml) that builds and publishes the
image every day at midnight.
