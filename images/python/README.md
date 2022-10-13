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
| `latest` | `sha256:4e9b1f495587a3a1b636060eee9f332aeeba48fd9e63f60a53055420d9c271e2`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:4e9b1f495587a3a1b636060eee9f332aeeba48fd9e63f60a53055420d9c271e2) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:4e9b1f495587a3a1b636060eee9f332aeeba48fd9e63f60a53055420d9c271e2"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "03f397c88c4c8cbbf199cbc4b37d7339a568b341",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQD0Kl5g1y/ECN/JOytCJrDvqXD6M9nnzeZ40TSjCHvEdQIgLiYyQKkNjCTcSTfAL9ffOF6PoKigMR69RqzobA1aSQw=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJiZjkzYThmY2QzOWVmODM5YjQzOTQwYzY5YTA2OWZiMmNkNmJhNTc2ZjA1MTE3ZjJiOTI5YzU4ZTk5OTA4MzgwIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUN4bmNVU0c2T0MyQ3IvRVBjM205TWJya1lFakFHb1M3UEJ4UmdoUlZHMW13SWdmTUVOWW9KQzdiNXBDUUljYkVESXB2UXZLMTdxenAvVGxzMUt3VjN6YTVFPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndha05EUVhreVowRjNTVUpCWjBsVldqTlFUVEptVGxCNE9VRnVLME0wZDBaUVZ6QlFiV2xKVmpWamQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhwTmFrRjVUMFJOZUZkb1kwNU5ha2w0VFVSRmVrMXFRWHBQUkUxNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZqT1RkNFYwRTBWbWhwWXpoUFlraEJWRUpoUzBsb1dFcEZXbTgzWWpJMU1EVk5iMElLY0dJeVZuTlpVSGRJSzFsWFEzRkJTWE40VTJWQ09YRlRTRlZRTmpsMFpYTnpZMnRIV1hoSVlqWlFZbFpzVVRGblVHRlBRMEZyZDNkblowcEpUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlY2WjBzekNubGFhbkpuVG5kS1prWnRURE5zVWtSUGJsWnhlR3hqZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UWpWa1IyaDJZbWs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRGWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSUldOSVZucGhSRUV5UW1kdmNncENaMFZGUVZsUEwwMUJSVVJDUTJkM1RUSlplazlVWkdwUFJHaHFUa2ROTkZreVNtbGFha1UxVDFkT2FWbDZVbWxOZW1SclRucE5lazlYUlRGT2FtaHBDazE2VVhoTlFuZEhRMmx6UjBGUlVVSm5OemgzUVZGUlJVUnJUbmxhVjBZd1dsTkNVMXBYZUd4WldFNXNUVU5aUjBOcGMwZEJVVkZDWnpjNGQwRlJWVVVLUjBkT2IxbFhiSFZhTTFab1kyMVJkR0ZYTVdoYU1sWjZURE5DTldSSGFIWmlha0ZrUW1kdmNrSm5SVVZCV1U4dlRVRkZSMEpCT1hsYVYxcDZUREpvYkFwWlYxSjZUREl4YUdGWE5IZG5XVzlIUTJselIwRlJVVUl4Ym10RFFrRkpSV1pCVWpaQlNHZEJaR2RCU1ZsS1RIZExSa3d2WVVWWVVqQlhjMjVvU25oR0NscDRhWE5HYWpORVQwNUtkRFZ5ZDJsQ2FscDJZMmRCUVVGWlVGUkRUV296UVVGQlJVRjNRa2hOUlZWRFNVUkVkMmMzVEd0WE4zUlNWRTEyZWs1cEswMEtNa0ZKZDJSR1pUWnNObEZtY0RGb2NsSlBXbFp0WWtWcVFXbEZRWGRwVmpWRE1GaG9ORkE1Vm1WbVRsTm9VbWxFZFV0NE1HWk9ZVGhrZGtWM1ZESnhMd3BTVkVGelNGbG5kME5uV1VsTGIxcEplbW93UlVGM1RVUmFkMEYzV2tGSmQxSjJkMnRHY2tSSlFsSkJaa1ZOV1dacVlXNHhkMFEzTW00MlYzbHhMMWhRQ2toMWFsZzJMMjAxUm1sU01qbFJNV0YyTlRSeVVGTTRibE4wY25ReFRteGpRV3BCZUZkc2RGRklZWEZNVmxCU1VVVnNRMHRDV1ZGV2FrWTRNVGRNTDBvS1J6TXdkR0kzVXk5MWJsWkNla3RqYVZKbVQzVnFTM2NyUTFwNWNVMXhUbUY1ZERnOUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1665692932,
          "logIndex": 5049705,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/python/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/python",
      "githubWorkflowSha": "03f397c88c4c8cbbf199cbc4b37d7339a568b341",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3245462331",
      "sha": "03f397c88c4c8cbbf199cbc4b37d7339a568b341"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

