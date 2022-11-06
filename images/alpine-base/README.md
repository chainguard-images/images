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
| `latest` | `sha256:f5a86bd4664e3cd297648ea6713973713ebfb68d29c410c62a99ac413b7583e1`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f5a86bd4664e3cd297648ea6713973713ebfb68d29c410c62a99ac413b7583e1) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:f5a86bd4664e3cd297648ea6713973713ebfb68d29c410c62a99ac413b7583e1"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "7ec821b6e9949790dd6002873e26216b125adb94",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIHfq3ipmT1Vr6QpAMcDZPwUUUoiAiHD0W0l8U5d1BRxiAiEAjVW4V90SZ6TKcILD5KyQ+uELX3dRmB5y//wZS7HSs9Q=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjNTM3NmMwMDFlYzcxZDJiODFhYjBjYjU0MGE0NDgyOWRiYzk5NDU3YjU0ZWFlYmNmZGVkMzYwM2IzNjIzM2IzIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRytEVXpiR1lJcnNsT2xlOG1YeVc1UmF6azBCR1Y3S1BQVWtjNTZLbmY5ZkFpRUFoWEkrZHJKcHdhSC8rYVFOYTg2TDFHNEJVaERoaTZhN1VBQWEzUGNpUW53PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBha05EUVhwNVowRjNTVUpCWjBsVldUQllkbTByY2tWemRURk5ORTFQY1VwWGJYTnNjbkYzVkdSRmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRKTlJFVjNUa1JOTkZkb1kwNU5ha2w0VFZSQk1rMUVSWGhPUkUwMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZNVkdGWVQzaHFiRFpUYURSMmNDdEdkMmMyU0dST2RuWnFUbUZNV0VjdmJDODNlVEVLU0VocFowNU1kaTlPYzNFM1lrSmtWVTVOUTFjdksxVTBabmxpUVdKNE9WUk1SbWt5T0ROVlNFdGFaM2t2VERCc2NFdFBRMEZzYzNkblowcFlUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV5YVV4bENqSlpOM1pqTkZWeWVuVkhaV293U0VOTFltRktlbmhSZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Um5OalIyeDFXbE14YVZsWVRteE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyY3pXbGROTkUxcVJtbE9iVlUxVDFSUk5VNTZhM2RhUjFFeVRVUkJlVTlFWTNwYVZFa3lDazFxUlRKWmFrVjVUbGRHYTFscWF6Qk5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKR2MyTkhiSFZhVXpGcFdWaE9iRTFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWwzV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk1UWtoelFXVlJRak5CVGpBNUNrMUhja2Q0ZUVWNVdYaHJaVWhLYkc1T2QwdHBVMncyTkROcWVYUXZOR1ZMWTI5QmRrdGxOazlCUVVGQ2FFVndNekZWV1VGQlFWRkVRVVZuZDFKblNXZ0tRVWxCU1U4MWVFRjJjMU5DTTBKVVMybFlaVlIzV21WUGVYbHNWM2R1TlVod0syZE5kbk41TkZCQ1NtWkJhVVZCTkZWeE9VTkdWbEJJWTBWVFptaERlUXA0WXpkSmVsTnRVRlZXZEZNMWNHTXZiSFFyZERBMVRGVkJhMnQzUTJkWlNVdHZXa2w2YWpCRlFYZE5SR0ZCUVhkYVVVbDNVbmRNWlhWQ2VWazRXVmh3Q2tKSVpYWk5jRmxqYW01dU5UTmtSMFJXVTIxblFtSTBibE5KUzBkRmIwMTZVRXB4TDI5elVDdEVUbWQxTjBsNVlXeGxRMnBCYWtWQk1uUmtiMmxDUWxZS2JrRnBPV0ZYVkVzNGFESlZZa0UzTTJKMFVXcHBVRkJUUlZJck5IRmxiRGx0U21OSlZGRnRORXBqUVRGdFkyUlNTMlpRZDJ4eFRURUtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1667696708,
          "logIndex": 6590045,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/alpine-base",
      "githubWorkflowSha": "7ec821b6e9949790dd6002873e26216b125adb94",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3402361195",
      "sha": "7ec821b6e9949790dd6002873e26216b125adb94"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

