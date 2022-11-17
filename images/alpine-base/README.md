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
| `latest` | `sha256:a684303334bfb5dd2a183459509906769a1319507c0c0175d0001b8f94d5323f`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a684303334bfb5dd2a183459509906769a1319507c0c0175d0001b8f94d5323f) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:a684303334bfb5dd2a183459509906769a1319507c0c0175d0001b8f94d5323f"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "bf8c4d68255cd56eb53bb76c871b8a59799c6d8d",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQD+sDBFfWjnjB44HsoN9hO+jVocRcWXJH6uAmBWNAvO1QIgY48SChm+kVhMs+nWR5+vR9reXmF7UtJtZj5m24ineVw=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIxODg4MjQwNzkxMzQzMzIyOTBmMzI5ZGMyZTM1ZWRhM2E5YmNhZTBhZDQzZTZmNWYzMzQ2ZDlmNDVlYmMxNjQwIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQ3dzM0dGTjQrS2craFU5cW05dk0weE1IQ3lGY2g2ZDJyTG5oc0tSc0FuaEFpRUE0aEp4NnczV2VYMnZmMTNoTGpUektzOGZ3czFEOG1yMHhndzlkMndNN0xJPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBWRU5EUVhwMVowRjNTVUpCWjBsVlVHTTRRVGR2VGxNdllVSkxUVzVFY0RkWVQxQlBaR0pSTUU5M2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlROTlJFVjNUVVJSTVZkb1kwNU5ha2w0VFZSRk0wMUVSWGhOUkZFeFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZMWjJOQ01tMDBUMjV0VDA5aVQzUXdTa2x0YkdWbGVuWkxjV2wxTlRSVE5uSldTV3dLT0dRNVVWaHBkMDk0TjBOUFdEWlRjMVE1Ukd0RlMxSkhOalZ4ZDJWS2NETkhPV0pKYzNjclVESmxMM0JRYzJkdloyRlBRMEZzYjNkblowcFhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZTWVVkR0NqZEJiMjh5T0U1cFlqSlVNMlY0U0M5SE56Rm9iVFZqZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Um5OalIyeDFXbE14YVZsWVRteE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyaHBXbXBvYWs1SFVUSlBSRWt4VGxkT2EwNVVXbXhaYWxWNldXMUpNMDV0VFRST2VrWnBDazlIUlRGUFZHTTFUMWROTWxwRWFHdE5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKR2MyTkhiSFZhVXpGcFdWaE9iRTFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxuV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk0UWtodlFXVkJRakpCVGpBNUNrMUhja2Q0ZUVWNVdYaHJaVWhLYkc1T2QwdHBVMncyTkROcWVYUXZOR1ZMWTI5QmRrdGxOazlCUVVGQ2FFbE5ZVkJPUVVGQlFWRkVRVVZqZDFKUlNXZ0tRVTlVTld0WldISklVRWh5TTJaaFZGUTVUM05GT0VaUE1HSlpTVVpFTUZocFExSklZVVJTYTJ4bmRISkJhVUZxZDBsa2RtZFZOVFFyVldaMVlWQlpTZ28xWlZNek5tcGhUMlJuZW5ORVowRnROM2N2TVd3dlRWQnpha0ZMUW1kbmNXaHJhazlRVVZGRVFYZE9iMEZFUW14QmFrVkJObUZTTTNGSlozSk9OMlU0Q2tadVZXRXlXRFkxWkRaTlZHbHFkelJZZGtwQmFVNVJPR1U0ZEVGSFdtUkRhMU4yZDJoRFJUSkZNemd5Y1NzMlRHbzNSRUZCYWtGcE9XZHJhMnQwWWtjS1lWRjJaMUZQY0ZkUVptMW5MMEZuYTJSR1FtMUxkMlkzUjNGS05WZFVjV1JIYVRCUlJIaEpjVFJMY0RaS1ZWVTNRbUpUTWxCdE5EMEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1668646873,
          "logIndex": 7240489,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/alpine-base",
      "githubWorkflowSha": "bf8c4d68255cd56eb53bb76c871b8a59799c6d8d",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3484430387",
      "sha": "bf8c4d68255cd56eb53bb76c871b8a59799c6d8d"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

