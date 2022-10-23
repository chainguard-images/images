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
| `latest` | `sha256:30264c7230fa761f09460c60d6c2556845b4f90b58370602204877a6bf5bf1b2`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:30264c7230fa761f09460c60d6c2556845b4f90b58370602204877a6bf5bf1b2) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:30264c7230fa761f09460c60d6c2556845b4f90b58370602204877a6bf5bf1b2"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "116958bcc6bec66cbc0f68cce828847a1141d25a",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIDQDMkFYetBsWzn4ptTYlHt1LVCBDibO93vPgM3ppLpmAiAMWivx/BNKyWu6+6i5+Z4Ucm6LQGhfpXTWsyNkU3XcCg==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI0OTMwOWRlZWExNTdlNDdhZTYwYzAxMTk1MDFmZTQ2YTMxMWNlNGE2MTBlZmFjZGQ0ZjU1OTg4YmQ3YTQ5OWNlIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNDSVZRbXBhOE9KejFJRC83bk1KL3EzWi9keG5ZQnpnNUhERDNnelkyU2dBSWdhSlp4NXE0bFBzWTN6K2tzbmFibFZpYmRQY0EreEk1c01OTkhhdkpmRTlRPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBSRU5EUVhweFowRjNTVUpCWjBsVlMyaHJSV1V3UldSUVdHZHNSMVJMZVhRNVNuVTRRazVEUjJ0UmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1hwTlJFVjRUbXBCTWxkb1kwNU5ha2w0VFVSSmVrMUVSWGxPYWtFeVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVU0ZDBsYVVEZE9aM2hYYURSalZuWllZa1JHYTJOMWVIZExjRGRoVUdsdFJrNHpPWGtLUlRkeWNYaFBiaXRhTVhjMlMzTjZkMkZIYjNBMVVUUjNVazR4VDJWM1dYUjJXakU0ZFhwUlJFUnNhbFJKT1RoclYyRlBRMEZzYTNkblowcFdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZyWjNob0NpdFpXVXd2Y0ZaSFRFNW1lVmQwV25kNlZtaFdXbFpWZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Um5OalIyeDFXbE14YVZsWVRteE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyZDRUVlJaTlU1VWFHbFpNazB5V1cxV2FrNXFXbXBaYlUxM1dtcFpORmt5VG14UFJFazBDazlFVVROWlZFVjRUa1JHYTAxcVZtaE5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKR2MyTkhiSFZhVXpGcFdWaE9iRTFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxSV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUkzUWtoclFXUjNRakZCUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ2FFRktjRlJRUVVGQlFWRkVRVVZaZDFKQlNXY0tSbWxoWm1GTlMzUktjalpuYkdkSGNXcHlZVU5TVkZwd1RtWm9iV2x4VUVaaFExRlZaV05YWlVkVFRVTkpRV2hOVTNKcGIwcDBWMXBRV1ZONmJuSXhUUXBhY2tvNWJFOHlNa3h2TjNKRWFtY3habmR1V20xRmVUaE5RVzlIUTBOeFIxTk5ORGxDUVUxRVFUSm5RVTFIVlVOTlVVUlJkblpKZVhCUFdESTJMMEZZQ25Ock1FVXZWVlZVTWtwblVVRkpja2hIWlU5aVVqRlJVRVpPUWpCaE5uUlVOMU00Um1oM00xaERWa2xUU0ZCWE1sbERORU5OUkhaNWJWYzVOVVpyVUhBS2NFWjBabXBsU1hsNVNHbERZVXRNYkd0YVIzcHpZa2hpVFhaR1dscFBlSHBpWlZGcmRrWjJXSFJWZDJkSlpHaFNVWFpCVTNkblBUMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1666487866,
          "logIndex": 5670782,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/alpine-base",
      "githubWorkflowSha": "116958bcc6bec66cbc0f68cce828847a1141d25a",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3305346822",
      "sha": "116958bcc6bec66cbc0f68cce828847a1141d25a"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

