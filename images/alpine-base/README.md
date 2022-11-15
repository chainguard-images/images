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
| `latest` | `sha256:fb9abe329f343b71e6e14b06fca1c2fa7b90c9f0d72a1033e616ee5c944f777d`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:fb9abe329f343b71e6e14b06fca1c2fa7b90c9f0d72a1033e616ee5c944f777d) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:fb9abe329f343b71e6e14b06fca1c2fa7b90c9f0d72a1033e616ee5c944f777d"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "41df04b1dff34490db584495f6b916ad1b0e8f6d",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIFmhUZOj5da3z+5Mf8yg1G1u34juMNsnJcTYzOtNsMajAiEAi1kXG5LClOSZ2I5P9p5JzW2l3FQC3m/3DHvNoOCvm/w=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJiNTgxNDA4YjIzYTM0YmQxMjAxMzM5MTA2YjkwNTk3YmRlNjhjODU1ODM0MTM1ODAxYTVmMThjNGU3OWQyZmM5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNaY1VUcGQ4Q293Vi9nREkzRnlyTEM2WWw0Q3I5RmxXZmlsS3FOamRhbmhRSWdIcjl0TGRtYVBxQ1RZZ244R1c0ZFRRK0ZtL1Nqc3cxKzRqREs3T3kzVE9ZPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBWRU5EUVhwMVowRjNTVUpCWjBsVldtRllibmhuZUdocmN6WXZabG8yZVUxNlpqQlVOVUV3VDJFNGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlRGTlJFVjNUVlJOZDFkb1kwNU5ha2w0VFZSRk1VMUVSWGhOVkUxM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ0ZEdGeE1IaDFkVXBGYVZwUFVFWnhZWFZSWkZaaFlVeGlaMFF3T1V0RFlreDBlbE1LVUVscVJYUlNZakI1WTJsaWNTdFhkV2xzVW1SUlJVeFpRM2htY2s0NGIyY3pWakJSYXk4MlVuY3lkMEo1WjJoamNtRlBRMEZzYjNkblowcFhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZRUlN0V0NuVXdWekpGTVc0eFRqVlpVbE01VTBadWRFZDBWbEpqZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Um5OalIyeDFXbE14YVZsWVRteE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyY3dUVmRTYlUxRVVtbE5WMUp0V21wTk1FNUVhM2RhUjBreFQwUlJNRTlVVm0xT2JVazFDazFVV21oYVJFWnBUVWRWTkZwcVdtdE5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKR2MyTkhiSFZhVXpGcFdWaE9iRTFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxuV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk0UWtodlFXVkJRakpCVGpBNUNrMUhja2Q0ZUVWNVdYaHJaVWhLYkc1T2QwdHBVMncyTkROcWVYUXZOR1ZMWTI5QmRrdGxOazlCUVVGQ2FFaHFUMDVPU1VGQlFWRkVRVVZqZDFKUlNXY0tVMVJEZFVSdk1VVXZiamhJZG5OVGJqRnJhMGhMYVVGTVVsVnFkSE54U25VMlNsRmFVbEJVZEVNME1FTkpVVU56T1dVck1DOW5la1J6V1dSUlVVTnNUd3B1TkhKR2JDc3hTazF6Vm13MFFVZ3JReXMxTkV4aE5FNURla0ZMUW1kbmNXaHJhazlRVVZGRVFYZE9iMEZFUW14QmFrRnZNV281Y1U5TFpXWk1hVWxaQ2psTFMxUllaemhTYkM5M0wxbDNlazR4VFZaTWVrNVNjVlJzVUZoVFZERkhlREJuT0dOQlVIWlRXRXBQTUU5cGFqVTVkME5OVVVRNU5VSkhkMnhGVEZNS1dDOVhRMU5GZUhONWFESnBWalJxWTNabFNtNXVjM2xVTDNGQlZrUlZZek00VjNGTWNuQXJWMVJWU0dOUldqbHhOWGQ2Y1ZKeFp6MEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1668474123,
          "logIndex": 7093322,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/alpine-base",
      "githubWorkflowSha": "41df04b1dff34490db584495f6b916ad1b0e8f6d",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3466502808",
      "sha": "41df04b1dff34490db584495f6b916ad1b0e8f6d"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

