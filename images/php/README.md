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
| `8.1.11-r0` | `sha256:d46b713a1b507d70e7e471510e4f94013b4a8adcaa3d26f3ee5044d9aef5c9b5`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d46b713a1b507d70e7e471510e4f94013b4a8adcaa3d26f3ee5044d9aef5c9b5) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `8.1.11` `8.1.11-r2` | `sha256:68f08d147fcac5c3b5c92020201d2ba8a50f11f55d6ba3c6e4c0e085960f96a3`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:68f08d147fcac5c3b5c92020201d2ba8a50f11f55d6ba3c6e4c0e085960f96a3) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `8.1.11-bullseye` `8.1.11-cli` `8.1.11-cli-bullseye` | `sha256:16cbf167b6bf23ad27985c8d85faf2a2db395a2e61c6267041fec1346fa42c6a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:16cbf167b6bf23ad27985c8d85faf2a2db395a2e61c6267041fec1346fa42c6a) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `8` `8-bullseye` `8-cli` `8-cli-bullseye` `8.1` `8.1-bullseye` `8.1-cli` `8.1-cli-bullseye` `8.1.12` `8.1.12-bullseye` `8.1.12-cli` `8.1.12-cli-bullseye` `8.1.12-r0` `bullseye` `cli` `cli-bullseye` `latest` | `sha256:62c2fe5add090e5e4d0984ef990de69debce70f375bad5dfce361e0c39e33924`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:62c2fe5add090e5e4d0984ef990de69debce70f375bad5dfce361e0c39e33924) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
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
        "docker-manifest-digest": "sha256:62c2fe5add090e5e4d0984ef990de69debce70f375bad5dfce361e0c39e33924"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "cc0661bfc6fbd0782404a44880bb3ed8e2e3c63d",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/php",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDAqSE2muRh2vsZD7DbS2uMFQLym8sXt2nnGWzjKfS9pgIhAJ5FYWPdrOY2s0RjyoAds3zQTisUr7TZEtRC0XctOIQk",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIwN2ZhNTU2MzVhMmQxMmIzYWYxY2UyYWU2OWI2ZDRmYjliNDIwNmRhYmQyZTlmYWMzNTdiMjgzNzUxZDA5YTg3In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURIa255dG5MYW9oUi9MK3doWG1HV2R2ZUtEbG1oVnRaa3BqZGFpYlNtM3B3SWdVanlyaHVPaGc3MGhXK2gzK2Z3WEdwd0dPT0JWckdzd3JWNHM1ZXRPQ1A4PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndha05EUVhsNVowRjNTVUpCWjBsVldHMUNia1ZuU2s0NE1HRkZWRFZQVG14S2FFcDFZbGx3Y1d0cmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlhkTlJFVXdUVlJSTlZkb1kwNU5ha2w0VFZSRmQwMUVSVEZOVkZFMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVY0TDI1clIzWTBNVFl2VEhWNGIyUnJMMk0zYnpaWE5HNU9NalJzYzBKSmN6ZHBhVGtLWlV4blJHUm9PVGN4VG5RcmNqWTBXU3RVVDB0cmVVOUJkbGhrTUUxVFNXeGlXRnBQSzI5V1pGWnNiamg1V1dZNVlrdFBRMEZyYzNkblowcElUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZuUzJSNUNscFNUMjA1TlV3elNuUTFTa2xWWVZaMGMwTkpTemxaZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UW05alF6aDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdldUSk5kMDVxV1hoWmJWcHFUbTFhYVZwRVFUTlBSRWt3VFVSU2FFNUVVVFJQUkVKcFdXcE9iRnBFYUd4TmJWVjZDbGw2V1hwYVJFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZDJGSVFYZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIweENaMjl5UW1kRlJVRmtXalZCWjFGRFFrZ3dSV1YzUWpWQlNHTkJNMVF3ZDJGellraEZWRXBxUjFJMFkyMVhZek5CY1VwTENsaHlhbVZRU3pNdmFEUndlV2RET0hBM2J6UkJRVUZIUlZoNlRsSllVVUZCUWtGTlFWTkVRa2RCYVVWQk16VnNjRFo0YTBrM1ZXMDBNRUpyWm5KM2NFRUtXVmhRVDNwU1duUnZkMDlwTjFCb1Ztd3hhekJ6VGxWRFNWRkVVMnBHZEZGQlEzRXhNVlYxYVVWT1VWSlVaWGhFU0VOSmR6Rk9LM012VWpaUVIydHRRUXBPYVVsR1dFUkJTMEpuWjNGb2EycFBVRkZSUkVGM1RtOUJSRUpzUVdwRlFUVkdNSEV3TW5KaGF6VlRhQ3N3WkdOelVubG5NRTlxUzJKSGJscGFTRmd4Q2toamQySTBkekJJVVV0Wk5IaHNLMnBuYzJwMU1HdEhRVmR5YzNjeEt6ZEpRV3BCTUhwU2JtUkRWbVJCTlVRMU5DOHlPV1pDYTI4M1YwMHhRM0p0UzJvS1JuY3pabVUyTjNKTGRHTlFjekp4ZUZsWVptbEJTak4zTlVKM1JGRktMM0ZxVjBFOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1668044546,
          "logIndex": 6806386,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/php/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/php",
      "githubWorkflowSha": "cc0661bfc6fbd0782404a44880bb3ed8e2e3c63d",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3433290575",
      "sha": "cc0661bfc6fbd0782404a44880bb3ed8e2e3c63d"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

