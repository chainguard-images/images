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
| `latest` | `sha256:df54eeb65409315d77e4c24b1d9a1cecfe7e419f4e16b7e8a13cc4582cf27683`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:df54eeb65409315d77e4c24b1d9a1cecfe7e419f4e16b7e8a13cc4582cf27683) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:df54eeb65409315d77e4c24b1d9a1cecfe7e419f4e16b7e8a13cc4582cf27683"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "3325969de203905921e6d0fd7f2d5e42e92d7791",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIEzOd5a5jhVzU9fX9UUambA6NQagGjk9nJUqR+bc5X7DAiAg4yln8HzmtMYMIBgI6bARqSzK2h8hYGeFpYELyDvfqg==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIyMDljNWM3YWNkMjcwOGM3NTdmYmYxNmJhZWRlOWI2M2Q3MjY1ODA4ZTc2MDBmZjM1NTc1NWI5Nzc2ZjYxN2RhIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUR5aUJTZXRrbjhZYlNZR3VrNnBwT0JxaTY1emRZeHZLcFdIVi9zazZ0NUhRSWdjem4xaGVzemNLcWNzUzhvTElkM2Z3eC8xTEJMb0ZIWWpITU1ZYi81Q1EwPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBSRU5EUVhwMVowRjNTVUpCWjBsVlpVVkNLMnAyV2xOVFNWUlNkM1JpTTBweGJHVmxZbEZoUVhSemQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRSTlJFVjNUV3BSZVZkb1kwNU5ha2w0VFZSQk5FMUVSWGhOYWxGNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVU0VDA5RGJ6UTRlVlV2V0hNM1VuazJhaXROV1RGNlZtVXhRamRsUW5Wd2EwMW9lVFFLZFZoTE5sVkdZMFppTTBwUVUxcFlkbG8wTlRKT1lXSlRLeXMzZGxSNFFtTXlOMEpHVkU5SFQxTlJTMU5vVUdaVFpIRlBRMEZzYjNkblowcFhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZMY2xSWUNtcHdhVEVyTkhJNWNGaHpVR0ZDTUM5M2NVTjNaVmRWZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Um5OalIyeDFXbE14YVZsWVRteE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyZDZUWHBKTVU5VVdUVmFSMVY1VFVSTk5VMUVWVFZOYWtac1RtMVJkMXB0VVROYWFrcHJDazVYVlRCTmJWVTFUVzFSTTA1NmEzaE5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKR2MyTkhiSFZhVXpGcFdWaE9iRTFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxuV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk0UWtodlFXVkJRakpCVGpBNUNrMUhja2Q0ZUVWNVdYaHJaVWhLYkc1T2QwdHBVMncyTkROcWVYUXZOR1ZMWTI5QmRrdGxOazlCUVVGQ2FFWlVRM2xKUVVGQlFWRkVRVVZqZDFKUlNXY0tZM1pDV2paSmNFUlFlbTFWVDB0VGNVdDFRVXBtWW05blpUaHRjVGxMYTBGb1dra3ZSRXBCZFU5SVFVTkpVVU5ZVlRSMWREZDBNalY2TTFsc1JVWXdUUXBCZEZaUWNsSTFaMmxFU0dSSWRsZGtiMmxsUjA1NFFtVjNla0ZMUW1kbmNXaHJhazlRVVZGRVFYZE9ia0ZFUW10QmFrRk5ha3RTT0VOdVRWRmpUR0Z5Q2xaamFVaG9kSFUyZEdZeVVsQmhkRTFCVlV4a1VGUndaWHBhUjFNemIzWndaMUpGUkdOblVHOVhTV1F2SzBsT1RVRmFPRU5OUVVndlVTOXNTMWRrYkRBS1owWjFSbkEwTXk5alRHWk1XRzV5TjI5YU9GWXZjVk5rS3pCQlkyOHdZMUZ2VkRWdFpIRlBlSEZ5UjNoV1FYbFhkVXg0YkdwQlBUMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1667869384,
          "logIndex": 6703652,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/alpine-base",
      "githubWorkflowSha": "3325969de203905921e6d0fd7f2d5e42e92d7791",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3415442542",
      "sha": "3325969de203905921e6d0fd7f2d5e42e92d7791"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

