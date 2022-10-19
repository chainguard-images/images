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
| `8` `8-bullseye` `8-cli` `8-cli-bullseye` `8.1` `8.1-bullseye` `8.1-cli` `8.1-cli-bullseye` `8.1.11` `8.1.11-bullseye` `8.1.11-cli` `8.1.11-cli-bullseye` `8.1.11-r0` `bullseye` `cli` `cli-bullseye` `latest` | `sha256:0e0acca5d32847853e0639e07ffa2bf2914876187a19833a9c6459db7df68e37`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0e0acca5d32847853e0639e07ffa2bf2914876187a19833a9c6459db7df68e37) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
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
        "docker-manifest-digest": "sha256:0e0acca5d32847853e0639e07ffa2bf2914876187a19833a9c6459db7df68e37"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "f87477d22752c8a67e01e089af9849a3bfad1ad8",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/php",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCJjzOoP4ob3QZ+80fRAdemdOPXYVpSPz6oQrrvG7SNcgIgNqg6sl0l3q4MGLWtyo4S/sxTTpwv1o3fklpa2xCD05o=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIwYTg4ODMzZmIwMmEyOTA5NTk4MjYxYzdmMTNkOWNiY2VkYjkzM2JjNTU5NjVkMDBlMjk2ZDE5NmE5Y2M0N2M1In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURyendFSC9GN0VrVE96dUVhZnFHUnpXb1lpZWl1NGt0NzJ6Y2E2KzRJdnJBSWdiRzZNcUZIdnFnTklXTDM2blh1c0tqRlc4a0VUWjNwSHgxYmZKVVoxTENjPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndla05EUVhsNVowRjNTVUpCWjBsVlNIVmlObkZrUkhKMWRUZEZWMmRKTkRGNGRUaHJjV2xHZGxaemQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRWTlJFVXhUMVJCZUZkb1kwNU5ha2w0VFVSRk5VMUVTWGRQVkVGNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZzZWtKNVJ5dEVSWEZTV2xSMU5XczJSVmQ2VlhGVWQybFdTa1JOZFM5Nk9VOVdLM2tLTlhreVVVcGhOM1pZY1d4eldXZHplVUpOY0hnNFVqQjBNelJOVVU5SVdFTktRMlZTV21JNGQzRkhjRmh5TW5RcllVdFBRMEZyYzNkblowcElUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV5Y3psWkNsaHpZemRXUkVaNFRUTktOVWg0Um1VMFpXaDZMMDQwZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UW05alF6aDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdldtcG5NMDVFWXpOYVJFbDVUbnBWZVZsNmFHaE9hbVJzVFVSR2JFMUVaelZaVjFrMVQwUlJOVmxVVG1sYWJVWnJDazFYUm10UFJFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZDJGSVFYZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIweENaMjl5UW1kRlJVRmtXalZCWjFGRFFrZ3dSV1YzUWpWQlNHTkJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkRkbVkzQTNRVUZCUWtGTlFWTkVRa2RCYVVWQmVIUnZaalpNZVd0b1RtNUZiRFZPY21NdlNEY0tiR2RaVjJsVmNIRk1XbmQ0VUdSd05rWmFaRUo1ZEZGRFNWRkRiRlJMSzNvMFFuaG5kMnhhWVhWSk4xaFBlR05HYlRCaE1FdDJjR0Y1ZEZSMWMzRnJNd3ByS3pNeGNIcEJTMEpuWjNGb2EycFBVRkZSUkVGM1RuQkJSRUp0UVdwRlFXNVdhekYzU1RJclV5dHdZMUJxVkRSTWIxVXhOakpCWjJOdU1Vc3ZVR1pWQ2tSNGJVdE9ORlI0ZFZSelNUYzBaMGx3VFVKdlEzVjFWalZoUXpKTFdHMXBRV3BGUVc4MVpWSlRUVXByUjA5R1QwUlBaRXRzTDI1bVVGZEhZVXc1UkhVS1UxbEhiWGhQVTA5bVJDOTFiRTkxZG5SVlZGTk9SWGRPT0c5M2MzUm1aSFYzU2pGRkNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1666144790,
          "logIndex": 5401058,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/php/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/php",
      "githubWorkflowSha": "f87477d22752c8a67e01e089af9849a3bfad1ad8",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3278255555",
      "sha": "f87477d22752c8a67e01e089af9849a3bfad1ad8"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

