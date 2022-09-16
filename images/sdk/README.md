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
| `latest` | `sha256:03655badfe0229b9421106212599f23b33377c3dc91392ef3955e119fbd6a329`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:03655badfe0229b9421106212599f23b33377c3dc91392ef3955e119fbd6a329) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:03655badfe0229b9421106212599f23b33377c3dc91392ef3955e119fbd6a329"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "5b3b8e4e3ed73f5c8a2bb9d78fff228c8990d948",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "distroless/sdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIBiyGBOeyOGAmMZpw5ImLm5o0GeNGvrCnpx8cQMLbidhAiBw07wRCFk4OTdzR7l2nALOp63fSrNgBcLiO6NmzxEp7w==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJlZWZiYzcxZTBlN2YxZjgwMmRmMzk4YWFkOTAzYzI0YThkMTAyNWQwODUzNTgxMTA1M2JmOGQ4ZGNiZjQzYmNlIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQlBkalVRV1pwMEVmdGlseXF3aHZ6ZWQrd3hrekVma0ZuNjZ3TWxGRVhWQ0FpQXp3N1VnZ2paM1kzeUs0SlJncEhGYmZHTjEyUDlrY0ZtRXdtZ2dtYUtjK2c9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnNla05EUVhneVowRjNTVUpCWjBsVlltaGpTWEppZHpkNE1GUTRibXBpVDNReFNEaG1PSEV4VUVWbmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVUlRKTlJFVjNUV3BOTlZkb1kwNU5ha2wzVDFSRk1rMUVSWGhOYWswMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZHY2tWamExbDBXazlSY2pGRFQxSldOSE5uZG1SdWEyWnVibUpFWVZOdGQybFRjbkFLYkU5Uk9HcGxWMDFaYnpad1JqTmpRVmszTWpKT1IyUlpVbTltWlZGTmFVazRTR3R5VW1ZNFdqZGtTa2xGWm5sRE5EWlBRMEZxZDNkblowazBUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV6YmpSNkNtMVFRVnB1VkRsTlZIUlZhVWhoYjNJMmREWnNkbXN3ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFobldVUldVakJTUVZGSUwwSkdVWGRWYjFwUllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKU2NHTXpVbmxpTW5oc1l6Tk5kZ3BqTWxKeVRIazFibUZZVW05a1YwbDJaREk1ZVdFeVduTmlNMlI2VEROS2JHSkhWbWhqTWxWMVpWZEdkR0pGUW5sYVYxcDZUREpvYkZsWFVucE1NakZvQ21GWE5IZFBVVmxMUzNkWlFrSkJSMFIyZWtGQ1FWRlJjbUZJVWpCalNFMDJUSGs1TUdJeWRHeGlhVFZvV1ROU2NHSXlOWHBNYldSd1pFZG9NVmx1Vm5vS1dsaEthbUl5TlRCYVZ6VXdURzFPZG1KVVFWZENaMjl5UW1kRlJVRlpUeTlOUVVWRFFrRm9lbGt5YUd4YVNGWnpXbFJCTWtKbmIzSkNaMFZGUVZsUEx3cE5RVVZFUWtObk1WbHFUbWxQUjFVd1dsUk9iRnBFWTNwYWFsWnFUMGRGZVZsdFNUVmFSR00wV20xYWJVMXFTVFJaZW1jMVQxUkNhMDlVVVRSTlFuZEhDa05wYzBkQlVWRkNaemM0ZDBGUlVVVkVhMDU1V2xkR01GcFRRbE5hVjNoc1dWaE9iRTFDZDBkRGFYTkhRVkZSUW1jM09IZEJVVlZGUkcxU2NHTXpVbmtLWWpKNGJHTXpUWFpqTWxKeVRVSXdSME5wYzBkQlVWRkNaemM0ZDBGUldVVkVNMHBzV201TmRtRkhWbWhhU0UxMllsZEdjR0pxUTBKcFoxbExTM2RaUWdwQ1FVaFhaVkZKUlVGblVqaENTRzlCWlVGQ01rRkJhR2RyZGtGdlZYWTViMUprU0ZKaGVXVkZia1ZXYmtkTGQxZFFZMDAwTUcwemJYWkRTVWRPYlRsNUNrRkJRVUpuTUZCU2N6SkJRVUZCVVVSQlJXTjNVbEZKYUVGUWRsaHZLekZWYzFOblpHeHZObk5NUlVkMFMzVmtTMmh3U1RkdldtWjZabE55TTFwa1dsQUtPRWR2UzBGcFFuUnVaV1J0V0ZWUUwyWXlVV2QzTm0xb0t6RkNjM0J1YlZwUldXNVRWWEI1YXpoNFJEazFReTlJTkhwQlMwSm5aM0ZvYTJwUFVGRlJSQXBCZDA1dlFVUkNiRUZxUlVGelV6aHVjSE5vVmtsaWJUUnRRblpOVW1aeFpYUkRPVGRHUzAwclVXMURXRWhaYjNrd01YcG5ORlZNZEVscWJISklhMWM1Q2xFNFFYcFlhVTVSV0ZVNVpFRnFRbXc1V0ZGVFNIQkRhbFJYU2twWE1URXpUMVZ3UTJSTlJHbHhiM0JJUVhOWk1sbHBaaloxU1ZSQ1NXNHZUMHhXZVRnS1lXaFBVRzVSZVdaak5HMWhhMW8wUFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1663290169,
          "logIndex": 3512111,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/distroless/sdk/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3064644646",
      "sha": "5b3b8e4e3ed73f5c8a2bb9d78fff228c8990d948"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

