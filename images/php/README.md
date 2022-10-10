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
| `8` `8-bullseye` `8-cli` `8-cli-bullseye` `8.1` `8.1-bullseye` `8.1-cli` `8.1-cli-bullseye` `8.1.11` `8.1.11-bullseye` `8.1.11-cli` `8.1.11-cli-bullseye` `8.1.11-r0` `bullseye` `cli` `cli-bullseye` `latest` | `sha256:2e1a57ba98ce52dbc938e7f13478e080dab2df61d7591c3e6cf206ca95a86b17`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:2e1a57ba98ce52dbc938e7f13478e080dab2df61d7591c3e6cf206ca95a86b17) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
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
        "docker-manifest-digest": "sha256:2e1a57ba98ce52dbc938e7f13478e080dab2df61d7591c3e6cf206ca95a86b17"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "9972d7eee1a8b2267f8064bb9f18e62312a91b33",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/php",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCeHjyr/k4V/iArJlquCRPyeXAMaZoSvDe4HxxGysWh2QIhAPQ14p3Q2TQuvvgFdLnyEYGqZuPUZ5FwGXDUSND3ehWa",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIzNWUzOGNiY2Q5OTZlZDNmY2VhZWQ1ZjA1ZGM4NWQ5Y2FmYTcyNTk5MDBkMTZiZDM1MjM1YTE1MmMzNjY3MDQwIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURodC9YMWpUT1dZWmNjcW5CS1NRK2FEWWhTQTVId1VhUWt3dGNhNTdSU1ZBSWhBTmJEeU9PQVNkV0pwbENmSDlVSUczRG1oVE9mVWpLSVlXN3BFc1c2QlBvZiIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndWRU5EUVhsMVowRjNTVUpCWjBsVlNucEVaR2xyZVhjNFdIZE5jelozVlRKS1pYZFZiRWxGVjJoTmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhkTlJFbDNUVVJSTUZkb1kwNU5ha2w0VFVSRmQwMUVTWGhOUkZFd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ0TUhrMk4xRjFiak5tYTFrNE56WldaMnRYUlRsU1NuSlpSWFp1ZW1aU1UzZFVjQ3NLTmpOaGJrRnZRbk5CTjFCaVFXbG9NWFZOVFhjeVQycFNhV3huYVZWaU1tWkhheXRsY0dSS1NVSmlXSGhwZGpVclRtRlBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZJV1RaTENtaGlRemhaVEdsS1ZVUmtVV1o0TTI1SE5sVXZSMHhuZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UW05alF6aDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlQxUnJNMDF0VVROYVYxWnNUVmRGTkZscVNYbE9hbVJ0VDBSQk1rNUhTbWxQVjFsNFQwZFZNazFxVFhoTmJVVTFDazFYU1hwTmVrRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZDJGSVFYZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkhZMU9TOUNVVUZCUWtGTlFWSjZRa1pCYVVWQk1GVkVaWHBCVjFSM1UwVkRVWEZhVkcxU2F5OEtOR05RUWxkQmNHRm1NRGx3ZEZwcldFVmpVRVU0T1ZWRFNVTlBZaXRxU0dOdk9EZHFhazFvTlhKbE5XMVhibkZaVGsxUGF6SkphRXB1TVd0cVIwdDBRUXBtZUhGclRVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeVowRk5SMVZEVFVkVk5tUnBXa1ZYWTNSSGVEZG5WMmxyY0hBMVZqUnVjRWRzTDBKQmRXSnNOMVIxQ2tvNGF6WkJaMnRUVEhVeGNsVmxXa1p0UlV4UGRuTjRiek5aWkdSYVVVbDRRVWxMWjBGSFQxbGlVRGhtZUdrMGFTOVhPV1JGTVhWNGFUTmtiMk5MYjNrS2MybElaWEJMWTBWMWRtOUxOa3hPU1VkR1ZITTRZbWRpVUV3MFoxTXhaRzVwUVQwOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1665367267,
          "logIndex": 4787133,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/php/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/php",
      "githubWorkflowSha": "9972d7eee1a8b2267f8064bb9f18e62312a91b33",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3216406642",
      "sha": "9972d7eee1a8b2267f8064bb9f18e62312a91b33"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

