<!--monopod:start-->
# zig
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/zig` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/zig/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimal image with zig binary.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/zig:latest
```
<!--getting:end-->

<!--body:start-->
This image should be used to build and test zig applications.
You should *not* use it as a runtime image.

For runtime images, you can use `cgr.dev/chainguard/static` or `cgr.dev/chainguard/glibc-dynamic` depending on the type of zig application you build.

## Run It!

The zig tool in this image can be used to setup and build basic zig projects:

```yaml
$ docker run -it -v $(pwd):/app -w /app cgr.dev/chainguard/zig init-exe
info: Created build.zig
info: Created src/main.zig
info: Next, try `zig build --help` or `zig build run`
$ docker run -it -v $(pwd):/app -w /app cgr.dev/chainguard/zig build run
$  docker run -it -v $(pwd):/app -w /app cgr.dev/chainguard/zig build run
All your codebase are belong to us.
Run `zig build test` to run the tests.
```

It can also be used in a mutli-stage build:

```Dockerfile
FROM cgr.dev/chainguard/zig:latest-dev as builder
COPY --chown=nonroot . /app
WORKDIR /app
RUN zig build

FROM cgr.dev/chainguard/static
COPY --from=builder /app/zig-out/bin/app /usr/local/bin/app
CMD ["/usr/local/bin/app"]
```

```shell
$ cat << EOF > Dockerfile
FROM cgr.dev/chainguard/zig:latest-dev as builder
WORKDIR /app
COPY . /app
RUN zig build

FROM cgr.dev/chainguard/static
COPY --from=builder /app/zig-out/bin/app /usr/local/bin/app
CMD ["/usr/local/bin/app"]
EOF

$ docker build . -t zigtest
[+] Building 0.4s (12/12) FINISHED
 => [internal] load .dockerignore                                                                                                                                                                                                                                                              0.0s
 => => transferring context: 2B                                                                                                                                                                                                                                                                0.0s
 => [internal] load build definition from Dockerfile                                                                                                                                                                                                                                           0.0s
 => => transferring dockerfile: 305B                                                                                                                                                                                                                                                           0.0s
 => [internal] load metadata for cgr.dev/chainguard/static:latest                                                                                                                                                                                                                              0.3s
 => [internal] load metadata for cgr.dev/chainguard/zig:latest-dev                                                                                                                                                                                                                             0.2s
 => [internal] load build context                                                                                                                                                                                                                                                              0.0s
 => => transferring context: 1.40kB                                                                                                                                                                                                                                                            0.0s
 => [stage-1 1/2] FROM cgr.dev/chainguard/static@sha256:54b589146d4dbc80a094fcbcd6b09414f3df94cde8ea6d31c44fd02692c58203                                                                                                                                                                       0.0s
 => => resolve cgr.dev/chainguard/static@sha256:54b589146d4dbc80a094fcbcd6b09414f3df94cde8ea6d31c44fd02692c58203                                                                                                                                                                               0.0s
 => [builder 1/4] FROM cgr.dev/chainguard/zig:latest-dev@sha256:74d1fd19ab5f32a350745c155deaf26684733ac20392e8ca38648bcd0f73db54                                                                                                                                                               0.0s
 => => resolve cgr.dev/chainguard/zig:latest-dev@sha256:74d1fd19ab5f32a350745c155deaf26684733ac20392e8ca38648bcd0f73db54                                                                                                                                                                       0.0s
 => CACHED [builder 2/4] COPY --chown=nonroot . /app                                                                                                                                                                                                                                           0.0s
 => CACHED [builder 3/4] WORKDIR /app                                                                                                                                                                                                                                                          0.0s
 => CACHED [builder 4/4] RUN zig build                                                                                                                                                                                                                                                         0.0s
 => CACHED [stage-1 2/2] COPY --from=builder /app/zig-out/bin/app /usr/local/bin/app                                                                                                                                                                                                           0.0s
 => exporting to image                                                                                                                                                                                                                                                                         0.0s
 => => exporting layers                                                                                                                                                                                                                                                                        0.0s
 => => exporting manifest sha256:b2b46fa2142a0a74b56531f700b9052326e19d8f73d576583af26803bf6a32f0                                                                                                                                                                                              0.0s
 => => exporting config sha256:5f75e89de21e888ce46efef85a14919c0499ef854ed78f0bc9fb0126ed677cb8                                                                                                                                                                                                0.0s
 => => naming to docker.io/library/zigtest:latest                                                                                                                                                                                                                                              0.0s
 => => unpacking to docker.io/library/zigtest:latest

$ docker run zigtest
Run `zig build test` to run the tests.
All your codebase are belong to us.
```

## WASM

Zig can also be used to build WASM modules.

This Dockerfile can be used to build a WASM image, compatible with Docker's WASM runtime support.

```Dockerfile
# syntax=docker/dockerfile:1
FROM cgr.dev/chainguard/zig:latest as wasm-builder
WORKDIR /app
COPY --chown=nonroot . /app
RUN zig build-exe src/main.zig -target wasm32-wasi

FROM scratch
COPY --from=wasm-builder /app/main.wasm /main.wasm
ENTRYPOINT [ "/main.wasm" ]
```

Follow the [instructions to enable WASM in docker](https://docs.docker.com/desktop/wasm/), then build this and run it:

```shell
$ cat << EOF > Dockerfile.wasm
# syntax=docker/dockerfile:1
FROM cgr.dev/chainguard/zig:latest as wasm-builder
WORKDIR /app
COPY --chown=nonroot . /app
RUN zig build-exe src/main.zig -target wasm32-wasi

FROM scratch
COPY --from=wasm-builder /app/main.wasm /main.wasm
ENTRYPOINT [ "/main.wasm" ]
EOF

$ docker build . -t myfirstwasmapp -f Dockerfile.wasm
$ docker run \
  --runtime=io.containerd.wasmedge.v1 \
  myfirstwasmapp
All your codebase are belong to us.
Run `zig build test` to run the tests.
```

### Other WASM Runtimes

These wasm binaries can also be run in other WASM runtimes outside of Docker.

Wolfi currently packages [wazero](https://edu.chainguard.dev/chainguard/chainguard-images/reference/wazero/), [wasmtime](https://edu.chainguard.dev/chainguard/chainguard-images/reference/wasmtime/), and [wasmer](https://edu.chainguard.dev/chainguard/chainguard-images/reference/wasmer/).

These can be used together. Here's an example using Zig with [Wasmer](wasmer.io):

```shell
$ docker run -it cgr.dev/chainguard/wolfi-base sh
$ apk add zig wasmer
$ zig init-exe
$ zig build-exe src/main.zig -target wasm32-wasi
$ wasmer run main.wasm
All your codebase are belong to us.
Run `zig build test` to run the tests.
```

Or in a multi-stage Dockerfile:

```Dockerfile
FROM cgr.dev/chainguard/zig:latest as builder
WORKDIR /app
RUN zig init-exe
RUN zig build-exe src/main.zig -target wasm32-wasi

FROM cgr.dev/chainguard/wasmer:latest
COPY --from=builder /app/main.wasm /app/main.wasm
CMD ["run", "/app/main.wasm"]
```

```shell
$ cat << EOF > Dockerfile.wasmer
FROM cgr.dev/chainguard/zig:latest as builder
WORKDIR /app
RUN zig init-exe
RUN zig build-exe src/main.zig -target wasm32-wasi

FROM cgr.dev/chainguard/wasmer:latest
COPY --from=builder /app/main.wasm /app/main.wasm
CMD ["run", "/app/main.wasm"]
EOF

$ docker build -t mysecondwasmapp -f Dockerfile.wasmer .
$ docker run mysecondwasmapp
All your codebase are belong to us.
Run `zig build test` to run the tests.
```
<!--body:end-->
