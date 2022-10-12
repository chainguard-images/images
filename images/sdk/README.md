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
| `latest` | `sha256:833d7d6ce70ec01e0a197a24d14f6820931138513e1827226f8a189b86b2b7a6`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:833d7d6ce70ec01e0a197a24d14f6820931138513e1827226f8a189b86b2b7a6) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:833d7d6ce70ec01e0a197a24d14f6820931138513e1827226f8a189b86b2b7a6"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "7b8707aa915849804fb3ea3eedd24c8bda5c5a50",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/sdk",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIGCrIbgla0FDPDMteOddsnBysiRad3/AL/crad/u26fSAiEA7B5Djwe3bWFw5xYD6xUXytHTYC3O9/F3GhBq3H6XNv0=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIwYTJhMmRkMjE0NmM5ZjE1NTUzYjAwMjhlYTFhMjA2NTUxZmE2MGY0YmZiM2Q0ODAwZDMyOGNjZGVkMDgwZjc3In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJR0hWRFVndzNrcEM1MzRsTHI4TlEyQUdZbkQ4cWE2YmlIelAxSE1RRHJXNUFpQWpTVVg5b2lQMHFhaUVJdnkzZlBvcFZ2YS9leEZaMFZLNXRnR1FGNC82cnc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndWRU5EUVhsMVowRjNTVUpCWjBsVlJsa3lVbE5JZDFWVlZra3JWVVJRUnk5bFdsQjJhWHBaVGtwemQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhsTlJFVjVUbnBSZUZkb1kwNU5ha2w0VFVSRmVVMUVSWHBPZWxGNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ4UlV4RUwxY3pPSFk0V2paWWREUnhORTlRTDJsMVRFaEJUV1l3V25OTFNHa3pNVUVLYTNab0x6RnpiekpOTldacGVWSnhVaTl4V0VObVJVcHNaVk5YUlhkamRtZEZVbkZCTUc5aVIydzNTMGRqYjBNMFdHRlBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZMUTJrM0NrbGplRkJDTWxSbVpFWjZUM2RPTUVzdlIzRlVjeXR2ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6VG10aGVUaDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlRqSkpORTU2UVROWlYwVTFUVlJWTkU1RWF6Uk5SRkp0V1dwT2JGbFVUbXhhVjFKclRXcFNhazlIU210WlZGWnFDazVYUlRGTlJFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZWxwSGMzZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkhsak0zcDVVVUZCUWtGTlFWSjZRa1pCYVVWQmJsaExXVXhNUlM5VGJWWmlVSGN6TWxOVGFtb0tWMlk0WlVKVVlsTmtNV1JRTjFWRk9IQXljekE1U2pSRFNVSmpOVk5TWlhwcGMybDBhMHQyYUVaMVpTdHRka2RyVkVObEsxVktaMVZ5U2s5Qk9ITkNXUXBDYzFkM1RVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeVowRk5SMVZEVFVaa2JFRnFSakp5YmpGUU5FTjNWeTlrTVVwM1ZtdG1XR1E0U1V0WlJrcDVjbVJIQ2tOSVNrRmtaRE54ZEdKRFRtTXZZbVEyYjBocVZVdzNhSE53ZW5jeFVVbDRRVTVtTm10TmNVaDFNRlZCZWtsQ2JHUlJXakYxWnpSbVdIbFphM0ZQVW1zS1ZEbHFlRTFPVEVWMlJHdHFlR1pqYmpCaldFMTZSRFJtTTJoNUwwWTVNRUpRUVQwOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1665538068,
          "logIndex": 4931201,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/sdk/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/sdk",
      "githubWorkflowSha": "7b8707aa915849804fb3ea3eedd24c8bda5c5a50",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3231242342",
      "sha": "7b8707aa915849804fb3ea3eedd24c8bda5c5a50"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

