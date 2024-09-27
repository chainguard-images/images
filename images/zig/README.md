<!--monopod:start-->
# zig
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/zig` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/zig/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Image for zig

Minimal image with zig binary.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/zig:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
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

These can be used together. Here's an example using Zig with [Wasmer](https://wasmer.io):

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

## Contact Support

If you have a Zendesk account (typically set up for you by your Customer Success Manager) you can reach out to Chainguard's Customer Success team through our [Zendesk portal](https://support.chainguard.dev/hc/en-us).

## What are Chainguard Images?

[Chainguard Images](https://www.chainguard.dev/chainguard-images?utm_source=readmes) are a collection of container images designed for security and minimalism.

Many Chainguard Images are [distroless](https://edu.chainguard.dev/chainguard/chainguard-images/getting-started-distroless/); they contain only an open-source application and its runtime dependencies. These images do not even contain a shell or package manager. Chainguard Images are built with [Wolfi](https://edu.chainguard.dev/open-source/wolfi/overview), our Linux _undistro_ designed to produce container images that meet the requirements of a secure software supply chain.

The main features of Chainguard Images include:

* Minimal design, with no unnecessary software bloat
* Automated nightly builds to ensure Images are completely up-to-date and contain all available security patches
* [High quality build-time SBOMs](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/) (software bills of materials) attesting the provenance of all artifacts within the Image
* [Verifiable signatures](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/) provided by [Sigstore](https://edu.chainguard.dev/open-source/sigstore/cosign/an-introduction-to-cosign/)
* Reproducible builds with Cosign and apko ([read more about reproducibility](https://www.chainguard.dev/unchained/reproducing-chainguards-reproducible-image-builds))

### `-dev` Variants

As mentioned previously, Chainguard’s distroless Images have no shell or package manager by default. This is great for security, but sometimes you need these things, especially in builder images. For those cases, most (but not all) Chainguard Images come paired with a `-dev` variant which does include a shell and package manager.

Although the `-dev` image variants have similar security features as their distroless versions, such as complete SBOMs and signatures, they feature additional software that is typically not necessary in production environments. The general recommendation is to use the `-dev` variants only to build the application and then copy all application artifacts into a distroless image, which will result in a final container image that has a minimal attack surface and won’t allow package installations or logins.

That being said, it’s worth noting that `-dev` variants of Chainguard Images are completely fine to run in production environments. After all, the `-dev` variants are still **more secure** than many popular container images based on fully-featured operating systems such as Debian and Ubuntu since they carry less software, follow a more frequent patch cadence, and offer attestations for what they include.

## Learn More

To better understand how to work with Chainguard Images, we encourage you to visit [Chainguard Academy](https://edu.chainguard.dev/), our documentation and education platform.