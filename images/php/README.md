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
| `8` `8-bullseye` `8-cli` `8-cli-bullseye` `8.1` `8.1-bullseye` `8.1-cli` `8.1-cli-bullseye` `8.1.11` `8.1.11-bullseye` `8.1.11-cli` `8.1.11-cli-bullseye` `8.1.11-r0` `bullseye` `cli` `cli-bullseye` `latest` | `sha256:8f946e8a4b5f86019c51b68a751baced20f7a0b39909bb06a52f2176ac79e291`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:8f946e8a4b5f86019c51b68a751baced20f7a0b39909bb06a52f2176ac79e291) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
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
        "docker-manifest-digest": "sha256:8f946e8a4b5f86019c51b68a751baced20f7a0b39909bb06a52f2176ac79e291"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "a2f50e66ba3000a47584db4231cf3a02f9262968",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/php",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCupag31FyHoBFEeJHzLMU2PedUXjwgd38LpwbQmON4RgIgexxiiCUWHhWLu3WyzYqSQju+hsjUYV2nsL1CHpbkJ7Q=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjOGYxNjNlODQ0MGQxZjY2ZmVmNDYzMDFjMzZhY2FmNDk5MjhiOTRkYmE0MTk4NmYzODI3OGY3ZDZiNzI4OTRmIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURLOVA5VUdXMWcyUGhrK2xXeGZ3RWVITFp2aGF6ZFJYUC9DUzBwZCtmQmFRSWdHSWp3aVVXM3NSeTZjZ0U1LzdmU3JkL2dEWWdEaUQ4dWsyWGdELzFUbnQ4PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndSRU5EUVhseFowRjNTVUpCWjBsVlpUWkJhekpOSzNNNWJXWkRaV0pWUmk4eFpuQkVWM013YW5sRmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRSTlJFbDNUa1JCTWxkb1kwNU5ha2w0VFVSRk5FMUVTWGhPUkVFeVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZYUTFjM2FXOXJRbTk1Ykd4dVVtaEdiVTlDTm10M1RraFFLeTg1UXpCd1UycDBRMU1LUmxJeVZtODROSE5qY1hwNlpTdE5kWFV3WlZWdE1ETnJNbmgyZDA0NVRsUm1TSEZwU1VSM2NXSXZXWEJ5Vm10UFJUWlBRMEZyYTNkblowcEdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV5VUVaMkNqSlFSMGxzWlc5NGJ6TjViMDQxUkZKaFdXb3ZlVVJqZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UW05alF6aDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdldWUktiVTVVUW14T2FscHBXVlJOZDAxRVFtaE9SR014VDBSU2ExbHFVWGxOZWtacVdtcE9hRTFFU20xUFZFa3lDazFxYXpKUFJFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZDJGSVFYZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwcENaMjl5UW1kRlJVRmtXalZCWjFGRFFraHpSV1ZSUWpOQlNGVkJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkRaT1ZqQkZRVUZCUWtGTlFWSnFRa1ZCYVVJMVEyWnFkMFE1YzBrNVkzRjVXWEZLWkVwRVkwNEtjVmhvTTJONlJHaGhhWEJYUkhGR2NuVllSVzU2WjBsbldXOW1UVTFsU0dkVEwzSXhSM0ZzU1doelZTOWFSSGRZTkdGNlVVMWpabkJMV1hvMFNGTkRhZ3BpTjFGM1EyZFpTVXR2V2tsNmFqQkZRWGROUkdGQlFYZGFVVWwzU2pCeWVuWmlOV1p4Y3pSbVZXWlhVMGhYYTBNMVRVNTRNM1ZDZG1KMVJtTTJaelp0Q2pCRFdWWk1XRmw0UzAxQlJEZGFkV05LY3l0SlRFOHdTU3RPWXpaQmFrVkJOV0puVlVFNFdtUkpVaTlaZDBoclZYTlNWRUlyTDFjNGJsbHNUbmt2ZWpVS1dGUTRWMDh6ZEVaaVpuVkNUa0ZQWVROMWNTdFVaa3R5WkdaWlUyZE1WRVVLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1666058687,
          "logIndex": 5319361,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/php/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/php",
      "githubWorkflowSha": "a2f50e66ba3000a47584db4231cf3a02f9262968",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3270056288",
      "sha": "a2f50e66ba3000a47584db4231cf3a02f9262968"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

