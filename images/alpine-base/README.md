# alpine-base

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/alpine-base/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/alpine-base/actions/workflows/release.yaml)

Alpine base image built with [apko](https://github.com/chainguard-dev/apko).

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/alpine-base:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:c150674ccc56a14e8cfeb2e61b2e45b9c6d41e822496ce01404cce3a0facbcec`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c150674ccc56a14e8cfeb2e61b2e45b9c6d41e822496ce01404cce3a0facbcec) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


## Usage

```
docker run cgr.dev/chainguard/alpine-base echo "hello"
```

See the [examples/](./examples/) directory for how
to use this as a base image.


## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/alpine-base:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/alpine-base:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/alpine-base"
      },
      "image": {
        "docker-manifest-digest": "sha256:c150674ccc56a14e8cfeb2e61b2e45b9c6d41e822496ce01404cce3a0facbcec"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "cfd6567dc30e2d9218c456c41468873798ddde12",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDHDpx/hVFFJoe5T5g+9i/Nz7J8iwotTmq55YD/qAXKpwIgQF8xPyAUbjpADzAiBQk0hvvjyuhRA5mE5IKe1r1nSVE=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5ZTk2YjBjZTJiNjQ0YzQyMDU5NzYzNzJjYTI5ZTNhZGQ3NGU2YmU3MzM4ZjA1MzlkZDJmOWQ1ZTA1YjYwY2U1In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRzZlNDdtUVhGY1V6MlU3TFpxQ1pBeDgrWXNsdytXVWNxQmU1QlNHbjVHVUFpQmRwU0ZiNDRxc09mcmFPN2Y3VVpCVmFjeWtCWjkzL2JzTW1lK0dnS3luYXc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBWRU5EUVhwMVowRjNTVUpCWjBsVlZqaGhkR2hVTWxkWk9IZEpZa0pQWjFOcU1EQlpaVmR0VDNGUmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hoTlJFVjRUa1JWZWxkb1kwNU5ha2wzVDFSSmVFMUVSWGxPUkZWNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYyUTBGcGVtaHFZMDVFVDNKYVdsRkdRMkpxT0N0TWFsZFVlV2hWZEdGMGNWaFliemdLZUZSdGFrOW1iSFYxV1U0eVEyOUNTVWN5Y0ZaYUsxWk9hM0JpVDJ3MldqaE1SR0ZrVVRWbksxTmtRV3hGZG1sU056WlBRMEZzYjNkblowcFhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZZYkc1YUNtZHhVMVI1UTFGWGNrbERXVk50UVhaelR6bGxSekF3ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Um5OalIyeDFXbE14YVZsWVRteE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyaHFXbTFSTWs1VVdUTmFSMDE2VFVkVmVWcEVhM2xOVkdocVRrUlZNbGw2VVhoT1JGazBDazlFWTNwT2VtczBXa2RTYTFwVVJYbE5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKR2MyTkhiSFZhVXpGcFdWaE9iRTFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxuV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk0UWtodlFXVkJRakpCUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ1p6RXlZM05yYTBGQlFWRkVRVVZqZDFKUlNXZ0tRVXN2TVM5d2VuVnNXRkJHTVdWUVlYb3hUMHBuVEZscE5qUllSWHBWYnpsclNqTnhaVkpHUVZFeWVtMUJhVUowUTBOWWJHdFljbU5oZEUxV1R6QnFPUXBIVVZvMFdHZHBOWFZXYUVkM1RtMU1jaTgyVjJGUGFYaDRla0ZMUW1kbmNXaHJhazlRVVZGRVFYZE9iMEZFUW14QmFrVkJjRXhSZGxWelFYSllXbU5GQ25KUWFEZDBUMDFET0M4M2JUTjNTMHhKV2xFMmRWTXJkMlZTU1N0dFNFZFlZMkpuWVRoa1dETkxhVlJRWW1KUmNURXpkRWRCYWtKTVpFaE5Sak5WVGtVS04za3pXQzh5TXpVeVFXWklXVTlxUkc1NGJrY3laVlJwVVV0RGNXNTBUMGx1ZVdOMWIzTlVlRmhvT1hOWWRIZENSVWNyT0hCTWN6MEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1663722915,
          "logIndex": 3642421,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3094539751",
      "sha": "cfd6567dc30e2d9218c456c41468873798ddde12"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

