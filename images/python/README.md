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
| `latest` | `sha256:ee1183a3ab013ac8bee831ba30d05e44cde6b00f0e9c7b8eb74c1e866f5154c0`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ee1183a3ab013ac8bee831ba30d05e44cde6b00f0e9c7b8eb74c1e866f5154c0) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:ee1183a3ab013ac8bee831ba30d05e44cde6b00f0e9c7b8eb74c1e866f5154c0"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "8a897e80585809462466c6e7ad505a7c068408fc",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIDfSQ1hOTOfOSLHc8f0bIDa2V5NSZKDh3vyM5AHZtIX2AiBIgEbWz5i1VXzl4hOw/9bPqwcT1IHwLRV07n2UKvu5zQ==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJmM2U0MDA1OTI5NDczYzlkZDg2M2Q4NDYzYTI3NGIzZDRhYjljMGU2MzIyNWE2ZjQxYTQyNjAyYzdiZTFhZjY0In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURXelA5S0JjVDNEM2w5dU84OHhIc0J1OXY5RGxBVjA3bS9LZzZEOXpidlpBSWhBT0Y4Wk1XWGgxbHNjb3FJWkttTGVjTk03cEpzeWduOThPYlQ4V0cvQjRpMCIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhla05EUVhwTFowRjNTVUpCWjBsVlVsRlhibmRKYUd3NFJFcDJTa2RoVmpWSmFVVXdjRkp4Wmt0bmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRCTlJFbDZUV3BGZWxkb1kwNU5ha2w0VFVSRk1FMUVTVEJOYWtWNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVUwZUV4eE1WaFlOWFZTY2xWM05rbGpSakJzY2xkcFF6aFhWMGxxTWtWTVNHWnNOVXNLZFZCblQzcEVRemRNTVhOS2NWSkdUbVp6WW0xa2JHRXlNakpqUzFCalMzRktkMm8yVldwSU9VVm1UM0ZhUVdoV05UWlBRMEZzUlhkblowcE9UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZTUVRobkNrVjZTbVJrZWxBd1pHdExTVUYwVUhGclZtcHdZMWwzZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UWpWa1IyaDJZbWs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRHWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSU1dNeVRtOWFWMUl4WWtkVmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMDlIUlRSUFZHUnNUMFJCTVU5RVZUUk5SR3N3VG1wSk1FNXFXbXBPYlZVeldWZFJNVTFFVm1oT01rMTNDazVxWnpCTlJHaHRXWHBCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFXMUNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNhR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9YZGxXRkp2WWpJMGQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFRFSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NEQkZaWGRDTlVGSVkwRkRSME5UT0VOb1V5OHlhRVl3WkVaeUNrbzBVMk5TVjJOWmNrSlpPWGQ2YWxOaVpXRTRTV2RaTW1JelNVRkJRVWRFTVVaWVFqTkJRVUZDUVUxQlUwUkNSMEZwUlVFemVsSjFWelZZYjBsQ1JYY0tjazB3U2xSbk16TnhRU3RCTDBWb05XSjJNbmRsY1d4cmJqVktUMmh3VVVOSlVVUjVTVGN6UVVWUE5Ya3hjRVpVY2tOUVZ6Tm9OREp4YzJoSFdUazJXQW96YzJwWVpXWkJUVXAzVGpCcWVrRkxRbWRuY1docmFrOVFVVkZFUVhkT2JrRkVRbXRCYWtGalRtZFdWVUpoTlVSV04wTlJVSE4xV2pKSk4wOUplRmgzQ2tWbFZGbHBOV1V3TWtzNWNubFhRMHBCWW1SaGFUQkdUM3BrWjNSWVJ5OVdXREJqWmxKNlowTk5SMDl2VlRFd1VFNVpNV1ZHYjAxeWRHMUNNblUyUkVFS04xTkNNMHc1YmxrMVNEaHRWRXR4ZFc1bWFuTXpOWGhTVlZvdlJrWjVOamxDTTFOWlV6bERZV3hCUFQwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1665714753,
          "logIndex": 5066096,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/python/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/python",
      "githubWorkflowSha": "8a897e80585809462466c6e7ad505a7c068408fc",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3247041027",
      "sha": "8a897e80585809462466c6e7ad505a7c068408fc"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

