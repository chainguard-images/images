# python

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/python/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/python/actions/workflows/release.yaml)

This is a minimal Python image based on Alpine, using Python apks available on the Alpine Community repositories (not built from source as of now).<br/><br/>While this image is being developed, we will stick to the latest stable Python version which at this moment is `3.10.7`. Supported versions in the long term are TBD.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/python:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` | `sha256:abae88e0b236a47634626075a5af1a6ed2aa7ea6b8d4d3926ec79bb4e7a2ca2a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:abae88e0b236a47634626075a5af1a6ed2aa7ea6b8d4d3926ec79bb4e7a2ca2a) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


## Usage

To try out the image, run:

```shell
docker run --rm cgr.dev/chainguard/python python -VV
```

Python version installed 
```
Python 3.10.7 (main, Sep 11 2022, 22:42:41) [GCC 12.1.1 20220630]
```

Pip Version installed 

```shell 
docker run --rm cgr.dev/chainguard/python pip -V
```

```shell
pip 22.2.2 from /usr/lib/python3.10/site-packages/pip (python 3.10)
```


## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/python:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/python:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/python"
      },
      "image": {
        "docker-manifest-digest": "sha256:abae88e0b236a47634626075a5af1a6ed2aa7ea6b8d4d3926ec79bb4e7a2ca2a"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "316e6eac749a40ace40852f94eb0db0c678bd8c3",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCmj3LHbN2pBpeZnNkEmYKIBsYmybvCoxVm/fxsJKpWWQIhAJaf4lPTxhmlaHP6WEZJN489xJOusGmN6Qxv6pr8qJCD",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI4NmQ2YjEzZmRjODM5NjAwNjFlYzA4MDM4ZTdkYzY4MmUzZmU0NGRjYWUyNDI1YTAzOGNiOGQyN2NkNDFjMDc4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRGlacVRLL2l1eGErcmNVRDdpM1B2cU0reXNXSzRad0w4UTlUaGgyNVhVcEFpQnNJa1FDWHdFZ21hODE4bmxtaGNCU1dBbWtGbE9ZQ1l5UE13UzJJK2luZWc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhla05EUVhwSFowRjNTVUpCWjBsVlUxcG9XQzloTUdWMFYzTk5ZekpMVWtsNFZEZFBiRGN3Ykd0SmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1hsTlJFbDNUMFJKTkZkb1kwNU5ha2w0VFVSSmVVMUVTWGhQUkVrMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZtYjNKbGJrUlNOVzFaYkdoa1QyUkJLMU5zYW14MksxRktaMmhuY0ZKSUszazJRMjRLVFc5RFIyNDNXRk53UW1wblpsVlFaa3g1T0ZaMmRteFhiblZFUkdOUFMxWnJXVlJUVlZCWFZVWnRhRVUyZEVreVRXRlBRMEZzUVhkblowcE5UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZCVG5WUENubHVMMEo0UTI1R01YQkVhM2N4TkhwbWRHZEVMM2haZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UWpWa1IyaDJZbWs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRHWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSU1dNeVRtOWFWMUl4WWtkVmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMDE2UlRKYVZGcHNXVmROTTA1RWJHaE9SRUpvV1RKVk1FMUVaekZOYlZrMVRrZFdhVTFIVW1sTlIwMHlDazU2YUdsYVJHaHFUWHBCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFXMUNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNhR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9YZGxXRkp2WWpJMGQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFMwSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NIZEZaV2RDTkVGSVdVRkRSME5UT0VOb1V5OHlhRVl3WkVaeUNrbzBVMk5TVjJOWmNrSlpPWGQ2YWxOaVpXRTRTV2RaTW1JelNVRkJRVWRFTDFoTWEycFJRVUZDUVUxQlVucENSa0ZwUW5OeVNVNHZNM0JMU0hkNEsxb0tUWEZvV1VaSFFXWkVUbmxVVkZKME1VNVpNRGxrVjNWTVJ6QXpTUzkzU1doQlR6bGpXSGRyZHpCSlpFMVRiMUZRTkdSNlNqVTJaVFpWZGtKdk4weHRSQXAxY1VGcFFVMWxlbEZhVUZOTlFXOUhRME54UjFOTk5EbENRVTFFUVRKblFVMUhWVU5OVVVOT05XeHFLMU1yTkhwdWRFVkphRnBqZGpZeGNUZG1SRk5qQ21WdVkwMTJTVmg1YnpSRE9GQlhWbGxFUlU5T1FWUnVhMWhLV1U1MGFHMWhUVmMyVWtWalRVTk5SRWRIUW5kcWRsSjBTMDFRUm1wTVFVcFJVakZYVGtzS05FUlBXblJ1V0d3M2QxRlRiRXBZYUdsWFVXOTFkMnBUVW1GQ1EyOHdaMHd2YlRoTWEwbGFUVGRSUFQwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1666404527,
          "logIndex": 5611687,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/python/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/python",
      "githubWorkflowSha": "316e6eac749a40ace40852f94eb0db0c678bd8c3",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3301560643",
      "sha": "316e6eac749a40ace40852f94eb0db0c678bd8c3"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

