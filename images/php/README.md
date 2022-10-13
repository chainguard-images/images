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
| `8` `8-bullseye` `8-cli` `8-cli-bullseye` `8.1` `8.1-bullseye` `8.1-cli` `8.1-cli-bullseye` `8.1.11` `8.1.11-bullseye` `8.1.11-cli` `8.1.11-cli-bullseye` `8.1.11-r0` `bullseye` `cli` `cli-bullseye` `latest` | `sha256:edab523c2263333cca956a3733647064b5be01ad0591aedcb9b7b841eccc805b`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:edab523c2263333cca956a3733647064b5be01ad0591aedcb9b7b841eccc805b) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
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
        "docker-manifest-digest": "sha256:edab523c2263333cca956a3733647064b5be01ad0591aedcb9b7b841eccc805b"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "3fade20a632816659e2f83934878411519cbdcfd",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/php",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIDOYjAihLCLIy6VpQkO+kSNAGJcVzB9SmKlfzv2UDLrVAiAtZq0PuoFeR8cSoZBKsDkNcBJN+2+tikxSs9oJM9wyFQ==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI2MmVkYmUzYTMwMmUwMDJmYTFlM2E1MzI1Y2U3ODRjZjMwNGRiMWM3YjIzYjZkNWM1MzliMTk0N2ViYTk0ZDRlIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNGbzdFNFoxSHlVRGFDbjMvWEkwMnpGMWM4SlpaMUx2cEs3MUc1RndZNzNBSWdVaHdBSXZnZ1dsOEZRV2g1NTF5WUFnSGE0RHJUNnRVSExzREFwWU9FanUwPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnZWRU5EUVhsaFowRjNTVUpCWjBsVlJteEtWMnBRWW1VeWIxcDBkMVZRWm1wTFRFOU9kVlpUUWpKemQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhwTlJHc3dUWHBKZUZkb1kwNU5ha2w0VFVSRmVrMUVhekZOZWtsNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZaTm1reE1FOW1SRWtyVGxJek9VaFdkekJVWlVoWE5DODJiM3BEZFZkMFJWcFdNRkVLTmtNNFV5OVpXVGczVDFreWNrSTJibXhMYmxwR1p6RkxkR1ZTUWpsclV6VXlTbXM1SzJWTVNUWjFjMnAyVkc1dWEzRlBRMEZyVlhkblowcENUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZrT0dOckNsRk5VMWxXWTNKM2EzUjVjRFJFUjFkVFFXNWxSVVJyZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDFwUldVUldVakJTUVZGSUwwSkdjM2RYV1ZwWVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UW05alF6aDFXakpzTUdGSVZtbE1NMlIyWTIxMGJXSkhPVE5qZVRsNVdsZDRiRmxZVG14TWJteG9ZbGQ0UVdOdFZtMWplVGx2Q2xwWFJtdGplVGwwV1Zkc2RVMUVhMGREYVhOSFFWRlJRbWMzT0hkQlVVVkZTekpvTUdSSVFucFBhVGgyWkVjNWNscFhOSFZaVjA0d1lWYzVkV041Tlc0S1lWaFNiMlJYU2pGak1sWjVXVEk1ZFdSSFZuVmtRelZxWWpJd2QwVm5XVXRMZDFsQ1FrRkhSSFo2UVVKQloxRkZZMGhXZW1GRVFUSkNaMjl5UW1kRlJRcEJXVTh2VFVGRlJFSkRaM3BhYlVacldsUkpkMWxVV1hwTmFtZDRUbXBaTVU5WFZYbGFhbWQ2VDFSTk1FOUVZelJPUkVWNFRsUkZOVmt5U210Wk1scHJDazFDZDBkRGFYTkhRVkZSUW1jM09IZEJVVkZGUkd0T2VWcFhSakJhVTBKVFdsZDRiRmxZVG14TlEwMUhRMmx6UjBGUlVVSm5OemgzUVZGVlJVWlhUbThLV1Zkc2RWb3pWbWhqYlZGMFlWY3hhRm95Vm5wTU0wSnZZMFJCWkVKbmIzSkNaMFZGUVZsUEwwMUJSVWRDUVRsNVdsZGFla3d5YUd4WlYxSjZUREl4YUFwaFZ6UjNaMWxyUjBOcGMwZEJVVkZDTVc1clEwSkJTVVZsZDFJMVFVaGpRV1JSUVVsWlNreDNTMFpNTDJGRldGSXdWM051YUVwNFJscDRhWE5HYWpORUNrOU9TblExY25kcFFtcGFkbU5uUVVGQldWQlJkV2gxZVVGQlFVVkJkMEpIVFVWUlEwbERTbVZJVURsUFZsZHVVV0pXUlZkaGFWVnBOV05zUzBkSk5IQUtRMDlIT1dkUWRrSjNTakZxWVdkTmFVRnBRV2hpTVhWdFRXYzFiRzlEV1V4MFpFSm9ZalJaYzNCNldHTnVSM1I1UTBoVE9XWjJTR1ppTVdoeE9XcEJTd3BDWjJkeGFHdHFUMUJSVVVSQmQwNXdRVVJDYlVGcVJVRjBhREJLY1daU1NXTjZWMjh3VVUxb1pUVlFaRzFsY1N0U2EwUjZjRXRIY2xscFIxVTBkM2N6Q21rNVVreEpWblpVVkZVeGJXOTZVVkZSVVU1aWFrNU5TVUZxUlVGM05tVk5kazFUTDA5NWJ5OVJaM3BsZVdGclJ6ZHdkWFpQZG1JMmJHRXJPRGRJWVdnS1VuQjBhVUUzVVVwRGRrNDJZMmxZTkVrd1NWcDRXR0ZDTTBsQmRRb3RMUzB0TFVWT1JDQkRSVkpVU1VaSlEwRlVSUzB0TFMwdENnPT0ifX19fQ==",
          "integratedTime": 1665654226,
          "logIndex": 5018563,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/php/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/php",
      "githubWorkflowSha": "3fade20a632816659e2f83934878411519cbdcfd",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3241303574",
      "sha": "3fade20a632816659e2f83934878411519cbdcfd"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

