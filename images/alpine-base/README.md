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
| `latest` | `sha256:59b160dc161a88f54989dce49d6c9d9b042c478fd385a28e8217d2923b1bdd6a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:59b160dc161a88f54989dce49d6c9d9b042c478fd385a28e8217d2923b1bdd6a) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:59b160dc161a88f54989dce49d6c9d9b042c478fd385a28e8217d2923b1bdd6a"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "a2b1a58f7dad7582bafd4a1f02a0d292d201ad23",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIDqNauYHFBlgvWaccQS9H2IKTTI1atTmpLEqbbiScstbAiEA2SCe3BjGlyRciicyzGpbeAF1ThuH6/GUBkTHdn50IOY=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJmZDIyNDNlYzU5ZTI1MTVmYmMyZGNmZmY1Njg5YTA1MzUyOTA2YWJiMjk3NDgzOTlmNTU2MTcyOTJlOWEzOWJjIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQWU5OExrRTZmTTlXQTM4RUNKZnBVOFdxV01BSXhZSk5Ca1JaWHZaR094VUFpRUEyc0VRbFRmR3N0b04xbU1xWlA2ZFdORUp5bnRxUnYyRjk1VDFCR2Q5S3ZvPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBWRU5EUVhwNVowRjNTVUpCWjBsVlNXZFNXSEJRWm5OVVQwVklaVFJtZUhBMldtdDRhR3BuT1dWM2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlRCTlJFVjNUVVJWZUZkb1kwNU5ha2w0VFZSRk1FMUVSWGhOUkZWNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZETjI1aVRWcFNRbWN3TUhaa1ZqSk5aWEZuTDNJdksxcFBOMFpaYkRoRFZYaG9kSEVLTkZWaFR6QTFkRGRRUldkMWNWRkdWelZ1VkVkVmJtMVNaSFppUVZOU1VXRnBaM3BWZEc0ME1ISXJjaXR0SzFWTmIzRlBRMEZzYzNkblowcFlUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZSUlZoWkNqRjJWR05DUVRVdlJtTlRNMVJ0VVc0MmNrOXBkazVuZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Um5OalIyeDFXbE14YVZsWVRteE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyaG9UVzFKZUZsVVZUUmFhbVJyV1ZkUk0wNVVaM2xaYlVadFdrUlNhRTFYV1hkTmJVVjNDbHBFU1RWTmJWRjVUVVJHYUZwRVNYcE5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKR2MyTkhiSFZhVXpGcFdWaE9iRTFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWwzV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk1UWtoelFXVlJRak5CVGpBNUNrMUhja2Q0ZUVWNVdYaHJaVWhLYkc1T2QwdHBVMncyTkROcWVYUXZOR1ZMWTI5QmRrdGxOazlCUVVGQ2FFaFBibEZFTkVGQlFWRkVRVVZuZDFKblNXZ0tRVTF2YURsNlRWY3pjMGxTZWpoSmRXSTJZVXRVYVdNeVdFVXlhMUUwY0ZwdFZXMVdVRUV3V0dsRU1HRkJhVVZCSzJkeVJtaE5lRzlCZUZCM1ZrbFlRUW92YmpOcVdsZFFlVVV5Ukc5YWJuSTNkRU5MTnl0VU1HMVBNMDEzUTJkWlNVdHZXa2w2YWpCRlFYZE5SRnAzUVhkYVFVbDNabkpvU2pkMGJYZFZkRUpyQ21VM2JGQk9TVTUxY0ZRd0swdFJWRUZIUVZNeFFrSlRkbmRZVDNOT1VreFpWamR6UWxGQk9URjBlRzg1U0ZSREswWTFibVpCYWtGbFQzUnRNSGtyZFhZS05rdFFTRE5RYlRGbWJGSkpTV0Z6UVU5Nk9YVktRa2gyVkVadVFtZ3JSRWwzVjNac1YyaG1OVUZZUzFaalRqWmxNRmhYVFUxdGR6MEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1668387671,
          "logIndex": 7022047,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/alpine-base",
      "githubWorkflowSha": "a2b1a58f7dad7582bafd4a1f02a0d292d201ad23",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3457718098",
      "sha": "a2b1a58f7dad7582bafd4a1f02a0d292d201ad23"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

