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
| `8` `8-bullseye` `8-cli` `8-cli-bullseye` `8.1` `8.1-bullseye` `8.1-cli` `8.1-cli-bullseye` `8.1.10` `8.1.10-bullseye` `8.1.10-cli` `8.1.10-cli-bullseye` `8.1.10-r0` `bullseye` `cli` `cli-bullseye` `latest` | `sha256:b00c6790db7cf42f67b8eb3f3d6d206c143c91f75b81a207f1a486f944f5b3f2`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:b00c6790db7cf42f67b8eb3f3d6d206c143c91f75b81a207f1a486f944f5b3f2) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:b00c6790db7cf42f67b8eb3f3d6d206c143c91f75b81a207f1a486f944f5b3f2"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "642da35bad14d408b0ad1a9cb967f5666f73bfb1",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/php",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDKfhEew7dqUoLXegOnWAMS2FnL13aB0rcgcMBM272zzAIhAJI7Y4PRyzw4bVzJ+o2z0OYhlEAzZ5UQDzhrGzOxrOgq",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJlMWI3OGQ1ZTI0NWI3OGQyN2I1MjE0MmI2MWQxZmY4NGFlY2E2ZTBjY2YyZmVlMGNmMmMzZjA1M2I2NGE5OWMyIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRWN0cUtGZm9hcjVkbEk5MXdRdy9NOHI3cFh2Sy9NR2xzdkhBTlVXU09FcEFpQmg2Z05mcHNTQzM2cUhZSEF4WXZqQUpuVWMwcW1hNlEwMTlJUmdsS3FwWVE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZWRU5EUVhsbFowRjNTVUpCWjBsVlJWcHZXaXRYUlRaQ1Z6TnlRblZTUmtsb09GRkRZV1pNUldoVmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hkTlZHTXhUMFJGTTFkb1kwNU5ha2wzVDFSSmQwMVVaM2RQUkVVelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYxWjFjcmFUQnRUVk5OWlVScVlrUlBTVnBEWmsxUFVWVnFNbXQwZFM4M1pVRmhXVVFLVlU0NE1rUm1NVGNyVTNRMmNqTlFUbUpVVldkcVEycFZiM2RDZUZSaUwwUXJaRnBRZERrd2JUTjNObU5wVERKR2RrdFBRMEZyV1hkblowcERUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZYZWtoc0NqRnFaVnBxUmxGelUzUXlRV3htWnpKVGN6UmFibkZ2ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UW05alF6aDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwVm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkZZMGhXZW1GRVFUSkNaMjl5UW1kRlJRcEJXVTh2VFVGRlJFSkRaekpPUkVwcldWUk5NVmx0Um10TlZGSnJUa1JCTkZscVFtaGFSRVpvVDFkT2FVOVVXVE5hYWxVeVRtcGFiVTU2VG1sYWJVbDRDazFDZDBkRGFYTkhRVkZSUW1jM09IZEJVVkZGUkd0T2VWcFhSakJhVTBKVFdsZDRiRmxZVG14TlEwMUhRMmx6UjBGUlVVSm5OemgzUVZGVlJVWlhUbThLV1Zkc2RWb3pWbWhqYlZGMFlWY3hhRm95Vm5wTU0wSnZZMFJCWkVKbmIzSkNaMFZGUVZsUEwwMUJSVWRDUVRsNVdsZGFla3d5YUd4WlYxSjZUREl4YUFwaFZ6UjNaMWx2UjBOcGMwZEJVVkZDTVc1clEwSkJTVVZtUVZJMlFVaG5RV1JuUVVsWlNreDNTMFpNTDJGRldGSXdWM051YUVwNFJscDRhWE5HYWpORUNrOU9TblExY25kcFFtcGFkbU5uUVVGQldVNWpSRkJ3YVVGQlFVVkJkMEpJVFVWVlEwbFJRMGhPYVhodVlqTTNXbk5MZEZSaEwzbDRiV2wzV0ZkdlRGSUtkbVJKUlhSMlJXMXVLMkZLYkdOQ04zaG5TV2RIWTA5aVQzTXZOMFZ4TjFkbGVtUkNabE52TVc1UUswZFBSVzlvV2xNNE9VMXpaVmsxU2xoc2NpOVJkd3BEWjFsSlMyOWFTWHBxTUVWQmQwMUVZVUZCZDFwUlNYZEdlVEExZGpCQmVqa3hkM1E1V0dGaFpuUnhTM05aVG5KRWRtZHlZVXRPUlRkYWJESkNlbWhZQ2xsVk5UWlNOSEJPTkhOVFpYbzRjVmwyVVU1SFFVUjZkRUZxUlVFMWRXOXZObVJsVlZWb2NVODVUMGRJYnpsaWFqVjNVMmRXYjFRMFVWUnVOMnB4U3prS1lteHFNMmhoVURSMU1EZE5kRFV2VmxGT1QyMUJkM0IwWlU0clJBb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0ifX19fQ==",
          "integratedTime": 1663696724,
          "logIndex": 3620636,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/php/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3092335182",
      "sha": "642da35bad14d408b0ad1a9cb967f5666f73bfb1"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

