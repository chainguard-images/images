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
| `latest` | `sha256:c950c7d83ed72b16d8eee0d80f4db99ce9282e93441275cd99d3e02c78ee7e7d`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c950c7d83ed72b16d8eee0d80f4db99ce9282e93441275cd99d3e02c78ee7e7d) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:c950c7d83ed72b16d8eee0d80f4db99ce9282e93441275cd99d3e02c78ee7e7d"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "20d7732eee4f131b52e6dcbee1834550428be8d3",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDcYRE4bY4fJ62N7hBHBNqN8aN+FyUP0ke/anuVNc54kgIgQRbZh7837J2wygB7vYDSSRdjCT04iP8OUx0gWAjC05Q=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJiYjg3NDYzM2RmMjBhZTNmMjZlZGYyOTFiYjkyYTQxM2YxMzFhZTVjZTdmNWQzNmIyYzE4MzQ2OWY5NzFhMTE0In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUM0TXFBWDNPSVVLOXZUdkMyNG9mS3RsR09Fc3pCOWN4YU9Obkp4WTUyMDNnSWdYWTBLU2pYUmJvV2xwRHNjU25xVmJCdkF4dzIvZzVzZ2lEd3AzWVNLcC9zPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpla05EUVhweFowRjNTVUpCWjBsVlFqSjRjbE40WVRSRVkwbDJUWGMxVmpGbmMzSktlSGhGYkRGbmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hsTlJFVjRUVVJGTkZkb1kwNU5ha2wzVDFSSmVVMUVSWGxOUkVVMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZGVVhvM2NrVmlOVEIwVTJ3eE1tNHpUemhuTW10elJUbHVRVU5DWlZkMlUwNXRVbUVLZGprMVRGTjNjemhHVTBaeE0xVnZSamMwTkROQ2ExSkpNVzF3UVM5bVozRm9WM042ZEVaNFdWSlVVVWRYU2xsd1NIRlBRMEZzYTNkblowcFdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlYzVlhWekNtcFNkRkJQZG5ST1NXVkVkR0ZHTDAxUVMwaFpaMkl3ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Um5OalIyeDFXbE14YVZsWVRteE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyZDVUVWRSTTA1NlRYbGFWMVpzVGtkWmVFMTZSbWxPVkVwc1RtMVNhbGx0Vm14TlZHZDZDazVFVlRGTlJGRjVUMGRLYkU5SFVYcE5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKR2MyTkhiSFZhVXpGcFdWaE9iRTFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxSV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUkzUWtoclFXUjNRakZCUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ1p6SkxLekp6U1VGQlFWRkVRVVZaZDFKQlNXY0tWRzVXYTFCMFpGVjZTR2h3YTAxcVltcDFSa2x3YlU1UlZreHlhVEJwU1M5NEwxQlpSbWxUYVN0UVFVTkpSelp3ZFdGSFFqRmFlVmcyWVRkVk1Tc3lXQXBITnk5V2FrbzVlRTFLWTNsS01VSlRVMk50V1hwSVZVSk5RVzlIUTBOeFIxTk5ORGxDUVUxRVFUSmpRVTFIVVVOTlFtazRTbmhtUmpCaWNEWjNNREpJQ2sxblpITlZhMVJUWW1Sbk1rNHdhU3R2YTJ4aFNHRmlLMDFvUm1STE1sbE1hSGhYWVdWNWFWRnZSbGhIVUZWamRHeFJTWGRFWW14alIwbGxNMUJCYlZRS2FWUkJTa1JyTlRoTmRWSk9UWFpZU2xaa1lqWm1OVGhSUlZsbldYSTNWMU5aUkZseGJFWlBRbFJhYVZwaE5YWmpXV3g0Y1FvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1663809058,
          "logIndex": 3712574,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3102177142",
      "sha": "20d7732eee4f131b52e6dcbee1834550428be8d3"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

