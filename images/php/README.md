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
| `8` `8-bullseye` `8-cli` `8-cli-bullseye` `8.1` `8.1-bullseye` `8.1-cli` `8.1-cli-bullseye` `8.1.10` `8.1.10-bullseye` `8.1.10-cli` `8.1.10-cli-bullseye` `8.1.10-r0` `bullseye` `cli` `cli-bullseye` `latest` | `sha256:3497e216cb41216011fa2662457a7fae0a5ff8669cd1ffbb104e31a9e0e9c55b`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:3497e216cb41216011fa2662457a7fae0a5ff8669cd1ffbb104e31a9e0e9c55b) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:3497e216cb41216011fa2662457a7fae0a5ff8669cd1ffbb104e31a9e0e9c55b"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "fe0a0aadbc0c45e55b7bcf8883dd41d2890ba154",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/php",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCICAxnj3GkTEHILuURQLinUUJx5luuOIdCM5qHvkd7Aa2AiEApMBAw/QrNlf6xmVZumORru4XuC+2NCoTGanwx+O6oBw=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIzNTRkOTdmY2YyYzhmNTQ1MGM5NjlkNjI2NjM3NjJkNjY0MTM2MDFiNWU0YzFhODk2ZjJkZGQ3YjRjMjZiZjNkIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQUtrYU9EZHdicDJZdjFYSHJwZ092NHg0NXBKRkxPc0tkTGFVd2F6eGJ3ZkFpQmNBajRYM1hHS2pwdDJ5Uk9WWjZadjBVMHpoMDZQczRTMlplTVQ4QzRkaVE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndha05EUVhsMVowRjNTVUpCWjBsVldscE9VMVF5WW5ZMlowMUlTVW81TVRoWVZsWlJVblJ5VHpSemQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hsTlJFVXhUbnBCZVZkb1kwNU5ha2wzVDFSSmVVMUVTWGRPZWtGNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZoWjJ0dlpuUnRRakJ0WVUxSFNuaHdlRmd6WVcxeUwyMHZaazEyTVdWRlRuWldUM0FLUXl0UVFqRnBVVXQ2ZW10dVpXcEdMMnd3TVdwSEt6aHZVV1p2VWtnM2RFUlRWVXhTTTNOamVDc3dPVUk1VkhsaGNEWlBRMEZyYjNkblowcEhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlYxZW5VNENtdGlRbGN2UkdveVNsUnFVeXRGZUdOdGFYaHZNRkkwZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UW05alF6aDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdldtMVZkMWxVUW1oWlYxSnBXWHBDYWs1RVZteE9WRlpwVGpKS2FscHFaelJQUkU1cldrUlJlRnBFU1RSUFZFSnBDbGxVUlRGT1JFRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZDJGSVFYZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIwdENaMjl5UW1kRlJVRmtXalZCWjFGRFFraDNSV1ZuUWpSQlNGbEJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkZsMWJXbE9aMEZCUWtGTlFWSjZRa1pCYVVWQk5tTjVVR1pGU2tGd2MyMWtXSEJMWTBSUWVtTUtSM2RtTjJkb2VVVlBXaTlZV205dU1GY3ZjazgwYm1ORFNVVlJRazAxYTBOVmQyd3JaM0ZSZWxkdVFtVlpSR1ZHUkV0cldEVjVTMHMxYW0xdlRDdHVjUXB1TUdSSlRVRnZSME5EY1VkVFRUUTVRa0ZOUkVFeWEwRk5SMWxEVFZGRFozbGFRM3BUTjI1eVprdzJaM2ROYkdJdlVGRkNMMEpEY1RkemR5dFFialJPQ2l0bFVIVnVOV2xEWlU5SmQwOXNRbFpGTkhGSlJEUTFURWx4YmxSUmMwRkRUVkZFYW0xV01XTlJPWGc0VWxad1pVbFpRelZxTWxOQ1FXSTNlR1oxT0hJS05YbG5UblpvVUd0RGVETlljRzVVYWt3elRXbE9VM0JHYkdsdmJXODFTa0pZTWpnOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1663811863,
          "logIndex": 3714611,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/php/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3102337180",
      "sha": "fe0a0aadbc0c45e55b7bcf8883dd41d2890ba154"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

