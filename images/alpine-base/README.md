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
| `latest` | `sha256:91485f468220ce8e8b6e3f09697c1748ad7b19c12cc3bf3555697458e8f827d5`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:91485f468220ce8e8b6e3f09697c1748ad7b19c12cc3bf3555697458e8f827d5) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:91485f468220ce8e8b6e3f09697c1748ad7b19c12cc3bf3555697458e8f827d5"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "c83e72e2a3f6ad85d4abd37abcf6aa9bb2908411",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIHvNY/3ooCSJ+DxNgrBA17aRCg2yE0C832q4mZgk/Jo8AiAm8GYg1Mw/7h4RDKrm4TbPx2ufwmU6SO3KvcjtmV9/iQ==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJmOGYyOWI2ZGY2ZDliODNhODk2YzI4Y2U3ZTkyYjZlOWI2YTM1ZjVmNzY3M2VhM2Q4ZDQ1YjE5ZjRlNDBiYTZjIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNqMHp3TGVRcnk4SVZ4c2JObVVpblN6QWYyd3VGL3dFZ0diVVdQSWRUdkpBSWhBS08xMTVJb2ZXMDNoSlk3dHdwS1IwbzRtNWdmZFNkcC9yYVkvWDJZK2hWaSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBha05EUVhwMVowRjNTVUpCWjBsVlJEUnpiVVV4TVdkb05rSjJXamRHZFdzcmNISjJUbmhwTlVSTmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRCTlJFVjNUMFJCZWxkb1kwNU5ha2w0VFZSQk1FMUVSWGhQUkVGNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZRVGpKTlpqTnlTalV4U21oTE16VXJVVEJ0Tm1jMFZGSm9jRFoyY25SM1VXcEJLM2tLV1VoRWNFZzBPV3h0V2pWbWVHbHhXRTE2YTFKS1FscEhhbFV2WjNJMmNGTkxVa015ZUVFMlowTXZibTlqWkRRMVRtRlBRMEZzYjNkblowcFhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZNVkhSVUNtRm5aR3hrTnpCdWJtNDBiMHhSTmtjek0xYzNXV0V3ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Um5OalIyeDFXbE14YVZsWVRteE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyaHFUMFJPYkU1NlNteE5iVVY2V21wYWFGcEVaekZhUkZKb1dXMVJlazR5Um1sWk1sa3lDbGxYUlRWWmJVbDVUMVJCTkU1RVJYaE5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKR2MyTkhiSFZhVXpGcFdWaE9iRTFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxuV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk0UWtodlFXVkJRakpCVGpBNUNrMUhja2Q0ZUVWNVdYaHJaVWhLYkc1T2QwdHBVMncyTkROcWVYUXZOR1ZMWTI5QmRrdGxOazlCUVVGQ2FFVkJkVkExYzBGQlFWRkVRVVZqZDFKUlNXZ0tRVXB3YW00MGFrbFBaVkZ0ZEN0T1EyaDRVVk5qTkdGNE1XRTRVMVEyYlN0eWRVSnlhakZJTVRSTVFXaEJhVUUwYmxCWFVYcFVVbTEwVm1FeE5GY3hhQXBTVVU4clowbDRTWE4xWTIxVFZrcERRamc0Ykc5bU1sUnZla0ZMUW1kbmNXaHJhazlRVVZGRVFYZE9jRUZFUW0xQmFrVkJNVFF5VlVwck0wdzVTRkJaQ2pkV1NXZERVbEJKZGxCdk5rSTViM2RCVDJkcmJFaFZabFpqTUdOMGRVVkdSRVZNZWxKRVYwOUZZMmN5YXpsblVrTXZaazVCYWtWQmFtRlNjM1JtVUZJS1RHeFpRVlZXYTJoNWNXOUZaa1ZXWjBNM05EVlVOMjVsVERWQ1dYQm1ja0pHYTNGQlMyWk1NV3BCWlVKdVEwaGxkSFZ1VGsxaVdUQUtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1667524110,
          "logIndex": 6458665,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/alpine-base",
      "githubWorkflowSha": "c83e72e2a3f6ad85d4abd37abcf6aa9bb2908411",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3390477566",
      "sha": "c83e72e2a3f6ad85d4abd37abcf6aa9bb2908411"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

