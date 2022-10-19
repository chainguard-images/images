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
| `latest` | `sha256:9fd921d1e97f664634827660e125761102b9a0d2d8bef729f2f3e80d884c944d`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:9fd921d1e97f664634827660e125761102b9a0d2d8bef729f2f3e80d884c944d) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:9fd921d1e97f664634827660e125761102b9a0d2d8bef729f2f3e80d884c944d"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "32972435d79e217870b1837eca6cf91df5304dae",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCnaA4BPILA9dJyCDwBRrHziU5YioVy7Cbo5OkrrEv89AIhAJIgQpUVdbeJ9xUUECk92h7oJzrpNISdEpJzarKKRfVY",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIxZWUxNDA1NjdjNTllM2UxODJkYmViODBjNTViMWRjMzE5MzhkMTA1MWZkOTM2ODc1NzIzMTU2YjkxM2UxMjFjIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQXhxbi9uMFZFQzIzT3ViZHVZcHZCdlR3SFd0cDVvdm9FQTlJbUpLQ2ZDSUFpQTNJY1JneEx6T3g2Sk96Q0piaTdWMU9PYjdnOUNib0gzNkNhZjZWMTEya0E9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBWRU5EUVhwMVowRjNTVUpCWjBsVlRUTXZlRWhhVkZwVGNFZHVZVzVrTjNKQmQxRXhUM0JaU25kemQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRWTlJFVjRUMFJKZDFkb1kwNU5ha2w0VFVSRk5VMUVSWGxQUkVsM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVV5UWt4d2VtaEJjVlpaVlRSUU5qTnhibGRIZFhGRmRHcE5WRzFNTHk5TFVHUkVUVVlLY0RoeloyaE5hRVZCYTA5RGJTOVJaSE5uZGxwT1NGa3dVVE55VW1rek5DdFVZUzkyTHk5aWN5dG9NRU5SZEdFMGFXRlBRMEZzYjNkblowcFhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZOUzJ0QkNreDVVbVZ1TWs5eloyTmllVGhET1VWVk1UZDVNMjVKZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Um5OalIyeDFXbE14YVZsWVRteE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyZDZUV3ByTTAxcVVYcE9WMUV6VDFkVmVVMVVZelJPZWtKcFRWUm5lazR5Vm1wWlZGcHFDbHBxYTNoYVIxa3hUWHBCTUZwSFJteE5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKR2MyTkhiSFZhVXpGcFdWaE9iRTFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxuV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk0UWtodlFXVkJRakpCUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ1p5c3pValpVVFVGQlFWRkVRVVZqZDFKUlNXY0tWVFZHUldOU1FtbERlSFJzVFRoQmVWcFlWekoxY0VreVVHdHlkMkZwUjNWMFRFb3djM0ZMYXpkaGMwTkpVVU51TTBNNFJ6SkphV1pCSzBwU1l6TktlQXBSVFhCU2EwVjVTMDl0Y0c5elFqWnZWRzh6Tlc1Nk1DOTRla0ZMUW1kbmNXaHJhazlRVVZGRVFYZE9iMEZFUW14QmFrVkJOVVpvZG5SeU1HSkNNa2hCQ2pOS1IycHhSMjh6UW5GdU5qWTNTVEZXVTFkWlJVUmxUV2dyZUZSWWVVUlVaRXRGVDJsSk1saG1UekZZVkdVMFluWnJkM0pCYWtKUVRGRklXRmhIZGpJS2NqbDJVMjFaUWtkV1YxZFNTMnB2T1RKdWNWRlhRMk51UkdVNU9IY3lUMkpCZGk5eGFIQXlja3hxVFROelVuZFdZMUIzVDJzNVVUMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1666142326,
          "logIndex": 5399053,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/alpine-base",
      "githubWorkflowSha": "32972435d79e217870b1837eca6cf91df5304dae",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3278101466",
      "sha": "32972435d79e217870b1837eca6cf91df5304dae"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

