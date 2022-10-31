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
| `latest` | `sha256:cc4278a8b129c665fda301e4e34142033bff687fa10caa9d3ac165be15026d0c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:cc4278a8b129c665fda301e4e34142033bff687fa10caa9d3ac165be15026d0c) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:cc4278a8b129c665fda301e4e34142033bff687fa10caa9d3ac165be15026d0c"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "1d82a26def4744a1bffe66fd9c0beea68897aa42",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIEwvCriJM/Yz00q3Hk+XIDNhba76cA7TRRAT8eMSjQaFAiAVyZTLNAmvSaweuuUogDlwcTeYFUp/LrOzPBx0q0DNAQ==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJlZWRmMDIxZjE2NzE0YTc4YjEyOTQzZTAwNjc4MmUxOGViMTA5MzMxMmU4YmZhMTc4MmYyYWI0NjU0MjU1OWI2In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUQrLzB6a3phcllNc21HY3U2eW5XaXhLek9Sa3o5akptT29ZQWRnbWhxODBBSWhBSkhoOTZlc21iVnpVbmtXNk02MlBpQThiOUhPRHdwbkU1NzdzeldWL0FnTSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhla05EUVhwTFowRjNTVUpCWjBsVlJ5dFJlbE5DTjNSTVRVaEVZWE12WkdabU5qQk5NbWcyTkhsVmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFVFhoTlJFbDRUWHBOZWxkb1kwNU5ha2w0VFVSTmVFMUVTWGxOZWsxNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVY0VGlzM2JVNHhaemhuV1VWRUwzY3ZTVVpUTmxwMWJYVk5PVEpEVVVablJrRjRVM2dLZVVRMGFXZFFhRWRVVEZwSFFqWkZVVXROVjFNd1RrdExOazl1TURRMlFTdE5iMmt3UW5jNVFscEtWR3A2YTI0eVNUWlBRMEZzUlhkblowcE9UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZSTUZOcENrUk9UbEJaTWtzMlZEWXZVamxhVVRseFIwdHlSR2hSZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UWpWa1IyaDJZbWs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRHWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSU1dNeVRtOWFWMUl4WWtkVmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMDFYVVRSTmJVVjVUbTFTYkZwcVVUTk9SRkpvVFZkS2JWcHRWVEpPYlZwclQxZE5kMWx0Vm14WlZGazBDazlFYXpOWlYwVXdUV3BCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFXMUNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNhR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9YZGxXRkp2WWpJMGQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFRFSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NEQkZaWGRDTlVGSVkwRkRSME5UT0VOb1V5OHlhRVl3WkVaeUNrbzBVMk5TVjJOWmNrSlpPWGQ2YWxOaVpXRTRTV2RaTW1JelNVRkJRVWRGU3psRVNIaEJRVUZDUVUxQlUwUkNSMEZwUlVFNGVHeHZSVWw0YldkaU1Xb0tWVVFyUWtadWJFMDFkMFEyWkhKcFUwZ3hPVEZCWWxNMlR6VnJORnBUUVVOSlVVUkVNbFJ5V1dKR1JXNVBNVTB5YWxwUWFtZHRNMjFKUVZKS1dUVlZSZ3BWV25ZeGFEWjNRV2xFTm5sRFZFRkxRbWRuY1docmFrOVFVVkZFUVhkT2JrRkVRbXRCYWtKSk5IVk1aVkpGWTNobFdFNVNibFpJWlRoWFFrUjNRM1l2Q2t4R2VpODVSVWRvVVZONVpUaHRURkJHV1ZSMVZXSjFOMFUzZEVsNkwzQkZSRlI2Ulhwd1JVTk5SblZPS3psRlNVZ3liazV0UzFodVRHSjVTa1JuVVhvS1NGQjZOa2hxTWxsRFdWcERSSEpGUjJwQk4wbE1jRkpZUkdaVlVGY3hUV1pDTVZoQlpHSmtjVFozUFQwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1667182433,
          "logIndex": 6193361,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/python/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/python",
      "githubWorkflowSha": "1d82a26def4744a1bffe66fd9c0beea68897aa42",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3358057040",
      "sha": "1d82a26def4744a1bffe66fd9c0beea68897aa42"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

