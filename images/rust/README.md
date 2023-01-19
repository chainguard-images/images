<!--monopod:start-->
# rust
| | |
| - | - |
| **Status** | experimental |
| **OCI Reference** | `cgr.dev/chainguard/rust` |
| **Variants/Tags** | ![](https://storage.googleapis.com/chainguard-images-build-outputs/summary/rust.svg) |
---
<!--monopod:end-->

Minimal rust image. **EXPERIMENTAL**.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/rust:latest
```

## Tools

This image contains the tools needed to build Rust code.
This includes:

* `rustc`
* `cargo`
* `rustdoc`
* `rustlldb`
* And more!

This image also includes a shell for compatiblity with most `cargo` package installations.
This image **is not** intended to be used as a runtime image, only as a build tool.

## Usage

For runtime, you can use a multi-stage Dockerfile or similar technique to run your compiled binaries on
an even more slimmed down image.
The exact image will depend on your application, but `static`, `glibc-dynamic`, or `cc` should work.

This sample Dockerfile shows how to get a basic build up and running on `cc`.
There's one build argument, `PACKAGE`, that needs to be replaced with the name of your rust package.

```Dockerfile
ARG PACKAGE=myapp

FROM cgr.dev/chainguard/rust as build
WORKDIR /app
COPY . .
RUN cargo build --release

FROM cgr.dev/chainguard/cc
COPY --from=build --chown=nonroot:nonroot /app/target/release/${PACKAGE} /usr/local/bin/${PACKAGE}
CMD ["/usr/local/bin/${PACKAGE}"]
```

```shell
$ docker build -t foo --build-arg PACKAGE=shop .
[+] Building 74.4s (12/12) FINISHED
 => [internal] load build definition from Dockerfile                                                                                                                                                                                         0.0s
 => => transferring dockerfile: 291B                                                                                                                                                                                                         0.0s
 => [internal] load .dockerignore                                                                                                                                                                                                            0.0s
 => => transferring context: 2B                                                                                                                                                                                                              0.0s
 => [internal] load metadata for cgr.dev/chainguard/cc:latest                                                                                                                                                                                0.0s
 => [internal] load metadata for cgr.dev/chainguard/rust:latest                                                                                                                                                                              0.0s
 => [internal] load build context                                                                                                                                                                                                            0.0s
 => => transferring context: 6.21kB                                                                                                                                                                                                          0.0s
 => [stage-1 1/2] FROM cgr.dev/chainguard/cc                                                                                                                                                                                                 0.0s
 => [build 1/4] FROM cgr.dev/chainguard/rust                                                                                                                                                                                                 0.0s
 => CACHED [build 2/4] WORKDIR /app                                                                                                                                                                                                          0.0s
 => [build 3/4] COPY . .                                                                                                                                                                                                                     0.0s
 => [build 4/4] RUN cargo build --release                                                                                                                                                                                                   73.9s
 => [stage-1 2/2] COPY --from=build --chown=nonroot:nonroot /app/target/release/shop /usr/local/bin/shop                                                                                                                                     0.1s
 => exporting to image                                                                                                                                                                                                                       0.1s
 => => exporting layers                                                                                                                                                                                                                      0.0s
 => => writing image sha256:cf84a39643bc196611fa01819a91d31e34da74128499db74b75e1da3faa77bae                                                                                                                                                 0.0s
 => => naming to docker.io/library/foo                                                                                                                                                                                                       0.0s
dlorenc@DANIELs-MacBook-Air rust-web-app % docker run foo /usr/local/bin/shop
{"@t":"2022-12-30T15:27:10Z","@l":"INFO","module_path":"shop::api","@m":"starting up"}
{"@t":"2022-12-30T15:27:10Z","@l":"INFO","module_path":"rocket::config::config","@m":"🔧 Configured for release."}
{"@t":"2022-12-30T15:27:10Z","@l":"INFO","module_path":"rocket::config::config","@m":"address: \u001b[1;49;39m127.0.0.1\u001b[0m"}
{"@t":"2022-12-30T15:27:10Z","@l":"INFO","module_path":"rocket::config::config","@m":"port: \u001b[1;49;39m8000\u001b[0m"}
{"@t":"2022-12-30T15:27:10Z","@l":"INFO","module_path":"rocket::config::config","@m":"workers: \u001b[1;49;39m8\u001b[0m"}
{"@t":"2022-12-30T15:27:10Z","@l":"INFO","module_path":"rocket::config::config","@m":"ident: \u001b[1;49;39mRocket\u001b[0m"}
{"@t":"2022-12-30T15:27:10Z","@l":"INFO","module_path":"rocket::config::config","@m":"limits: \u001b[1;49;39mbytes = 8KiB, data-form = 2MiB, file = 1MiB, form = 32KiB, json = 1MiB, msgpack = 1MiB, string = 8KiB\u001b[0m"}
{"@t":"2022-12-30T15:27:10Z","@l":"INFO","module_path":"rocket::config::config","@m":"temp dir: \u001b[1;49;39m/tmp\u001b[0m"}
{"@t":"2022-12-30T15:27:10Z","@l":"INFO","module_path":"rocket::config::config","@m":"http/2: \u001b[1;49;39mtrue\u001b[0m"}
{"@t":"2022-12-30T15:27:10Z","@l":"INFO","module_path":"rocket::config::config","@m":"keep-alive: \u001b[1;49;39m5\u001b[0m\u001b[1;49;39ms\u001b[0m"}
{"@t":"2022-12-30T15:27:10Z","@l":"INFO","module_path":"rocket::config::config","@m":"tls: \u001b[1;49;39mdisabled\u001b[0m"}
{"@t":"2022-12-30T15:27:10Z","@l":"INFO","module_path":"rocket::config::config","@m":"shutdown: \u001b[1;49;39mctrlc = true, force = true, signals = [SIGTERM], grace = 2s, mercy = 3s\u001b[0m"}
{"@t":"2022-12-30T15:27:10Z","@l":"INFO","module_path":"rocket::config::config","@m":"log level: \u001b[1;49;39mcritical\u001b[0m"}
{"@t":"2022-12-30T15:27:10Z","@l":"INFO","module_path":"rocket::config::config","@m":"cli colors: \u001b[1;49;39mtrue\u001b[0m"}
{"@t":"2022-12-30T15:27:10Z","@l":"INFO","module_path":"rocket::rocket","@m":"📬 \u001b[35mRoutes\u001b[0m:"}
```
