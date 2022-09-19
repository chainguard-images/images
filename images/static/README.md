# static

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/static/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/static/actions/workflows/release.yaml)

Base image with just enough files to run static binaries!<br/><br/>This image is meant to be used as a base image only, and is otherwise useless.  It contains the `alpine-baselayout-data` package from Alpine, which is just a set of data files needed to support glibc and musl static binaries at runtime.<br/><br/>This image can be used with `ko build`, `docker`, etc, but is only suitable for running static binaries.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/static:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:51de142ee459a23e37377eedd23743bfd6a606ffca0e48aac8f599db7bfa72b1`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:51de142ee459a23e37377eedd23743bfd6a606ffca0e48aac8f599db7bfa72b1) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


## Usage


Here's an example Dockerfile that builds a Rust static binary
and puts it into the static image:

```Dockerfile
FROM --platform=x86_64 rust:alpine as build

RUN rustup target add x86_64-unknown-linux-musl
RUN echo 'fn main() { println!("Hello Distroless"); }' > hello.rs
RUN rustc --target x86_64-unknown-linux-musl hello.rs

FROM cgr.dev/chainguard/static:latest

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

FROM cgr.dev/chainguard/static:latest

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
the `defaultBaseImage` to `cgr.dev/chainguard/static`.


## Signing

All distroless images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/static:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/static:latest --
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
        "docker-manifest-digest": "sha256:51de142ee459a23e37377eedd23743bfd6a606ffca0e48aac8f599db7bfa72b1"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "aaf30aaede96e4ed11b487caf76701346a6ba3a9",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/static",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCz3G1EvcMqwEuJexGwH68gddazwKqXY3oWzrUuEdjrrAIhANPwTNTx/fs1jDyaZ4wiHqDbUzO13J95mBSpSos36Bye",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIyNDVjMmY1ZDI1NzhiMWRhYzc2ZjM2MWMzZDhjYjhiYzg1MmRiYmQ4MjU3YjU0MWJlYzdjOTY5NDRjNGQyNzdiIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJSG1uTy9sYi96YXNBaG1aVmFMQkNFK1h3M2J5QTlVbHU1TktXWUpDV0pyQ0FpQTlBM3A3UEZGeTE5M2NEemNZYVdiVm9OU1R6MVpsbFovUWVxamk4KzhsbWc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnRha05EUVhsRFowRjNTVUpCWjBsVlEwZEhXbWRCZG5BM1dVTlNjV2R3VWxWSVRHSTJaa2MyVGxoSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRWTmFrbDNUMVJKTTFkb1kwNU5ha2wzVDFSRk5VMXFTWGhQVkVrelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZwUzBaVWNHVkplbmhaYW10cVoyc3hhMjE2U0hKaU1EWTFkVE5SVXpaVlYzbzBiMlFLVldnMGVWVTVielpSWVRnNVEwVk9XR1pWV0doR2RrRmpRVGxsYnpaNE5TczBRMVJtVFhadFRVbHlValp3WkVOa1NFdFBRMEZxT0hkblowazNUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZZYlRjckNtRXlRM3BXVGxCeGJ6TktRMjlaTTNWa2FHUjVUR0ZaZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFsUldVUldVakJTUVZGSUwwSkdZM2RXV1ZwVVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BqTTFKb1pFZHNha3g1Tlc1aFdGSnZaRmRKZG1ReU9YbGhNbHB6WWpOa2Vrd3pTbXhpUjFab1l6SlZkV1ZYUm5SaVJVSjVXbGRhZWt3eWFHeFpWMUo2Q2t3eU1XaGhWelIzVDFGWlMwdDNXVUpDUVVkRWRucEJRa0ZSVVhKaFNGSXdZMGhOTmt4NU9UQmlNblJzWW1rMWFGa3pVbkJpTWpWNlRHMWtjR1JIYURFS1dXNVdlbHBZU21waU1qVXdXbGMxTUV4dFRuWmlWRUZUUW1kdmNrSm5SVVZCV1U4dlRVRkZRMEpCVW5ka1dFNXZUVVJaUjBOcGMwZEJVVkZDWnpjNGR3cEJVVTFGUzBkR2FGcHFUWGRaVjBac1drZFZOVTV0VlRCYVYxRjRUVmRKTUU5RVpHcFpWMWt6VG1wamQwMVVUVEJPYlVVeVdXMUZlbGxVYTNkSVFWbExDa3QzV1VKQ1FVZEVkbnBCUWtKQlVVOVJNMHBzV1ZoU2JFbEdTbXhpUjFab1l6SlZkMGgzV1V0TGQxbENRa0ZIUkhaNlFVSkNVVkZTV2tkc2VtUklTbllLWWtkV2VtTjVPWHBrUjBZd1lWZE5kMGhSV1V0TGQxbENRa0ZIUkhaNlFVSkNaMUZRWTIxV2JXTjVPVzlhVjBaclkzazVkRmxYYkhWTlNVZE1RbWR2Y2dwQ1owVkZRV1JhTlVGblVVTkNTREJGWlhkQ05VRklZMEZEUjBOVE9FTm9VeTh5YUVZd1pFWnlTalJUWTFKWFkxbHlRbGs1ZDNwcVUySmxZVGhKWjFreUNtSXpTVUZCUVVkRVZqaDVUMUpSUVVGQ1FVMUJVMFJDUjBGcFJVRnBPRUpPZDI1bE0xTm9VRFprYkZGeVdIaHVaR2MwU0c5WWNEZ3hTVUZGWjNaTlNrb0tNRzU1WWprM2EwTkpVVVE0VlZKUGNYSnRRMk16Vm05S1RqUkhXR2M1TlhwMWFFeGtUMGszTW1OQ05VaE5Tbk52ZEhSbWVVcEVRVXRDWjJkeGFHdHFUd3BRVVZGRVFYZE9iMEZFUW14QmFrVkJiVFJaU3k5U2JUWTNTSEZxUlhBeFYyTnBUR2Q0YzNSS1pXRmhkelJzUkd0ak56ZDBTWGM1SzBWSldrSjBNSFp3Q2xveFNsTTVTa0l2Vlc5NldubEdjV05CYWtKSE5IRm9LMFJLV21WNmExTkZVMGhKUVZWQ2EzcE1hemhZWkZVNFp6TndlVk5hWkhkcFJVRm9SRFpzYldrS2FDOXlURFkxZEdaMVIxWXplR0l6WVZoM1VUMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1663625387,
          "logIndex": 3564204,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/static/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3085956130",
      "sha": "aaf30aaede96e4ed11b487caf76701346a6ba3a9"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

