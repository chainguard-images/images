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
| `latest` | `sha256:bd2d309f52c5732574f1ed0fc6fdef2c7bb453884b98a16071a2b8c00781ca1e`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:bd2d309f52c5732574f1ed0fc6fdef2c7bb453884b98a16071a2b8c00781ca1e) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:bd2d309f52c5732574f1ed0fc6fdef2c7bb453884b98a16071a2b8c00781ca1e"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "a813338e87458c76bcda782fdc554404b9103353",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDSZmV4Mm72bYoOxrjZWlfr+T3gcADyQy/fMGb0yUAkmwIhAMsJcu6GQ6fGqSU2tlyoFPXmo/F+ka/cv3VmNAlxUp1h",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI2NGE1ZTM0MzNkYjFkODA4MTQ5ZDcxMTg3ODQzNTEyMThhMTQ3MTZhODRhMmYxNDAxZGIxM2M3MDU3YTAyNzY2In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNMOGpkTW1UdWFIK0IxbXd2bkZqdHR2MUlNYTN3bExhQktubVVCMyt6WE1nSWdLY2o0RFEvUEdWbXJTZG9QelB6V2xNVTdDMGh1a0ZFb0pEZkc2UHA5NlhZPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBha05EUVhwMVowRjNTVUpCWjBsVlJsUldNMDV3TlRORWEzUTRNVEZuU1U1SU9EaFBhM1l3TDNkUmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRWTlJFVjNUa1JGZVZkb1kwNU5ha2w0VFZSQk5VMUVSWGhPUkVWNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZTWVd0SWJtNHZkV05yVmpac01VRnpORmN2WkhGUE9DczNUelJqTWxKdFltZ3ZLMFFLWTJkdFdXdHphR2gzU2s5TlNVNXdaMU5rUWxacEswUkZTWEJzTHpWek9HdzFWalJ5VFVrclVtMDNXREZEYkVOeE5uRlBRMEZzYjNkblowcFhUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZ0U1haUUNuWXpVVWxZVUVOV1dGVkJaRVJCT0RKbk1XMTJRM00wZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Um5OalIyeDFXbE14YVZsWVRteE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyaG9UMFJGZWsxNlRUUmFWR2N6VGtSVk5GbDZZekpaYlU1cldWUmpORTF0V210WmVsVXhDazVFVVhkT1IwazFUVlJCZWsxNlZYcE5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKR2MyTkhiSFZhVXpGcFdWaE9iRTFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxuV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUk0UWtodlFXVkJRakpCVGpBNUNrMUhja2Q0ZUVWNVdYaHJaVWhLYkc1T2QwdHBVMncyTkROcWVYUXZOR1ZMWTI5QmRrdGxOazlCUVVGQ2FFWnVjV2hQV1VGQlFWRkVRVVZqZDFKUlNXY0tZWEEzTlhwT09USjZhRE12WkV4SVFqaGtjalZ2Vmk5R2VsQjJhVFJrZFhocWQwSlFNbWhSZDNCdldVTkpVVVJKY0dKdVNDOHdhVkpEZUdKRVowRldiQXBqUzBwbVYySm9NVVJTZURBdlFtWkVlV3h3WXpKRU1YaFpWRUZMUW1kbmNXaHJhazlRVVZGRVFYZE9jRUZFUW0xQmFrVkJjVEZTWkdsVWNpc3JZMFkzQ2poMWFGaHZVMWx3Y0c5cGRXUjBaR054VmxZMlpFVjZibmhPU1Roc1dtUXZOVWhFUmk5aWJHbEJhbFpzVjBrMGNEVmxNVzlCYWtWQmRVVk5ORVYyT0VFS1dUQTJaVFpFZEhrMVQyVTFhak40Y2s1SWN6aHpSRFZJVFVwak4zTmxNbEJuWldWbE1qSnVPVk5QVGpoaE1rdFFUMDVLZWpBNE1ESUtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1667955878,
          "logIndex": 6756657,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/alpine-base",
      "githubWorkflowSha": "a813338e87458c76bcda782fdc554404b9103353",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3424498120",
      "sha": "a813338e87458c76bcda782fdc554404b9103353"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

