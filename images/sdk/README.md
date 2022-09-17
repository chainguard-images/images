# sdk

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/distroless/readme-generator
-->

[![CI status](https://github.com/distroless/sdk/actions/workflows/release.yaml/badge.svg)](https://github.com/distroless/sdk/actions/workflows/release.yaml)

Development image for [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/sdk:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:1011ba3e14e99c80f20069b139f68e38219f8425a33f1123750c051f069b36ef`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:1011ba3e14e99c80f20069b139f68e38219f8425a33f1123750c051f069b36ef) | `amd64` `arm64` `armv7` |


## Usage

### With melange

Clone down your development fork/branch:

```
git clone https://github.com/chainguard-dev/melange.git
cd melange
```

Run the image, mounting the repo workspace (`--privileged` flag required):

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
melange keygen

melange build \
  --arch x86_64,arm64 \
  --empty-workspace \
  --repository-append packages \
  --keyring-append melange.rsa \
  examples/gnu-hello.yaml

(cd packages && for d in `find . -type d -mindepth 1`; do \
  ( \
    cd $d && \
    apk index -o APKINDEX.tar.gz *.apk && \
    melange sign-index --signing-key=../../melange.rsa APKINDEX.tar.gz\
  ) \
done)
```

### With apko

Clone down your development fork/branch:

```
git clone https://github.com/chainguard-dev/apko.git
cd apko
```

Run the image, mounting the repo workspace:

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
apko build --debug \
  examples/alpine-base.yaml \
  alpine-base:latest output.tar
```


## Signing

All distroless images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/sdk:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/sdk:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/distroless/sdk"
      },
      "image": {
        "docker-manifest-digest": "sha256:1011ba3e14e99c80f20069b139f68e38219f8425a33f1123750c051f069b36ef"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "5f1f6831201fa8da4d9cb7a9b2c85bf426abe70a",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/sdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCEvy846yAkeZbYRn4STqf/4MOV2C1+j4Eu59/ip2D+5QIhAKL3F0VfoScAYIKKKFXf70PTCpHVi12jGxblhUwrKEXZ",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJmY2I3YWY1OTRiZWZlMjZhMWM4MDQ2ZDZmODM5Mjc4NTI1NGY5YjcyMjMwOTE5NTIxYWI0MjRmYjUwZDk3ODJiIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNpamp3WUs4Mkhla1VoQkM2WnVUWHBPMmlhRlNVZFRiR3BvcnFQeDJJeStRSWdXU25EQkdCMytIRTJrak10NFN1N1FxMyt2aWxORXRJTnZzUzgrSlBXTDNrPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnNla05EUVhnMlowRjNTVUpCWjBsVlYxWTNiMnBaU0dVMGFDdGlTRmxuTWtSa2NVVlZja0p4YUhGTmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlROTlJFRXhUbnBKTUZkb1kwNU5ha2wzVDFSRk0wMUVSWGRPZWtrd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZYVmtOSFl5OVdRM1UzZUVkdU1tOVJSRVZNZFRoTGFHTlFhSFZ0WmtOaU0wcFdUR29LVDBoUk1XdGFVemhKTDNOSVkwNXdibGhCUkdSdFMxSmhNV2xKYVV0dlMxUm5UVUZUTDJGcUt5dEJXRlZRWmxWSmVtRlBRMEZxTUhkblowazFUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZyZG5wQ0NucHpOVVU0ZVZGRWFpdHFUbTlrZWpCcVJGZGpLMFJSZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFobldVUldVakJTUVZGSUwwSkdVWGRWYjFwUllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BqTWxKeVRIazFibUZZVW05a1YwbDJaREk1ZVdFeVduTmlNMlI2VEROS2JHSkhWbWhqTWxWMVpWZEdkR0pGUW5sYVYxcDZUREpvYkZsWFVucE1NakZvQ21GWE5IZFBVVmxMUzNkWlFrSkJSMFIyZWtGQ1FWRlJjbUZJVWpCalNFMDJUSGs1TUdJeWRHeGlhVFZvV1ROU2NHSXlOWHBNYldSd1pFZG9NVmx1Vm5vS1dsaEthbUl5TlRCYVZ6VXdURzFPZG1KVVFWZENaMjl5UW1kRlJVRlpUeTlOUVVWRFFrRm9lbGt5YUd4YVNGWnpXbFJCTWtKbmIzSkNaMFZGUVZsUEx3cE5RVVZFUWtObk1WcHFSbTFPYW1kNlRWUkpkMDFYV21oUFIxSm9Ua2RSTlZreVNUTlpWR3hwVFcxTk5FNVhTbTFPUkVreVdWZEtiRTU2UW1oTlFuZEhDa05wYzBkQlVWRkNaemM0ZDBGUlVVVkVhMDU1V2xkR01GcFRRbE5hVjNoc1dWaE9iRTFDZDBkRGFYTkhRVkZSUW1jM09IZEJVVlZGUkcxU2NHTXpVbmtLWWpKNGJHTXpUWFpqTWxKeVRVSXdSME5wYzBkQlVWRkNaemM0ZDBGUldVVkVNMHBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUTBKcGQxbExTM2RaUWdwQ1FVaFhaVkZKUlVGblVqbENTSE5CWlZGQ00wRkJhR2RyZGtGdlZYWTViMUprU0ZKaGVXVkZia1ZXYmtkTGQxZFFZMDAwTUcwemJYWkRTVWRPYlRsNUNrRkJRVUpuTUdwNlVHWjNRVUZCVVVSQlJXZDNVbWRKYUVGSlpqSmliR1JwWWprclVVcGtWa2hQYzBaVlFsVkpVbEU0YjBadk0yRmFOMEZ1ZW5CdVRuVUtZWEZ5WlVGcFJVRnlTelJGY1V4SVRuWjJNVFF4T0RJeVpHaEpaRzlZUkhkV1pXdHhRazloV2pScWR6QlVNRkJCTmpsdmQwTm5XVWxMYjFwSmVtb3dSUXBCZDAxRVduZEJkMXBCU1hkT1dDOHZlRmhoUjNwc01sTnJNRE5tTmtoaFYzVjBlVlF2YkZCdmVEUmpVRlp0ZEhwUVExUXlkR3RETkROc1lXRXJjblJxQ2sxQmFYRjZLeXRtYXpGNlMwRnFRVnBTUVdRNFQwWk1XRXhYZDJFek9YWm5iVWhGTlZwalJYY3ZNVmgyTms1NVMyeEdjM0FyZDI5Q09UbEdTVGhqYWs0S2FWWm5TVFZ6VjA1QlpFVnllbk52UFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1663376251,
          "logIndex": 3523323,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/sdk/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3071519553",
      "sha": "5f1f6831201fa8da4d9cb7a9b2c85bf426abe70a"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

