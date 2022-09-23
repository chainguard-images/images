# php

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/php/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/php/actions/workflows/release.yaml)

This is a minimal PHP image based on Alpine, using PHP apks available on the Alpine Community repositories (not built from source as of now).<br/><br/>While this image is being developed, we will stick to the latest stable PHP version which at this moment is `8.1`. Supported versions in the long term are TBD.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/php:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `8` `8-bullseye` `8-cli` `8-cli-bullseye` `8.1` `8.1-bullseye` `8.1-cli` `8.1-cli-bullseye` `8.1.10` `8.1.10-bullseye` `8.1.10-cli` `8.1.10-cli-bullseye` `8.1.10-r0` `bullseye` `cli` `cli-bullseye` `latest` | `sha256:5d7a350cb2b6ecdaa67cd52d75f07e874fbb21fdbcd9e4ec25dd1d064f15a51e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5d7a350cb2b6ecdaa67cd52d75f07e874fbb21fdbcd9e4ec25dd1d064f15a51e) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


## Usage

To try out the image, run:

```shell
docker run --rm cgr.dev/chainguard/php --version
```

```
PHP 8.1.10 (cli) (built: Sep  1 2022 16:13:09) (NTS)
Copyright (c) The PHP Group
Zend Engine v4.1.10, Copyright (c) Zend Technologies
```

## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/php:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/php:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/php"
      },
      "image": {
        "docker-manifest-digest": "sha256:5d7a350cb2b6ecdaa67cd52d75f07e874fbb21fdbcd9e4ec25dd1d064f15a51e"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "7cf31f98b5fcaaad8a2156384cd8845ed956e778",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/php",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIEDIKwUyjMx5KayOKaCliRGbQJn794rE2Sxx6xzHLngrAiAu5x6v6BUR2csCdjfpWucLU1n4RRTclQb9+O9rBHDdSA==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIyNzZhNmZhZTc5YzFmN2EwMjE3YWI4ZTcyYTRmZjdiMjIzNWIwYjg3OTA3ZDRmMjRlY2QyNGMzM2E5ZGFlMTMyIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNjR1BVeTUrak1vRDArRURVN2RFR3dGTUVqS2JvSDZMUUNrRzNCSU41OTd3SWhBUDlKS2NlZUlPdy9oZHVVT2dSeHVDU1I1WkozT1lmVElhRm9ZcUdzenJKbyIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndSRU5EUVhsMVowRjNTVUpCWjBsVldubzJORkoyZDJjNVpWaDBLMlZhWWtSSE5FSTVLMjB4WjNnd2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hwTlJFbDNUWHBKZWxkb1kwNU5ha2wzVDFSSmVrMUVTWGhOZWtsNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZZVmxoek0zcElVMjlhUmxCa01rb3pVVU5xTURGVlRXdHNkVzVwVGpBeFpGbGFSbXdLWlN0YWIzVlhTbVpsVWxCUWNHWllZMFJqUzBoaFFsUmxhRWwwV25VMVFYRnNVbWx5ZFhwUE9FcFpOMVZVUVVOWVJ6WlBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZRUldkNUNtWkVSSFUxU1hkdWJEZERhMXBWT0ZGT1dHNUNTRUZSZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UW05alF6aDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlRqSk9iVTE2Um0xUFZHaHBUbGRhYWxsWFJtaGFSR2hvVFdwRk1VNXFUVFJPUjA1clQwUm5NRTVYVm10UFZGVXlDbHBVWXpOUFJFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZDJGSVFYZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkdGQ1dGSkhRVUZCUWtGTlFWSjZRa1pCYVVWQk9FNWlPVWwzZW0xNlJEUlJOME5DU1VwRWVXZ0tNRkpSVjJkNVZYbEhXSGxuYURCTVpFaHNkblpGZHpoRFNVUTBlSEpKV21waE1tdGtZWE54V0hoeVpITkllRFYyUXpaSmRtdGFjbWR2VFdJNVVqUldMd296YUdaaFRVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeVkwRk5SMUZEVFVnNFdURTBRMDVGTkZGM05uQlVSa3R1SzBOcVZYUlhUbGM1Y21aSlNDdHBjWEpsQ2poM01FRnFSMnhNTURGemEwTTNXSGxLUlRWTVluRkhabUUzVlVOT1VVbDNRamRPU2xvNVJuTklMMVp6WWpGSFExaGFkMmdyVlV0M1lYaEpla3BCY2xRS1JuUXdMMjQySzFCWVYzcGtlU3RGVm1Ob1dVRjJVemhvZG5Oc1VETktTbFlLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1663898627,
          "logIndex": 3782263,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/php/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3109943658",
      "sha": "7cf31f98b5fcaaad8a2156384cd8845ed956e778"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

