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
| `8` `8-bullseye` `8-cli` `8-cli-bullseye` `8.1` `8.1-bullseye` `8.1-cli` `8.1-cli-bullseye` `8.1.11` `8.1.11-bullseye` `8.1.11-cli` `8.1.11-cli-bullseye` `8.1.11-r0` `bullseye` `cli` `cli-bullseye` `latest` | `sha256:e3b96f921fbaa7836366b4e15b55ad880b6ae2979ba431eab869ec37b34040b9`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:e3b96f921fbaa7836366b4e15b55ad880b6ae2979ba431eab869ec37b34040b9) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
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
        "docker-manifest-digest": "sha256:e3b96f921fbaa7836366b4e15b55ad880b6ae2979ba431eab869ec37b34040b9"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "597311b63512227c81e57b940301ef88b134e1e3",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/php",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQD5WtgmKrJa3Vru5rFmFDnsvSR+NlSyFq4hzT3fWEuoGQIhAJ3MmmsCl0R6JjD8/pkkg2zngIcmlX6u+Y0oj3S2CSZX",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIxNDFlZDQwZDU1ZDFkNDhhODE3ZmQyYzMxNzhiNGRhMGIwYTY0NjI4YTFmMjBhOTcxYjNlOGYwOWQ2MTVmMmRiIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUR4VVhwS2o5WTcvalIra1QyOWtXUUFMaFZjV0FrZmxSZUVVb3gyWm9kcUV3SWhBTmp3S3hNb1Fqakh4bFJlTGxEeGlUWUhqVWVtaGhOTkdQcG91US8xd2NyVCIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndSRU5EUVhseFowRjNTVUpCWjBsVlZ5dFBjRXdyVEdReU1FSkdNbXhuWVZoQ2FGVnZUVVZKYVdsM2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1hkTlJFVXhUMFJKTkZkb1kwNU5ha2w0VFVSSmQwMUVTWGRQUkVrMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVVyUjJocmVXUk9Za0kzWW1keFZ6TlRZblZRWW5NeE4yNDFWQzlOVFhkSFpEWklOM1VLVUdwVWExUm5aelkzYkRONWRFOUtXRUpWUlRWelEzSk5kRGwxYTFaQ2JIWkVXR1UxY1ROWWJXTlNWR0pMUW5SVWJYRlBRMEZyYTNkblowcEdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ5V0ZSWUNrNVRVbmR6ZUVkdGVUSllhV1ZGWkhFME9UVlFSRWh2ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UW05alF6aDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlRsUnJNMDE2UlhoWmFsbDZUbFJGZVUxcVNUTlplbWQ0V2xSVk0xbHFhekJOUkUxM1RWZFdiVTlFYUdsTlZFMHdDbHBVUm14TmVrRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZDJGSVFYZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwcENaMjl5UW1kRlJVRmtXalZCWjFGRFFraHpSV1ZSUWpOQlNGVkJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkRoNE1FTnpaMEZCUWtGTlFWSnFRa1ZCYVVFMGVVWTJRWEpwZEZoa1pFVm9kSEJ6TmpGQllUUUtiakJOUjBOTlkxWm1hRlZoVVZCM1FWRjRNbGhhWjBsbldFcG5TMWcwYTFCd2IzWkJlWHBJU1hWcVNGTk5jbkY2VlZGSk1XUlVjVEZKUzJkSVFsYzNOUXA1Um5OM1EyZFpTVXR2V2tsNmFqQkZRWGROUkdGQlFYZGFVVWwzUzBGTFVqQXZNamxWTnpoTFRTdFhlRWMxUkhwNVUwMDFkakpETkRGS01VMDVaV28yQ2pGd1NXSTJiMkpzTUZoRmFGbDFVa0U0Y1dGR2MweGhTVGRSWVRWQmFrVkJibnBQUTFwMFdUbE9URWh1TkZGbU0wVmFMMng1TlhGRk1FZHlSbkpJVXpnS04ya3JkR05ETm1OR1VFMUVRbEJFYkhSa1VuZzRiVGQwWnpWVWNFRXJNbWtLTFMwdExTMUZUa1FnUTBWU1ZFbEdTVU5CVkVVdExTMHRMUW89In19fX0=",
          "integratedTime": 1666231128,
          "logIndex": 5467906,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/php/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/php",
      "githubWorkflowSha": "597311b63512227c81e57b940301ef88b134e1e3",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3286278337",
      "sha": "597311b63512227c81e57b940301ef88b134e1e3"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

