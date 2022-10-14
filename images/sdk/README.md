# sdk

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/sdk/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/sdk/actions/workflows/release.yaml)

Development image for [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/sdk:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:1b392d6be439a5d17d047417a62e9ed3beb3c3492e11e1e2ee59db4b2f976407`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:1b392d6be439a5d17d047417a62e9ed3beb3c3492e11e1e2ee59db4b2f976407) | `amd64` `arm64` `armv7` |


## Usage

### With melange

Clone down your development fork/branch:

```
git clone https://github.com/chainguard-dev/melange.git
cd melange
```

Run the image, mounting the repo workspace (`--privileged` flag required):

```
docker run --privileged --rm -it -v "${PWD}:${PWD}" -w "${PWD}" cgr.dev/chainguard/sdk
```

Upon entering the image, you should see the following welcome message:

```

Welcome to the development environment!


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
  --signing-key melange.rsa \
  examples/gnu-hello.yaml
```

### With apko

Clone down your development fork/branch:

```
git clone https://github.com/chainguard-dev/apko.git
cd apko
```

Run the image, mounting the repo workspace:

```
docker run --rm -it -v "${PWD}:${PWD}" -w "${PWD}" cgr.dev/chainguard/sdk
```

Upon entering the image, you should see the following welcome message:

```

Welcome to the development environment!


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

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

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
        "docker-reference": "ghcr.io/chainguard-images/sdk"
      },
      "image": {
        "docker-manifest-digest": "sha256:1b392d6be439a5d17d047417a62e9ed3beb3c3492e11e1e2ee59db4b2f976407"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "f01fa5f030b7e5fd960b89c6218f25552f17dfe5",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/sdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCCrD4sDRf9HKIahAnElGibqrg51wv2RuJGWOrLuItMRwIgA7YMZmmSmvry6uGz5+UoFIfLPIbzsoimuUONlAgKXgE=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5ZmUzZjBiN2ZlYmRjOGMyMzdhN2Y3OTBiNDRjMGFlY2NhNjFmNTQwZjUyZDJlMmFjNjgzYTIxMmMxZmU5MTdmIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJSDAvb0pyelJqNzhMYkxJZm1OUUErN0pjbmdmbitXcWRBQmp5TU1aemU2U0FpQVk5d01hU2pqRys5dEU0UFlsREdONTVhcXFvSk5pOG5ZWUNQeHBwNks5cWc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndWRU5EUVhsMVowRjNTVUpCWjBsVlZHZExaa1E0ZWpOT2JFVnBaMUk0YlVWRVdsUnpTR0kyY1VwcmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRCTlJFVjVUa1JOTUZkb1kwNU5ha2w0VFVSRk1FMUVSWHBPUkUwd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZxY2tsR01teGpOM1ZpU0cxTWMxaGhVMHAzVWpKRWJISnlRMk56YkVRM1pqaFJaa01LYmtzMFFVUTFjekpPU2pCcWJWQnRMMEpPUm1sd01UWjJjSEZ2SzA1YVl6bDFSMmc0WldoYVNFcFFlR0ZZU1V0WlRIRlBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZpTUVoekNuVm9SbVpzU0RCUk5IZDRRbUYxYVdzeFZYZFhNVEYzZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VG10aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdldtcEJlRnB0UlRGYWFrRjZUVWRKTTFwVVZtMWFSR3N5VFVkSk5FOVhUVEpOYWtVMFdtcEpNVTVVVlhsYWFrVXpDbHBIV214T1ZFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZWxwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkRGQ1psTlBRVUZCUWtGTlFWSjZRa1pCYVVWQk1UVklPRmxEYW1JdmVEUkplREV3ZUZkb1VIVUtTVkE1YldkS1FuSXZUVUV4YTJFd1JXcHlTelpVUkUxRFNVY3ZlVWxUTVVodk1uTkthMHhMZFZwUWVWQnFURzVVT0RKSk5XeGllVFIwTkRCd1lTczNaZ3BLYzJKWlRVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeVowRk5SMVZEVFVGc0szbENWVk51V0VRNGJWWjVVbVpEV1hKRGEwOVZTbkpMVDBZMGJubEtSemRzQ2tkcWJXTjFjbFJvZHpGQ1p5OHdNM0ZFSzNCeVNuUTNkV2h2VUZCVFVVbDRRVWxvUTJaYVlYRjFhRGd5YlhZMFlqQlhUa0pWUlhaclRtNVFNa2c0ZVZvS1oybDFlbVUwVVhvM2EybzNlblZrWVN0VWRGQkhUSHBRVldsMGQyeDVaRUpwWnowOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1665710682,
          "logIndex": 5063010,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/sdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/sdk",
      "githubWorkflowSha": "f01fa5f030b7e5fd960b89c6218f25552f17dfe5",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3246669044",
      "sha": "f01fa5f030b7e5fd960b89c6218f25552f17dfe5"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

