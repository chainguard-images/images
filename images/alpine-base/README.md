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
| `latest` | `sha256:3ea4113f97777dba40338055dddce4b3ff77705ff6e9b6b447e3d8fb53f439d4`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:3ea4113f97777dba40338055dddce4b3ff77705ff6e9b6b447e3d8fb53f439d4) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:3ea4113f97777dba40338055dddce4b3ff77705ff6e9b6b447e3d8fb53f439d4"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "66663a3667ea7dc1f7c7baf06e76ca6639e2ef7f",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDi1oAdV5JdaG23YuCrQ176PuISwe/kAmOGQpaJRkrUSAIhAJ1JtYWYxLNEB4oU4fC+41m9oDAxEC8TrwixhGS1ODAg",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI2ODA4NGU0MzAxYWY2NTY0NjE5NDAzNmVlMDgzZmM2MGI3OGZlZTg5NWU2Y2YyNzFlNmFiOWFkNGYzNWUwNGI0In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJR3I2Y3NPVDIxalFaTWpGV0FyeTZscC9OQkp0MkNsTzNUckdSaHZXcGc5RUFpQUZ5QzM1RS92U05ZUnA5emNVckhNdkJIclNTQWFSNkh2YVBWQlAwcFh1Rnc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpla05EUVhweFowRjNTVUpCWjBsVlNFNVNWMVV6UjFkS2RHRXZiRTAwS3pOeGNrNXZORlY2V1dzd2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRGTlJFVjRUbnBKZUZkb1kwNU5ha2w0VFVSRk1VMUVSWGxPZWtsNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZRZGs5Q2MyaHJOalJ6YmtSd0x6aG1XR1JSTVd4UWJFVlhhMFJuU0RCbmJHVnVhRVlLYml0UFVuRlRkbmRrY0d0SlRVbGhlV0o0WVdsdEszazFlRWhWYWpST1pWWmxSM1oyTmpOdUwyVm9aWHBXS3k5UlZqWlBRMEZzYTNkblowcFdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlY2YlVGYUNrSlBkMkYzWW05T2RDODJaekpYY0RoaE1HWTFURTVWZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Um5OalIyeDFXbE14YVZsWVRteE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyY3lUbXBaTWsweVJYcE9hbGt6V2xkRk0xcEhUWGhhYW1ScVRqSkthRnBxUVRKYVZHTXlDbGt5UlRKT2FrMDFXbFJLYkZwcVpHMU5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKR2MyTkhiSFZhVXpGcFdWaE9iRTFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxSV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUkzUWtoclFXUjNRakZCUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ1p6bHJNMnMyVFVGQlFWRkVRVVZaZDFKQlNXY0tRVFF2T1RJcll6QmtZVE00WjFBeVR6WTRTa3BTUlV0bUwzSmlVeloyYUZvMVVXeGFVV2RLU0UxR09FTkpRbGx6U0ZZemJERnRTMmg1VkRsSlptRkVVZ3BNYlRkM2NTOXNhMlpQZFd4T2FrMHhjQzk2V1hsWFZYcE5RVzlIUTBOeFIxTk5ORGxDUVUxRVFUSmpRVTFIVVVOTlFWVTVNbmR0SzJsUFJtcFhVbUUxQ21aeVlrNDFRVGc1V2xwcGRYVnNhbmxzWjBSUlZYWkZWbVZWYmtaVFVrRnZhRVZTT1VvMFQwVjNSV2tyUjA1TVVXbEJTWGRRTWtwM2VrWnJiR0UySzBJS1NrbDFMM2xaVWxCMVZtdFFVR2swWW1sU1lsQmhSM2hYY1dGVmRVSjNObEZPU1ZseE9FRnNWbmhGZERCMWFYVXZZMUpSVlFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1665796664,
          "logIndex": 5127572,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/alpine-base",
      "githubWorkflowSha": "66663a3667ea7dc1f7c7baf06e76ca6639e2ef7f",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3253916478",
      "sha": "66663a3667ea7dc1f7c7baf06e76ca6639e2ef7f"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

