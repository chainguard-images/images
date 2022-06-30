# static

Base image with just enough files to run static binaries!

This image is meant to be used as a base image only, and is
otherwise useless.  It contains the `alpine-baselayout-data`
package from Alpine, which is just a set of data files needed
to support glibc and musl static binaries at runtime.

This image can be used with `ko build`, `docker`, etc, but
is only suitable for running static binaries.

This image is also regenerated nightly.

## Usage

Here's an example Dockerfile that builds a Rust static binary
and puts it into the static image:

```Dockerfile
FROM --platform=x86_64 rust:alpine as build

RUN rustup target add x86_64-unknown-linux-musl
RUN echo 'fn main() { println!("Hello Distroless"); }' > hello.rs
RUN rustc --target x86_64-unknown-linux-musl hello.rs

FROM distroless.dev/static:latest

COPY --from=build /hello /hello
CMD ["/hello"]
```
To build and run it:

```bash
$ docker build -t rusty-distroless --file examples/Dockerfile.rust .
...
$ docker run rusty-distroless
Hello Distroless
```

Note the size!

```bash
$ docker images rusty-distroless
REPOSITORY         TAG       IMAGE ID       CREATED         SIZE
rusty-distroless   latest    aff4c01fd4f0   6 minutes ago   6.09MB
```
And a C static binary:

```Dockerfile
# syntax=docker/dockerfile:1.4
FROM gcc:latest as build

COPY <<EOF /hello.c
#include <stdio.h>
int main() { printf("Hello Distroless!"); }
EOF
RUN cc -static /hello.c -o /hello

FROM distroless.dev/static:latest

COPY --from=build /hello /hello
CMD ["/hello"]
```

To build and run it:

```bash
$ docker build -t c-distroless -f examples/Dockerfile.c .
...
$ docker run c-distroless
Hello Distroless!
```

It's even smaller:

```bash
$ docker images c-distroless
REPOSITORY     TAG       IMAGE ID       CREATED              SIZE
c-distroless   latest    f3648380711c   About a minute ago   2.88MB
```

For Go programs, we recommend using [ko](https://github.com/google/ko) and setting
the `defaultBaseImage` to `distroless.dev/static`.

## Signing

All distroless images are signed using [Sigstore](https://www.sigstore.dev/). This can be verified
using the [cosign](https://github.com/SigStore/cosign) tool:

```
$ COSIGN_EXPERIMENTAL=1 cosign verify distroless.dev/static | jq

Verification for distroless.dev/static:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/distroless/static"
      },
      "image": {
        "docker-manifest-digest": "sha256:8fa6b48fcdfd3e9392faa6aab2d7f425c971370812e908fc34c85cdda2eaea9e"
      },
      "type": "cosign container image signature"
    },
    "optional": {
	...
    }
  }
]
```
