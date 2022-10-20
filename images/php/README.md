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
| `8.1.10` `8.1.10-bullseye` `8.1.10-cli` `8.1.10-cli-bullseye` `8.1.10-r0` | `sha256:5e144068a1ef73b8323543fc3ca0d3d01b752637c690993ff16172f370af4bbd`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:5e144068a1ef73b8323543fc3ca0d3d01b752637c690993ff16172f370af4bbd) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `8` `8-bullseye` `8-cli` `8-cli-bullseye` `8.1` `8.1-bullseye` `8.1-cli` `8.1-cli-bullseye` `8.1.11` `8.1.11-bullseye` `8.1.11-cli` `8.1.11-cli-bullseye` `8.1.11-r0` `bullseye` `cli` `cli-bullseye` `latest` | `sha256:d2560f7b643ba0ae5ccb21cc283069cd27dcbf45ea91cb3eabd37a991f0115c5`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d2560f7b643ba0ae5ccb21cc283069cd27dcbf45ea91cb3eabd37a991f0115c5) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:d2560f7b643ba0ae5ccb21cc283069cd27dcbf45ea91cb3eabd37a991f0115c5"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "34daa1a0a8c0440cc2ba46c433517706fc00b877",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/php",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIEawLAV/hKQhLxFqaXUIwFo/esPxWXFHeccqx8ZIFhQoAiBOfQBZbYARfmfqTLjMnCytU6OqggMRgpGWJxcjqPAN/Q==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5YWU0ZDBjNzMyMzIxYTI5ZWY5NmUzYzA5NGM2ZjM5ODZhMDBlYTkyNGMwZmFlNTc0OTcyZjZlYzk1ODQzZTNjIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUROM2RTZTljTXNKdG43OGRYODNCZm91QVZpR0dHdW9CTjNublBqcWQzQlp3SWdMSTdpb2cyTktBaHQ4eTR2bEtNV1BLRlVSRkowcWpCRk03YVQ3RjI5VUtzPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZSRU5EUVhsaFowRjNTVUpCWjBsVlRXMVdWekpHVUhab0sxY3lSR001VlZvME5XVnlNR3BxTDNJNGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1hkTmFrRjRUa1JKTlZkb1kwNU5ha2w0VFVSSmQwMXFRWGxPUkVrMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ1WXpCMVJUY3hVVE5yUjNSdlowNUNhMnBTV0RneGVtSk1TQzkyUkhONksxWlJSelFLWVd4WGRVazJRVUkzWVU1V016RTVjV012WTJsUFVHVnVRaXM1VGpZd1NWVnNkRFJ0WlU5YWJXeHljM2xUVTFsUVVuRlBRMEZyVlhkblowcENUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZhYXpabUNqSndVbWx1WjFoemIwYzJNMHBvTW1wbWVESmhRelk0ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UW05alF6aDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwVm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkZZMGhXZW1GRVFUSkNaMjl5UW1kRlJRcEJXVTh2VFVGRlJFSkRaM3BPUjFKb1dWUkdhRTFIUlRSWmVrRXdUa1JDYWxsNlNtbFpWRkV5V1hwUmVrMTZWWGhPZW1OM1RtMWFhazFFUW1sUFJHTXpDazFDZDBkRGFYTkhRVkZSUW1jM09IZEJVVkZGUkd0T2VWcFhSakJhVTBKVFdsZDRiRmxZVG14TlEwMUhRMmx6UjBGUlVVSm5OemgzUVZGVlJVWlhUbThLV1Zkc2RWb3pWbWhqYlZGMFlWY3hhRm95Vm5wTU0wSnZZMFJCWkVKbmIzSkNaMFZGUVZsUEwwMUJSVWRDUVRsNVdsZGFla3d5YUd4WlYxSjZUREl4YUFwaFZ6UjNaMWxyUjBOcGMwZEJVVkZDTVc1clEwSkJTVVZsZDFJMVFVaGpRV1JSUVVsWlNreDNTMFpNTDJGRldGSXdWM051YUVwNFJscDRhWE5HYWpORUNrOU9TblExY25kcFFtcGFkbU5uUVVGQldWQXpRMGhOV2tGQlFVVkJkMEpIVFVWUlEwbEJTMXBOZVZGb2IxWlNia00zYzBwQ1dsaDBkMFpFWTIxNFRrc0tka0pEUkdNemFqUkpVVzlqYmt0b2RrRnBRa3g1UlRSUlExaFhZbGxyUVdaeVNXeE5jMDQwZFdOd2JUQjJaRXBNVmpkcmFEZFpSblp1VGtGRlUycEJTd3BDWjJkeGFHdHFUMUJSVVVSQmQwNXZRVVJDYkVGcVJVRjJjRXhIWlVnNFNVSnFSVTUwYUdoelZFSnpZV1ZSU25nMmVVVnJUVUpPUW5FMGIyOXdPVk52Q21KR1pWcHZUVE5TTlhoUVMzTTBMMHdyVTBOVVZuQk5lVUZxUVVZNUswVlZaVzFrTlN0cWVXSjVTV2xPVVZkU0swOUtZV3hKTDFGeGFISlNNVXhHUWxrS1dVWlVTRkZsYjJac1FqSnhLMkpaVlZadU56SnpibVFyU2tGM1BRb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0ifX19fQ==",
          "integratedTime": 1666296897,
          "logIndex": 5516641,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/php/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/php",
      "githubWorkflowSha": "34daa1a0a8c0440cc2ba46c433517706fc00b877",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3292630244",
      "sha": "34daa1a0a8c0440cc2ba46c433517706fc00b877"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

