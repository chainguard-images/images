# SDK image for distroless

Development image for [melange](https://github.com/chainguard-dev/melange)
and [apko](https://github.com/chainguard-dev/apko).

This image is rebuilt nightly from a
[GitHub action](https://github.com/distroless/sdk/blob/main/.github/workflows/release.yaml).

## Usage

### With melange

Clone down your development fork/branch:

```
git clone https://github.com/chainguard-dev/melange.git
cd melange
```

Run the image, mounting the repo workspace

```
docker run --privileged --rm -it -v "${PWD}:${PWD}" -w "${PWD}" distroless.dev/sdk
```

Upon entering the image, you should see the following welcome message:

```

Welcome to the distroless development environment!


[sdk] ❯
```

Inside the environment, test out local changes to the melange codebase
by running the following:

```
make melange install
```

Then run melange commands as normal:

```
melange --help
```

### With apko

Clone down your development fork/branch:

```
git clone https://github.com/chainguard-dev/apko.git
cd apko
```

Run the image, mounting the repo workspace

```
docker run --rm -it -v "${PWD}:${PWD}" -w "${PWD}" distroless.dev/sdk
```

Upon entering the image, you should see the following welcome message:

```

Welcome to the distroless development environment!


[sdk] ❯
```

Inside the environment, test out local changes to the apko codebase
by running the following:

```
make apko install
```

Then run apko commands as normal:

```
apko --help
```

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

### Building locally (for amd64)

Requires Docker

```
docker run --rm -v "${PWD}":/work \
  distroless.dev/melange keygen
```

```
docker run --rm --privileged -v "${PWD}":/work \
  distroless.dev/melange build melange.yaml \
  --arch amd64 \
  --empty-workspace \
  --repository-append packages \
  --keyring-append melange.rsa
```

```
docker run --rm -v "${PWD}":/work \
    --entrypoint sh \
    distroless.dev/melange -c \
        'cd packages && for d in `find . -type d -mindepth 1`; do \
            ( \
                cd $d && \
                apk index -o APKINDEX.tar.gz *.apk && \
                melange sign-index --signing-key=../../melange.rsa APKINDEX.tar.gz\
            ) \
        done'
```

```
docker run --rm -v "${PWD}":/work \
    distroless.dev/apko build --debug apko.yaml \
    distroless.dev/sdk output.tar -k melange.rsa.pub \
    --build-arch amd64
```

```
docker load < output.tar
```
