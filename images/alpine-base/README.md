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
| `latest` | `sha256:ac8187ec597daaa466504c0548cf4f81cf920ba795ce948e11b19523080c1433`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ac8187ec597daaa466504c0548cf4f81cf920ba795ce948e11b19523080c1433) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:ac8187ec597daaa466504c0548cf4f81cf920ba795ce948e11b19523080c1433"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "21461cf9185f8edcae2f510dbe178773d33f37d5",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/alpine-base",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIBjxOGbrJHrP81N0V0nxUIE8CW3MjDeEVKSnDm2LwAkdAiBdyRQZHE9pzsE7HHBs4ztbxVy9qIuMp/DM3vZZsIyEcA==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIxMjYzMWU5MGY5MGRhNWUzOGQxNjk4ZWFhNjA3ZDlkODIwNDg5ZmUyNTBiYWQyZDVjNjdhNDU2MGQ4NTBiODBlIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURQMmM2MFIvbXk1Y0VCbVdjUkI2YWdtekFGOFlZTHFQS2cveGUwM0NYb3d3SWhBUGFtT0FpcHZtMFc3Zzl2c1ljSGd3T28rbHdESVJGWXNDRzBBejZqWXBMeiIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBWRU5EUVhweFowRjNTVUpCWjBsVlZUZDRhVEV4ZVRWb1RVMW5XR2RrWTJ0WmQyMXhTbTlSVXpobmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1ROTlJFVjNUMFJCZUZkb1kwNU5ha2w0VFVSSk0wMUVSWGhQUkVGNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZJTURBcmF6a3pUeXRHVEdwTk16UmtXRk5XWlZCNFlqUklaMHRKTDI5cFFqZERjWFFLUkc1UlZEUlhlV2x2V0RodlMzVkpjakkxTVhoeVUwUmtiWEo0VXpCMlkwTldNSEpyVjJwTWVXSnhTVko2U0dsT2JXRlBRMEZzYTNkblowcFdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZwTUc0d0NsSldWVWxZZWxwbFNGUXZVVEpQTURodlUwbDVUWFpqZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKUldVUldVakJTUVZGSUwwSkhUWGRaV1ZwbVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5Um5OalIyeDFXbE14YVZsWVRteE1lVFZ1WVZoU2IyUlhTWFprTWpsNVlUSmFjMkl6WkhwTU0wcHNZa2RXYUdNeVZYVmxWMFowQ21KRlFubGFWMXA2VERKb2JGbFhVbnBNTWpGb1lWYzBkMDlSV1V0TGQxbENRa0ZIUkhaNlFVSkJVVkZ5WVVoU01HTklUVFpNZVRrd1lqSjBiR0pwTldnS1dUTlNjR0l5TlhwTWJXUndaRWRvTVZsdVZucGFXRXBxWWpJMU1GcFhOVEJNYlU1MllsUkJWMEpuYjNKQ1owVkZRVmxQTDAxQlJVTkNRV2g2V1RKb2JBcGFTRlp6V2xSQk1rSm5iM0pDWjBWRlFWbFBMMDFCUlVSQ1EyZDVUVlJSTWsxWFRtMVBWRVUwVGxkWk5GcFhVbXBaVjFWNVdtcFZlRTFIVW1sYVZFVXpDazlFWXpOTk1sRjZUVEpaZWs0eVVURk5RbmRIUTJselIwRlJVVUpuTnpoM1FWRlJSVVJyVG5sYVYwWXdXbE5DVTFwWGVHeFpXRTVzVFVOelIwTnBjMGNLUVZGUlFtYzNPSGRCVVZWRlNGZE9iMWxYYkhWYU0xWm9ZMjFSZEdGWE1XaGFNbFo2VERKR2MyTkhiSFZhVXpGcFdWaE9iRTFDTUVkRGFYTkhRVkZSUWdwbk56aDNRVkZaUlVRelNteGFiazEyWVVkV2FGcElUWFppVjBad1ltcERRbWxSV1V0TGQxbENRa0ZJVjJWUlNVVkJaMUkzUWtoclFXUjNRakZCUVdobkNtdDJRVzlWZGpsdlVtUklVbUY1WlVWdVJWWnVSMHQzVjFCalRUUXdiVE50ZGtOSlIwNXRPWGxCUVVGQ2FFSmlOMVp3UlVGQlFWRkVRVVZaZDFKQlNXY0tZMWRaUkd4cE1GRlRaRUpTWmpkNmJWbDFPVGRvVEU1NVVYUkNNMEZTZW1oUk0yUlhhbGxoVDFoRVRVTkpRbWhaVFVSSlZuSkxRelI2YW1Fd1NtNXNaZ3BZT0RSNmJsTmxTak5LVFdkaFIycE1PVFJRVW05cE9VNU5RVzlIUTBOeFIxTk5ORGxDUVUxRVFUSnJRVTFIV1VOTlVVTktkRFp4ZWpsMlVYaHZhMkZyQ2xOWUszaDVjME5aVEZNdmMwOTBUSGxhVW5GeVNYSTRkV0l2U1hWbFJ6STFWRkJIU0VKT1VUWm9aMEUwTjBaNmFsTXdkME5OVVVSaWIyTldkMlpQWldNS1JsSldjMjlRT1V4QlpHTTBTM05tZERJMldEWklUbE5oV0VoVGMxTllRMnBMUzBsbWNXWnVaM2R2UVhKVWF6Rm5WVGh1Y0hSQ1p6MEtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1666832900,
          "logIndex": 5945799,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/alpine-base/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/alpine-base",
      "githubWorkflowSha": "21461cf9185f8edcae2f510dbe178773d33f37d5",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3333724858",
      "sha": "21461cf9185f8edcae2f510dbe178773d33f37d5"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

