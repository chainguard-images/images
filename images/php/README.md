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
| `8` `8-bullseye` `8-cli` `8-cli-bullseye` `8.1` `8.1-bullseye` `8.1-cli` `8.1-cli-bullseye` `8.1.12` `8.1.12-bullseye` `8.1.12-cli` `8.1.12-cli-bullseye` `8.1.12-r0` `latest` | `sha256:ce6574df0bdc1619b72ae73d04e4bd1f0d73c3c4c1cd485d5914b9ba23f0a1f6`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ce6574df0bdc1619b72ae73d04e4bd1f0d73c3c4c1cd485d5914b9ba23f0a1f6) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `bullseye` `cli` `cli-bullseye` | `sha256:9ed6748f7194f09c37b42df62b3a506616a414d191723c1b75f8f0d6b0b5f5b9`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:9ed6748f7194f09c37b42df62b3a506616a414d191723c1b75f8f0d6b0b5f5b9) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `8.1.10` `8.1.10-bullseye` `8.1.10-cli` `8.1.10-cli-bullseye` `8.1.10-r0` | `sha256:5e144068a1ef73b8323543fc3ca0d3d01b752637c690993ff16172f370af4bbd`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5e144068a1ef73b8323543fc3ca0d3d01b752637c690993ff16172f370af4bbd) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `8.1.11-r0` | `sha256:d46b713a1b507d70e7e471510e4f94013b4a8adcaa3d26f3ee5044d9aef5c9b5`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d46b713a1b507d70e7e471510e4f94013b4a8adcaa3d26f3ee5044d9aef5c9b5) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `8.1.11` `8.1.11-r2` | `sha256:68f08d147fcac5c3b5c92020201d2ba8a50f11f55d6ba3c6e4c0e085960f96a3`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:68f08d147fcac5c3b5c92020201d2ba8a50f11f55d6ba3c6e4c0e085960f96a3) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `8.1.11-bullseye` `8.1.11-cli` `8.1.11-cli-bullseye` | `sha256:16cbf167b6bf23ad27985c8d85faf2a2db395a2e61c6267041fec1346fa42c6a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:16cbf167b6bf23ad27985c8d85faf2a2db395a2e61c6267041fec1346fa42c6a) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:ce6574df0bdc1619b72ae73d04e4bd1f0d73c3c4c1cd485d5914b9ba23f0a1f6"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "c632a7c96a64a722e71dceeb098d44f0acdc797b",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/php",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCMxLQw3okC/Ce5O+e+rabpEpH68tGQOG1i0af/vTGToAIgcuLKl94sAEz0/STQlOTd9IBuTlZkbl+IgPGksERgp04=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjNDdkY2JiMmVjYzk1ODlhMzlkMmY4OWQ5ZmE1NzM0NDA4ZjhhOGM3YTU4MGE1NTI5ZjI2YTc4NmZiNGY0N2ZlIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURjQ0RERmV5S2xGT3FpV21DbWxhR1Fjb1BZRmxMZG41U0ZrSml5Q3piYktBSWhBTE9tVkRXVkNESlRMUk8zSGM1ZG5JejhkWVg0emtnRExXK2JMN3JObm1TZSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndSRU5EUVhseFowRjNTVUpCWjBsVllTczBVa1ZVTVVKc2FIbHZjbFpTZVVkS1ZqRTNRa2RIYVZVNGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRSTlJFVjZUbnBWTkZkb1kwNU5ha2w0VFZSQk5FMUVSVEJPZWxVMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ1WjBsaVRsTTVhRXRCVW5WNWExWklWbkJ4VDBsQ2NtcFZkamg2ZFd4M1pYbG1WR2NLVEZkcE4zZzBNVVExYjA1c1R6RldWWEZaTkdoRk1sZDRNREZuUjNOVlVFWmpZemt2U1dsSFNVb3ZWblZsUzNGMlNVdFBRMEZyYTNkblowcEdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZOVFZGWUNuY3lWbTlOTUcxdFdYVjRiR1pUYm5scVlsUmtWRGR6ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UW05alF6aDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdldYcFplazF0UlROWmVtc3lXVlJaTUZsVVkzbE5iVlV6VFZkU2FscFhWbWxOUkdzMFdrUlJNRnBxUW1oWk1sSnFDazU2YXpOWmFrRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZDJGSVFYZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwcENaMjl5UW1kRlJVRmtXalZCWjFGRFFraHpSV1ZSUWpOQlNGVkJNMVF3ZDJGellraEZWRXBxUjFJMFkyMVhZek5CY1VwTENsaHlhbVZRU3pNdmFEUndlV2RET0hBM2J6UkJRVUZIUlZaUFRWTjNVVUZCUWtGTlFWSnFRa1ZCYVVKM1RYWjFaV3BwY2taaGIyWnhObEZTV0RsV04xb0tOV0ZYYURKelVHVmlXR0ZOUm1FMFUwbzNXRGxNUVVsbldHUm5RVEZZVkROdWNXSktZbWRYU0VGS1VtMTBSMjVCTlhGblIwaHpWVEZWYlVreU1tcFNhZ3BHYWtWM1EyZFpTVXR2V2tsNmFqQkZRWGROUkdGQlFYZGFVVWw0UVZCVGNFWnhaVXhpUldaR2JYQTBObGh5VkhoM05qY3haVTlzWWpsVE5XeHJZMDk2Q2xoMmFXMUVVM2RNVERBM01HVjRjR1l3Um5aWFVVbGtXRVJtYkhsMWQwbDNSVTlsWmxwNGMyTnZUa293TVhoelZtbE9RekYwWlhOQlZUSnpWR1pSVW1JS2F6SXJTa1Y0WTJsS1FVSm9NSEZ0UWxBdmJFUjVTVVI2YTJNeGVGbHdSR1FLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1667871500,
          "logIndex": 6704577,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/php/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/php",
      "githubWorkflowSha": "c632a7c96a64a722e71dceeb098d44f0acdc797b",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3415623109",
      "sha": "c632a7c96a64a722e71dceeb098d44f0acdc797b"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

