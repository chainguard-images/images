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
| `8` `8-bullseye` `8-cli` `8-cli-bullseye` `8.1` `8.1-bullseye` `8.1-cli` `8.1-cli-bullseye` `8.1.11` `8.1.11-bullseye` `8.1.11-cli` `8.1.11-cli-bullseye` `8.1.11-r0` `bullseye` `cli` `cli-bullseye` `latest` | `sha256:fb5853b81c177ac68aa9ffbd62cd4cb392d94e0204f8d717a5112e4c1689c8ab`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:fb5853b81c177ac68aa9ffbd62cd4cb392d94e0204f8d717a5112e4c1689c8ab) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
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
        "docker-manifest-digest": "sha256:fb5853b81c177ac68aa9ffbd62cd4cb392d94e0204f8d717a5112e4c1689c8ab"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "91cdb8dfaedb6681c8c053ac1ab253b11a276459",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/php",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDM6/4VwjQ7mcWS9dkvdX22upNutmml13g0ksk1anyHhAIgJIS0Bpy037NRCyDN5pkoAZzax9iQN3nvZoWwLdOGGw8=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJlYWI4OTY3NmMyZmJmNjQyY2IxMzFiMjQ1MGNmNmUwY2Y3NmExMjRjN2M5YjMxYTZhNmEzZTdiNzMxNjIwM2I3In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJR25lTTNxcHZPU1V2TG9tNmgyQStDUnk2ZTZKNEszOEhXWEdLYUZFUjVwdEFpQnFyMStzQ1dKVVhsMGRjNXlwQ1kzdzhla2JZSUIvQ3FLcFlJbnAzL0dHTkE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndWRU5EUVhsMVowRjNTVUpCWjBsVlQwZHVOalIyYUdWU2MyMWlTbmRrYTFOWWRHUkRWaXRRVjFKemQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUVRSTlJFVXdUV3BGTVZkb1kwNU5ha2w0VFVSQk5FMUVSVEZOYWtVeFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYzY1doUmRUVmxkRk5xVVcxVFJURkpVV0p3U0VaTGNFOXZXRXB2VDJSSVFXWkZSREVLVm1rMFRqTmplWEZ6TDNKeVVUSnBaaXROYUZVM1VVWjNOVlYxY0VGU05rMHpiWFJPYkhsV01YaDFVazAxVEdVMVlYRlBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZQYVRSbkNrMWhOU3RZWkc0eE0ydGtLelp3UTFGc1YxRkplVUZGZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UW05alF6aDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlQxUkdhbHBIU1RSYVIxcG9XbGRTYVU1cVdUUk5WMDAwV1hwQk1VMHlSbXBOVjBacFRXcFZlbGxxUlhoWlZFa3pDazVxVVRGUFZFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZDJGSVFYZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkhSVlNHRjFVVUZCUWtGTlFWSjZRa1pCYVVWQmFIcEJZVVJ2WTNadFNFRnBWMEZUVUhsS2FrY0tkRTEzTlVreVl6Sm5OVUY2V0VsRGRuVllOMWs1YnpoRFNVVktTMUZYV1V4bWJFc3hlVGxTZUhNdmQxWjViM1JYT1dSb2MzQXhPR2t2VkZKeFNYWlBOUXBtYzFkalRVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeVowRk5SMVZEVFZGRVdtNU9TbE5aU1d0SlNXaHhWVE5tWmtzdlpsTkZkMVp3U2k5SGVEZHZhVzFtQ2t0aWRYZDBVbXRXVGpWS2VGcHFSek13VkdaYVRqVm5kVEUwYVhadGVsbERUVWRtYTBsRWQyNUxTM0pVWjA5Uk5sQm1Za0U0VmxwdloxVnpVSFpvUzI4S2JXYzBla3Q1U0VkeFNVTkJMMU01YTFSTGJubG1hRzR6VGxrMU9YSnRXbTlUZHowOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1665193355,
          "logIndex": 4666354,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/php/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/php",
      "githubWorkflowSha": "91cdb8dfaedb6681c8c053ac1ab253b11a276459",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3208679068",
      "sha": "91cdb8dfaedb6681c8c053ac1ab253b11a276459"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

