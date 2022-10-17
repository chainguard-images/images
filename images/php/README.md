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
| `8.1` `8.1-bullseye` `8.1-cli` `8.1-cli-bullseye` `8.1.11` `8.1.11-bullseye` `8.1.11-cli` `8.1.11-cli-bullseye` `8.1.11-r0` `latest` | `sha256:e74925535e220b35d9a19ba00d807ce4050676d769901d7894c0da1228baa605`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:e74925535e220b35d9a19ba00d807ce4050676d769901d7894c0da1228baa605) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `8` `8-bullseye` `8-cli` `8-cli-bullseye` | `sha256:b3fa6ff3eb2be6e482c1c42ce6373424f3d63dd0195315acbcef8cabec5e4ce2`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:b3fa6ff3eb2be6e482c1c42ce6373424f3d63dd0195315acbcef8cabec5e4ce2) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `bullseye` `cli` `cli-bullseye` | `sha256:0a01dc8b32f9426ccb194434c356258a520c9d4cbcf7528e7dea3aaacad99d77`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0a01dc8b32f9426ccb194434c356258a520c9d4cbcf7528e7dea3aaacad99d77) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
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
        "docker-manifest-digest": "sha256:e74925535e220b35d9a19ba00d807ce4050676d769901d7894c0da1228baa605"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "a0dadf669026d9bcf892701a46c841641c664291",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/php",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCXa9uZ4kHJXM72LIujwO+gFpMI5LClAtRcxtN5IyDIQAIgWDuyeZ2ZKN8W3lAyCkZesDrzFzH+uKyai3STe1Ugoyw=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjNDUxOTdlY2FlNDc5Mzc3NTY2MmJkMGVjZjNiZjMzMDEwNWY3MzJkZWZmMTMzNDVlZTg0NzNlZjg0OTdhNmJhIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURIZTJGR1NiNTZ3OUZ2L0FtOEUzMWlUbTZRS2NwRTdPdWtUS0VISVpIUXB3SWhBTlhzb2xEOFpjRlNpRE9lK1B4cnZRZGs3Kzd3VTgxTzhwdWRxSy9SQXhNNiIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZla05EUVhseFowRjNTVUpCWjBsVllsaEZRM05sTVhkTmFFeG1XRFZOWlUxT2QwbDFORzUxUmpkSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlROTlJFbDRUV3BSTVZkb1kwNU5ha2w0VFVSRk0wMUVTWGxOYWxFeFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ0UTBaaWRTdEpNM05ZYmxSd1UwTkVWMDEyTnpZeFducElSa1p5UWxaVllXdFBhak1LVkV4b1pHdEpTQzlHVkV0S1ZUVkpUaTlZUnpWUWVYaE9SbFZQY0RVeVJFSTFTMWd6UkhvemExcFhOVXROYm5aNVUyRlBRMEZyYTNkblowcEdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZCU2k5bENtWlVXRkJxTkd0TGEwbE9ORFF2TWpONFZ6UnFOazUzZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UW05alF6aDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdldWUkNhMWxYVW0xT2FsazFUVVJKTWxwRWJHbFpNbGswVDFSSk0wMUVSbWhPUkZwcVQwUlJlRTVxVVhoWmVsa3lDazVFU1RWTlZFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZDJGSVFYZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwcENaMjl5UW1kRlJVRmtXalZCWjFGRFFraHpSV1ZSUWpOQlNGVkJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkRRM1kwUldVVUZCUWtGTlFWSnFRa1ZCYVVGc1ptdENUVEozZVhRd1FVWnVTRU5STjFCSlMxZ0tWeXNyU21Fck9HMXdhalYxYlVWWVVDOHpaemdyVVVsblJWWkVaMVoxUlU1SWVuUldORll5TkUxaFdURkhha0pUWWpZNGVVNDBVU3RvVUdWNFNtRTVTQXB0YVUxM1EyZFpTVXR2V2tsNmFqQkZRWGROUkZwM1FYZGFRVWwzVW1neVdsVlVkR1pNVG1aUU1reFJNRVJCWjJ4SlJYVnhMM1psYTNoeGQyWlJXaTlLQ2tKTWIwNDBiaTlPV2tGbk1GaHdRelY1UTBWUlFuZExhbmxtV0d4QmFrSTJiM0ptYm5CVFptRkxWVTlJVUVobmQzaFBTMjVsUkZoT2VWSXlWbUZSVm1NS1NXRjVZekZXVjA5bmN6RjNRV1J5TjI5dWJFbHBURXR1V2paQlZqVjNVVDBLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1665972784,
          "logIndex": 5249553,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/php/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/php",
      "githubWorkflowSha": "a0dadf669026d9bcf892701a46c841641c664291",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3261873178",
      "sha": "a0dadf669026d9bcf892701a46c841641c664291"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

