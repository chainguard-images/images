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
| `latest` | `sha256:c0d9be637651757e080dda801920846869f606e92d6a77fe2d066014ac3f42db`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c0d9be637651757e080dda801920846869f606e92d6a77fe2d066014ac3f42db) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:c0d9be637651757e080dda801920846869f606e92d6a77fe2d066014ac3f42db"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "df846eeb052c9773aa17da8ef894a8842d485cab",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCICh9aiSN7tKcQW2M3hfOtKjXefyDTzF1ZrdDyLutiuX0AiASkwEmo496tuJcDvBqK9+R77B9822+Wf2CIyrjPdXMbg==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI0MjhiM2I4YjQ4MDMyNTIwNTMwNzgyOWY2MGE3OWE0Y2NiZGM0MjgzZjA3YzVhNTg1YmMzNDU3ZjczYTYwNDVlIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNzVXM5Ujd5UXNia2FtUVMxeEwzMk5vR1FZUkVvOExEdkRKZC9zVGN6THN3SWhBTU1uQ0Z5c285UUd3Y1F6WWlHbTF6NUtyV094WFNmY0pBaXplUVhjTnQveCIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBha05EUVhwMVowRjNTVUpCWjBsVlYzQTVXbGRvVTJ0eFZXaFJORWhLYzJaemFDOTFaakpFZUZNMGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVhwTlJFVjNUbXBKTUZkb1kwNU5ha2w0VFZSQmVrMUVSWGhPYWtrd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYwU2pSMlVtWkdTWFpSYTJST2R6Qk9aVTV4ZDNoaE5YbFVUa3RvY2toWWFVaGFkVmdLVm05M1JDdFJRM2RUU1VGaGNUVktRMmhQY1VSSlJVNHZTWFJZTUhGYVEySkJkMUpQVDNOWVNpdHBRWFl6YzAxRGFtRlBRMEZzYjNkblowcFhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlY1VWxweUNqazViRzB5Y0RSTGEwaHBiblIwZDBWNVZFbFhNWFZ6ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Um5OalIyeDFXbE14YVZsWVRteE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyaHJXbXBuTUU1dFZteFpha0V4VFcxTk5VNTZZM3BaVjBWNFRqSlNhRTlIVm0xUFJHc3dDbGxVWnpST1JFcHJUa1JuTVZreVJtbE5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKR2MyTkhiSFZhVXpGcFdWaE9iRTFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxuV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk0UWtodlFXVkJRakpCVGpBNUNrMUhja2Q0ZUVWNVdYaHJaVWhLYkc1T2QwdHBVMncyTkROcWVYUXZOR1ZMWTI5QmRrdGxOazlCUVVGQ2FFUnpSMWxtVlVGQlFWRkVRVVZqZDFKUlNXY0tZblZWYW5Fek56WjVSRTkzYUUxb1ZVcHVSblJwYzJjemRIQk9Ra1JqYVhOR2JUTmFVMGxPTWt0alVVTkpVVU5aVkdSRWRIbEZhR2g0V2tSa1JHbDJaUXBUUlZaNFFtOTJPRFZzUkZGeFlqTXZRalpzVmpWclJtZFlla0ZMUW1kbmNXaHJhazlRVVZGRVFYZE9jRUZFUW0xQmFrVkJkelZCYUVad2NHTktXaTkwQ2pJNGIyRk5RVVpTYWk5WlMxVXdVaTlEZVZod04zcEhjMWd4YTNkaWMzUndSRmhHUkUwME5IZEtVbVpxT0hCYWFGTkVTV2RCYWtWQk9XcElibXRHSzFJS1p6VXhkMDFqTWtKQmVtZG9lamM0VWxSU00xbDZlV0ZISzAxblJXbHlkalV6VG5CT1VFNVBSSGhpZUUxU1JIQTNlbVowT1c1eGRrWUtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1667437608,
          "logIndex": 6392836,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/alpine-base",
      "githubWorkflowSha": "df846eeb052c9773aa17da8ef894a8842d485cab",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3382272740",
      "sha": "df846eeb052c9773aa17da8ef894a8842d485cab"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

