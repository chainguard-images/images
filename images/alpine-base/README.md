# alpine-base

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/alpine-base/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/alpine-base/actions/workflows/release.yaml)

Alpine base image built with [apko](https://github.com/chainguard-dev/apko). Uses packages from the [Alpine distribution](https://www.alpinelinux.org/).

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/alpine-base:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:6c9ada3dd1a2c7214daf904d724ee1ab9652a37ff3a215d40061baad5cf05929`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:6c9ada3dd1a2c7214daf904d724ee1ab9652a37ff3a215d40061baad5cf05929) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:6c9ada3dd1a2c7214daf904d724ee1ab9652a37ff3a215d40061baad5cf05929"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "6656355427d66e0ffbf1f0700e2de7d9c0e5d1a4",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIEot+Ha3M5hKLwIGW2poS0BnGkQuHQ/65vxPLFRcquEpAiEA9NSPoyQYyrCUG6O6tvtGopTs/+nH7pmEifBcHPHIDGo=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJkZGViZjljOGU3OGM1OGQxNmY4NDM1OGQ5ZDFhYTE5YzZjYTkyNDkwMDBlZWViZTFkNjgwODI3ODQ4MThhMGE1In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURkck40bS8wdWxuempUNzdFMFNzcm1lbmY2MFREQWV3RHZodTA2c0ttK3dRSWhBSnJiR1E4OHNSMFphM2Y5cEMyb01OY0RENUUzcHBQT3lWaXg0L0EvOW9DbSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpla05EUVhweFowRjNTVUpCWjBsVlRFaHRhVVZRY2pkMk5WcFFNalI0UlhadGRtSTNhbVpCVjJ0emQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRSTlJFVjRUMFJCTkZkb1kwNU5ha2w0VFVSRk5FMUVSWGxQUkVFMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZwTlRrMWJUUjVTWEZCTHpZM2JVNTZkazV5U2psbU5rVm5VVGhWWVZnMFZrRjVNbEFLUlRKcFkzbFZWRXBUTVV0c2NGWmpkRUZVUkcwelEyZzBNVFpCVDNWQlZqWlNRVWxDZW01MFRUVndhakl2VUUwMFQyRlBRMEZzYTNkblowcFdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZJVmtjckNqUnpVVzlHYkhKdFluQk5keTlPTUV4YVNrWnhSVXBCZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Um5OalIyeDFXbE14YVZsWVRteE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyY3lUbXBWTWsxNlZURk9SRWt6V2tSWk1scFVRbTFhYlVwdFRWZFpkMDU2UVhkYVZFcHJDbHBVWkd0UFYwMTNXbFJXYTAxWFJUQk5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKR2MyTkhiSFZhVXpGcFdWaE9iRTFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxSV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUkzUWtoclFXUjNRakZCUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ1p5dHBjbGd2U1VGQlFWRkVRVVZaZDFKQlNXZ0tRVXdyTkd3MFFqbHdibWQyTUZsVGNqQm5iM1pHVkhneGVucFhVblJHUVhrdksydDJabVpoUm10RE5XVkJhRGhQY3psdUwySjRVelF3U0U5REsyUnNOQXBJWVRGa2FsVnhLeko0VERONVZDc3pTVVIwTjJnclJIZE5RVzlIUTBOeFIxTk5ORGxDUVUxRVFUSmpRVTFIVVVOTlIwNUtWamQyVlRVdlQyMVVUazF3Q2xWa2FuUlZhRlZFUnpSdlFqSnVaSFp0TXpsTEszZzBZalZoY2psVE16WnBVVVZSU2pCcE5Wb3lTbVJWYTJseE1uVjNTWGRaYldkQ2QwSkxVME0wZGtjS01EZ3dTbTFDUjNOaGJXVm5RV3BqVlhReE1XMXJTWFpIZGxCSE1XcElZWFJaVW5Sdk5IaFlOWEJRWW1GV01Ha3ZTREJDWkFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1666055927,
          "logIndex": 5317287,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/alpine-base",
      "githubWorkflowSha": "6656355427d66e0ffbf1f0700e2de7d9c0e5d1a4",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3269868399",
      "sha": "6656355427d66e0ffbf1f0700e2de7d9c0e5d1a4"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

