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
| `latest` | `sha256:1d619b525d8ab7e0bb4e13d2f1c5b0fa0241759d8dd7f4102be9e1b2fc57eff5`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:1d619b525d8ab7e0bb4e13d2f1c5b0fa0241759d8dd7f4102be9e1b2fc57eff5) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:1d619b525d8ab7e0bb4e13d2f1c5b0fa0241759d8dd7f4102be9e1b2fc57eff5"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "73d4ad77b1140050f279ee29145c3a13938925b7",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCSuVK7rN7BBL+1VWDKsN8DO3qVPJfFMDVrhbtRBMs9LQIgcQBWYYmv0jrBD1qiYuP6JyqQLGBCxbApuOdB6AkRwbw=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI0MDliNDU3ZGJmYTFkNTg2ZGNlYjE4NjgwNmQxMGY2YmQ4NjYwYjQxMjg0NTQ5OTc4MjVjNThhYmI2OGQ5NTg1In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQW16QXlsekJtRkU4LzQyM0dRbmgwVjlIdUN5VGd4VDYyRW5QbWlDRmIwMkFpRUE3bzJIN3hkOHUzaGM1c3hnQVZNTzRNOGNLeEJxQ0EzN0l1SmdOOUFhSzN3PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlSRU5EUVhwSFowRjNTVUpCWjBsVlppdHRZbWhHYWpseVZXMDVLM0ExVEdjMmJVVmhOWEZ5TjJvNGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVROTlJFVXhUVlJWTWxkb1kwNU5ha2w0VFZSQk0wMUVTWGROVkZVeVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVV6YkRCbFJFSXdORWRUZVRrcldYaFBlRmc0YjBaR2RrMUlMMUpoV1dFclZERm1lRWtLUkZNMU4yUkdVV2RpU0dOU1YwWm9ZMVYzUmtGcGVsbGFlVzVJY0RsM2IxQnlZekEyUTFGUmJtTnRibTl6ZVVKWFVFdFBRMEZzUVhkblowcE5UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZWZFRKRUNtdzJTa2hvV0VsT1ZFZEdjbTQyY0VGTFF6SmpjbFp6ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UWpWa1IyaDJZbWs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRHWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSU1dNeVRtOWFWMUl4WWtkVmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMDU2VG10T1IwWnJUbnBrYVUxVVJUQk5SRUV4VFVkWmVVNTZiR3hhVkVrMVRWUlJNVmw2VG1oTlZFMDFDazE2WnpWTmFsWnBUbnBCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFXMUNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNhR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9YZGxXRkp2WWpJMGQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFMwSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NIZEZaV2RDTkVGSVdVRXpWREIzWVhOaVNFVlVTbXBIVWpSakNtMVhZek5CY1VwTFdISnFaVkJMTXk5b05IQjVaME00Y0Rkdk5FRkJRVWRGVkRodFEwMW5RVUZDUVUxQlVucENSa0ZwUVVOVmVHRm1jR0pEYTNsRlVEQUtPWE5yWmpOYVEzaFZhekZ0TkRCMlNFSm5TRkpXYVVsV1ZVWkRjRGhuU1doQlNYaDVWM1phYUU0M01VWjFXSFZ6VWt4MFlYWXpLMmxoUldab1NXNUpkd3BEWlU5UlMyZFZUMDVHWVVaTlFXOUhRME54UjFOTk5EbENRVTFFUVRKclFVMUhXVU5OVVVOb1drNUJVRGwzUVZSVmVuZFJia00zYWxwWVFtOVVlSG81Q25wdGFuTkthV1kwVFc1Q1FVZDRabkJGVFZRNGIzZFZVSFpSY1hab1lpOUphbEZvU0hoMlJVTk5VVVJwTkVGeVpXazROeXRKVjJaR1dURldWazlzVjFVS2JFcHpWRUZQY0U1VGRVUkhhbWxSVGtRME1tOVNUV05KYjBVNU9URkpibU4zZEZsaFYwWndXVlZ0T0QwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1667785936,
          "logIndex": 6652111,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/python/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/python",
      "githubWorkflowSha": "73d4ad77b1140050f279ee29145c3a13938925b7",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3406967340",
      "sha": "73d4ad77b1140050f279ee29145c3a13938925b7"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

