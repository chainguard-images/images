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
| `latest` | `sha256:9c48e8e0a1fb03798ca7ca53c4c749090f925847e32dc50077b7a818a969ac60`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:9c48e8e0a1fb03798ca7ca53c4c749090f925847e32dc50077b7a818a969ac60) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:9c48e8e0a1fb03798ca7ca53c4c749090f925847e32dc50077b7a818a969ac60"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "5706b6c84abbe11b3534bc1f18727094fbef820a",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDXO89KZ0oNG042Y44ghDii9n0xLSpDJ/YlTEsBjqCRWAIhAMhimnJK88868GUlI0/i4R8Ma9kktvI7Ra4S7WsAoiGO",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIyZWQwOTY3YmVmNmJmYTE5ODM1ZDFmYzhkMmEwZGFiMWMwNTc5MWVkMWE1MzQxNmEzZmVjM2ZlYzIzNmM1YmMzIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQ3BobnB2R29KdXN5aWlzbWRjVk9lRGRvVkE1ZVg3TkpJM1ptcFJVdlpyUEFpRUE0SmJ3QzYrbzFLemJLNWd4cEYvQUVWaGJBYjYwT2FYeGRrVHM4a0kxaE5BPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBSRU5EUVhweFowRjNTVUpCWjBsVlZXbEpVemxXWWtkcldtRmFURmN2TkRaeWJqVlpOMjlCYjBsM2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlhoTlJFVjNUbnBGTWxkb1kwNU5ha2w0VFZSRmVFMUVSWGhPZWtVeVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZSZFRsVlJFOVJaRmRaU0RSVGVrSnBXRkZYYUZSVVdHdHVURk5sVTBOeWJWRXhPRzhLYjJOWE5tMUljVFF5UVRCdUsxVjRiMmhuWTFKaU9ITnRjbFYyUzBGdGFYcGpZMFJRVmtwSVltdHlhWFZ4UTAxQlFXRlBRMEZzYTNkblowcFdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZDWms1U0NqQlJVMnBWY1Vod01HVlBWa2wyYjBkbFJtcFVjVU4zZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Um5OalIyeDFXbE14YVZsWVRteE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyY3hUbnBCTWxscVdtcFBSRkpvV1cxS2JFMVVSbWxOZWxWNlRrZEthazFYV1hoUFJHTjVDazU2UVRWT1IxcHBXbGRaTkUxcVFtaE5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKR2MyTkhiSFZhVXpGcFdWaE9iRTFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxSV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUkzUWtoclFXUjNRakZCVGpBNUNrMUhja2Q0ZUVWNVdYaHJaVWhLYkc1T2QwdHBVMncyTkROcWVYUXZOR1ZMWTI5QmRrdGxOazlCUVVGQ2FFZFJOa1JPWTBGQlFWRkVRVVZaZDFKQlNXY0tTVTAzWldNdkszRXpiR0ZwUlV0MmFtTkhibGhhZG1VM1RYSjBkWGQ1Y2t4dU1GVXpZbVpXUkV0eFdVTkpSbUYwVkRac2RXUXpURUpKYjFaS2F6UkNlUXBKV20xeGRERlFjR0pGU1hCMVVFSjBjbmxtUm5kRWVrTk5RVzlIUTBOeFIxTk5ORGxDUVUxRVFUSm5RVTFIVlVOTlVVUTNRVlZTVmtwUVluWjFaVmh1Q2tGd2VsUjNUWEpPY25sUlFURnRiM3BGY25kT1ZVVlRjV0ZsWmtzM2FVWTVNRUZsZEcxbk9HdDJiVUp6T0hCWmJEQk1UVU5OUldsT1JtaFdXRVpCVjFvS1ExQTVURFphVGxkdWEwaFZTa1F6TjFORlJVbHZOVnBTTWtKTldVcG5ZVFp2VkZoSFFsUnVhV3RGV1hSTVN5OUNORlU1VEVkUlBUMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1668128875,
          "logIndex": 6848486,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/alpine-base",
      "githubWorkflowSha": "5706b6c84abbe11b3534bc1f18727094fbef820a",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3441676619",
      "sha": "5706b6c84abbe11b3534bc1f18727094fbef820a"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

