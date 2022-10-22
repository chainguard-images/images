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
| `latest` | `sha256:12de24f2229004e1a71c1e209664ed06bdaa70f94ad37341ff0cd182d3710004`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:12de24f2229004e1a71c1e209664ed06bdaa70f94ad37341ff0cd182d3710004) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:12de24f2229004e1a71c1e209664ed06bdaa70f94ad37341ff0cd182d3710004"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "9263fe5689531aa6558823ab9a242fa50e7f5db0",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIEu7ab5yhct5LMPMrq4HBwcvzVe8IfYVdvKbEgBpLTAjAiBOXJsNf9imyLe0QAhph7zpkyz9w8VJSxAiKMdO+K/6Ow==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI2MzQwMTg5MWJlMTFjNjQ2YWE3NDJmMzVlNWYzMTUyNjM5OWMwN2FmMzBkMmNmMDdkY2I0MWFmZDhjZWQxMTA2In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJSDY4cnVhaVVyVW1jMko5cTNyUEZIUS9iQ2prenBDTDhObldIMXl5VDltZUFpRUEzeXEvR1JCcnJITFFVeGMwNXRZekpxYUN5TzZaUmdYTmJjYitxL1JlWlZFPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBla05EUVhwNVowRjNTVUpCWjBsVlMySlRkSFZsVUhCeFQxSnVaa0ZIZFVabVdUbFRSMHBLUWtkcmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1hsTlJFVjRUMFJSTUZkb1kwNU5ha2w0VFVSSmVVMUVSWGxQUkZFd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVY1YUV3NWNtbE9ibmhRYldkSFJYUlpRa3BtZUVSbWVIQkRXWGN4TVRoVlUwTk5PV0lLU2tOTWJVTkxNMk14WlRsT01qQlNiRzV5UVRSdFFrUXpjVWhVS3pWUE0xZENiakpZU1dFM2R6SkljRWxwSzI5dmMyRlBRMEZzYzNkblowcFlUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZDYjBJdkNrSmhPR3BYZDFkaGNVeHpOM3BzS3pGeGN6TkJNV0U0ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Um5OalIyeDFXbE14YVZsWVRteE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyYzFUV3BaZWxwdFZURk9hbWMxVGxSTmVGbFhSVEpPVkZVMFQwUkplbGxYU1RWWlZFa3dDazF0V21oT1ZFSnNUakpaTVZwSFNYZE5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKR2MyTkhiSFZhVXpGcFdWaE9iRTFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWwzV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk1UWtoelFXVlJRak5CUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ1p5OHhSbGRqYzBGQlFWRkVRVVZuZDFKblNXZ0tRVkJRYlRGT01FSjZhWGxrTTFoNmVESldRVEI0ZUhwVVVsUnFWMGxLUW1jMFFuWnBkak5NZEVkS2VFaEJhVVZCZG05NmVFUTRLM1o0ZFRaRmFWcEZkQW94U25ORk1ETjZja2xUTnpVMlQzbHJNMmRXT0c1aU1GSktNMEYzUTJkWlNVdHZXa2w2YWpCRlFYZE5SR0ZSUVhkYVowbDRRVWx2UW05Nk4wVk1kMmQxQ2tSTVZrMVNXREZUYkROdVNsRjNWWFUwYzJsQldHTnFSMHc1YURaSGQyWTRUR041WlRWdFlYZDZWWGRLUjNCSVltWkdjVEl5ZDBsNFFVbFVWamxWZEVnS2F5OHJha0ZwUjAwNFJuTlVVbkZYWjJ0cFRITldXVFprUTI1aVNFbGlaM0ptZG5Kc05XeHRPVWxSTkhsUlNHbzNVRFpzTlZObGJVNTVRVDA5Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1666401551,
          "logIndex": 5609198,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/alpine-base",
      "githubWorkflowSha": "9263fe5689531aa6558823ab9a242fa50e7f5db0",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3301416314",
      "sha": "9263fe5689531aa6558823ab9a242fa50e7f5db0"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

