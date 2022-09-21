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
| `8` `8-bullseye` `8-cli` `8-cli-bullseye` `8.1` `8.1-bullseye` `8.1-cli` `8.1-cli-bullseye` `8.1.10` `8.1.10-bullseye` `8.1.10-cli` `8.1.10-cli-bullseye` `8.1.10-r0` `bullseye` `cli` `cli-bullseye` `latest` | `sha256:8c691fd606e543fbf99c5e8f574b1dc3736f95d000cee66f2c5569c05fd2b15c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:8c691fd606e543fbf99c5e8f574b1dc3736f95d000cee66f2c5569c05fd2b15c) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:8c691fd606e543fbf99c5e8f574b1dc3736f95d000cee66f2c5569c05fd2b15c"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "3f433d748b332a23367f293cae7a6a6e015e73a6",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/php",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIANuL5mSZYJ4CNiUT02ZHYOCL1ITnNp1cIUXVcIAW1c6AiEApwSkSjTuO8wtFEFDyt1IMVEfRjDbideZQum9qAHBDaY=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI0ZDMwODQxNWU5M2RiMWQ5ZmQ5MzdlMzY1MjY1ZDJjZmFjMmQxYTg4MTZhNzFkZmE2ODdmOGE3Y2IwZGY1MmU1In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUN0TVk1c05BNEI3UTZuZG5QMXo1RjVaNXVNamNoZHROTW1uSC9KQmpaamRRSWhBTEpFNHBjWWt6Nkh2VzBTc3VxUkxSby9QR01uVEhrejdCUDBqT1MwS1hDcyIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndha05EUVhsNVowRjNTVUpCWjBsVlMzcFFjbGxSYTBWc2J6Sm9UVkkwUjJoMllUUjJXVzFOYlhORmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hoTlJFbDNUMFJOTTFkb1kwNU5ha2wzVDFSSmVFMUVTWGhQUkUwelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZYTUd4blQzRkNPVXBLU25oNk5HZ3dOM1JMZDJSR05pdHBNbTFuYTJneFRsWkVPVFVLYms1RUszVTRNREV6S3lzMFdUVTRWVVJMY21kVGFtSkhOMms1YjNOSGNrMVJWVmx1SzFaUk4xTXJWRU5YUkVZeFFtRlBRMEZyYzNkblowcElUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlY2ZUd4YUNrWnBUbk5WYlZwclMwZFRVVEpwU1dNcmFqTXpkbVJuZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UW05alF6aDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwWm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkpZekpPYjFwWFVqRmlSMVYzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlRUSlpNRTE2VG10T2VsRTBXV3BOZWsxdFJYbE5lazB5VGpKWmVVOVVUbXBaVjFVeldWUmFhRTV0VlhkTlZGWnNDazU2VG1oT2FrRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYWtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKV2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZDJGSVFYZElVVmxMUzNkWlFrSkJSMFIyZWtGQ1FtZFJVR050Vm0xamVUbHZXbGRHYXdwamVUbDBXVmRzZFUxSlIweENaMjl5UW1kRlJVRmtXalZCWjFGRFFrZ3dSV1YzUWpWQlNHTkJRMGREVXpoRGFGTXZNbWhHTUdSR2NrbzBVMk5TVjJOWkNuSkNXVGwzZW1wVFltVmhPRWxuV1RKaU0wbEJRVUZIUkZoak0ycE5VVUZCUWtGTlFWTkVRa2RCYVVWQmVFbFhZV1Z1Y20xMU9GQnJaRWw2TkVoM1ZGUUtjV04zUlRaaVZtUkZhVk5rT0ZsV2IxUXZkSE00Wld0RFNWRkRla3RpUkZWbFNFOW5UVWRqUzB0M1pXczROVEExWkdaR2JWZEVkeXQwT0dGbk0wRTJOZ3BUY1dGeVNXcEJTMEpuWjNGb2EycFBVRkZSUkVGM1RtOUJSRUpzUVdwQ2VXTXhZVEJXTmpNeldtWjBZbXRtYld4T1RrNVBOM0YzVVhaNVNFdHZaamMzQ2xZeVkxTldTWHBYY0ZnNE4zVjFPRmRyYjFOWWQwaE5VMWxJYVVwSFREaERUVkZFZFRSM2NXOXRUbFJYUWtoTldqSkJOblpqVVROYWEzUlZPVEI1UjNjS1ZEZE5OemxuZFRsb1NTOWFRbVIwUkM4M1NYVTJkbmt3UzBGd1owdHlNbGRLT0djOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1663726141,
          "logIndex": 3644944,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/php/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3094715854",
      "sha": "3f433d748b332a23367f293cae7a6a6e015e73a6"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

