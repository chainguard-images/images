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
| `latest` | `sha256:2b0d16abfdfa43eefa8c9fe98370f33856a7ab0f8a0fc2ddc5a26bbe1058480a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:2b0d16abfdfa43eefa8c9fe98370f33856a7ab0f8a0fc2ddc5a26bbe1058480a) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:2b0d16abfdfa43eefa8c9fe98370f33856a7ab0f8a0fc2ddc5a26bbe1058480a"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "ddca9edf858025721f6ce8e7447ba51c08cc660e",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDlBL0X/7qKI5yBgLB9CNrH3mzW8MgM5s85wdzsPm+J3QIgClKlqk/TsJa09J8VdmtocRtxu32nfvfxvz7RGi6hNJo=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5NmRhMDdiZWZlNTdlN2JlZjFhMWY5OGVmZTVmNzMyYzBhOTdiMmE0NDliMWE0YzgyOGY0Y2Y2N2M0MGQ1YWFkIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUM0VnR4dEpOYmpZQTYwYThBZlpBM0Erdm5OelRBdzhkQlo1MVM4Z1F6SllBSWdHaDQ2dzVjZVI0VFk3U1pRa3hVakQ4bGdsUi9ZSmlxdEJrNjVRdkZoUVkwPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBWRU5EUVhwMVowRjNTVUpCWjBsVlREQk9WelZWZFdzNGEzcDRjU3RwWjJoak5IWnZXR0p0WlcxWmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVhoTlJFVjRUMVJCZVZkb1kwNU5ha2w0VFZSQmVFMUVSWGxQVkVGNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVV3ZGxWMGRuUjRjSEpXWld4dlZEaG9WMnhUVnpCaU1Ya3lVbHBHYmpkYVpDOHZNVlFLT0VWUFJ6VnFkV2QyVEZRMWJqSk1ZWEZSZFdONU5VUk9SR2N4ZGpSWlRXeHZjekZwV1RGdVFWaG9iRWx4VlZOdFRIRlBRMEZzYjNkblowcFhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZuUVhNd0NtSmhWWE5RU2pCNU5pOXdVRWc1U1hab1pUWkJNazFSZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Um5OalIyeDFXbE14YVZsWVRteE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyaHJXa2RPYUU5WFZtdGFhbWN4VDBSQmVVNVVZM2xOVjFreVdUSlZORnBVWXpCT1JHUnBDbGxVVlhoWmVrRTBXVEpOTWs1cVFteE5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKR2MyTkhiSFZhVXpGcFdWaE9iRTFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxuV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk0UWtodlFXVkJRakpCVGpBNUNrMUhja2Q0ZUVWNVdYaHJaVWhLYkc1T2QwdHBVMncyTkROcWVYUXZOR1ZMWTI5QmRrdGxOazlCUVVGQ2FFUkVSazh3WjBGQlFWRkVRVVZqZDFKUlNXZ0tRVTAzUTJkalJYRjZlblF6UjJ4TWEwMU5hR1J3YmpsT2NsTmhZV1poWldGTEswVlJVMUZqYkdKYVpreEJhVUoyVlZSWlQzUlVlbEJSUTBabk5XUnRUZ3BGVWt4UFJrZHdSVVp6YW05VU0xUXZUbFZLVVRSSVpXVXpla0ZMUW1kbmNXaHJhazlRVVZGRVFYZE9iMEZFUW14QmFrVkJOMkl4TW5kcVdXSlZRemczQ21oRVpVOWlTVTVIZW5FelYxZGthV1V6YmpWNlRFSmFWSGR1WkhsNlppOUpXbTlVU1dFd2MwOWFla0ZpYzNGM1pIZDBVbXBCYWtFNU1scGhXVVpFVjA0S1RUQnhObU5qUlZGdGJteG1ia1ZoU2xZck0wMDRNbEZpYTJkQk5TdFZSalpyWkc5WWRGbEpPSGx1VlVaUGFWaFVXbXREYWxGc1JUMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1667265564,
          "logIndex": 6261227,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/alpine-base",
      "githubWorkflowSha": "ddca9edf858025721f6ce8e7447ba51c08cc660e",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3366005633",
      "sha": "ddca9edf858025721f6ce8e7447ba51c08cc660e"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

