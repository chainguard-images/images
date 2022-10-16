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
| `8.1.11` `8.1.11-r0` `bullseye` `cli` `cli-bullseye` `latest` | `sha256:0a01dc8b32f9426ccb194434c356258a520c9d4cbcf7528e7dea3aaacad99d77`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0a01dc8b32f9426ccb194434c356258a520c9d4cbcf7528e7dea3aaacad99d77) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `8` `8-bullseye` `8-cli` `8-cli-bullseye` `8.1` `8.1-bullseye` `8.1-cli` `8.1-cli-bullseye` `8.1.11-bullseye` `8.1.11-cli` `8.1.11-cli-bullseye` | `sha256:b3fa6ff3eb2be6e482c1c42ce6373424f3d63dd0195315acbcef8cabec5e4ce2`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:b3fa6ff3eb2be6e482c1c42ce6373424f3d63dd0195315acbcef8cabec5e4ce2) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `8.1.10` `8.1.10-bullseye` `8.1.10-cli` `8.1.10-cli-bullseye` `8.1.10-r0` | `sha256:5e144068a1ef73b8323543fc3ca0d3d01b752637c690993ff16172f370af4bbd`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5e144068a1ef73b8323543fc3ca0d3d01b752637c690993ff16172f370af4bbd) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:0a01dc8b32f9426ccb194434c356258a520c9d4cbcf7528e7dea3aaacad99d77"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "5e07d55b6d1792ad18cea24abdaa46ee62aed654",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/php",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIH56dDRfRImCNbFeYg2XbDbxyb8Zd5PnbCi4RM3z2ioRAiAAhEca3j5kBB4l2RTLTowAQool658i/6g5U9xUSjTsiw==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI4YjJlMTBkMjY0Y2E1ZTk5M2NjM2EzOTdiNjhlOWI5Y2JiODRhZDMxMjdkY2YxOTMwZjcxNTdlMTdkM2YzZDgzIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRXowZlFYV2c2ZUFkRnlsUkpwd1JXY2o0aGdyaWpPZ0xBRHZRSzZWczFzZUFpQUpSZ0VXb2N1SVZJcnpCN2x1MURQWmdFUk5MNmlSVVBFMGVranYza01IVXc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndha05EUVhsMVowRjNTVUpCWjBsVlpuTlZZbUZJTkc5T2FscDFkV2hsWld0TlFXazRUSFpuUlc5emQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRKTlJFbDNUMFJGZUZkb1kwNU5ha2w0VFVSRk1rMUVTWGhQUkVWNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZoWWpKR0wyeERiRTk1ZFdSdFRHaFFRV3BQUzJWT2JFaE9NRlJWZEVZd1drUkhkSGNLTjJzdlJXWk9jR3RWTkhGVGJsZ3pWV0Y0YVZWSmFDdFViSFkxTkdOTFVHMVphVTB4Y2t0U1lUSXlXa0ZKUmpOTlJYRlBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZpU1ZWaENtZFZaakkxUVVVclYydFBTRFI2TVVOVlpsSlpZVXhKZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UW05alF6aDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlRsZFZkMDR5VVRGT1Ywa3lXa1JGTTA5VVNtaGFSRVUwV1RKV2FFMXFVbWhaYlZKb1dWUlJNbHBYVlRKTmJVWnNDbHBFV1RGT1JFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZDJGSVFYZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkROdmVETTJkMEZCUWtGTlFWSjZRa1pCYVVKVVRYUTNPRWxzZFU1SFJ6RklkMGRzVFhJemIySUtTRU5JZUhKc1VEVTBZbEpEWm5kNlZVbHNWbEJtVVVsb1FVOXdZM1JSWTBaellXWk5NM3BuTDNwQmFDOUZhbVJYV0c1eWEzSndTSHByVVUxTFpVaFhjd295VjBGQ1RVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeWEwRk5SMWxEVFZGRFNrRk5aMkpyZFV0S1pVWnZOV3A0YzNCcFNqUmtOV3BCWVZjNGNGUnlPRzh3Q2xkblNWRldPUzloWlVWeFZHYzJSRWRTTjFKQlpIUlZZVTk2SzA1TVdsbERUVkZFTW5GRGRucGFkSFk0TWswMk0waERSak41UmpWSk5HTjVOMVV2VW1zS2R5dFVkbGhSTDJ4c1duWnBXVUZKT1RGVk5TOUhibEJ4VTNKQ04ya3JNSFJhVnpROUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1665886109,
          "logIndex": 5189999,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/php/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/php",
      "githubWorkflowSha": "5e07d55b6d1792ad18cea24abdaa46ee62aed654",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3257916224",
      "sha": "5e07d55b6d1792ad18cea24abdaa46ee62aed654"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

