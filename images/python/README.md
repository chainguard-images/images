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
| `latest` | `sha256:70032db5a3fd865b760f244008d07ddc048d9e0600de47eb0b05f06378b5fb4b`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:70032db5a3fd865b760f244008d07ddc048d9e0600de47eb0b05f06378b5fb4b) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:70032db5a3fd865b760f244008d07ddc048d9e0600de47eb0b05f06378b5fb4b"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "e26d80063b01a16c3c536654b7a14c28dbfe0385",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCRBDAiPCu9ydsS8KTh3/dZ71VMg7TFUHrRUjc568HtGgIhAJeLOrCccMXwjxJAfUO2+OIEWLF5FtzB6jlzM8aetIGx",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI1YTk4NWQzYTlkNTIwMmQ3ODFiNTVkZjViZTQwMTcyYjMxMDk2ZTQ3ZTdmMTFmNTNhNzgyNTI1Y2Y1MTZjMTVkIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURUQUwxVDlpN2R2VUM3WVFTRU9PREVIVjM1WXhBMTdod1NFRkROYXBYMkZRSWhBSzVKNzE4ZUpEK05uYUpHSG1PREdnajVobG8vN04zODRpL3V5YjZSblYvcSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndla05EUVhrMlowRjNTVUpCWjBsVlltNHlPR1JOYVRadWJtdDJjVUY0V21Sa1RFZ3JTVWhzT0ZwcmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRSTlZFRXdUbXBSTTFkb1kwNU5ha2w0VFZSQk5FMVVRVEZPYWxFelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ3Ym5GSk4wbHRWM1k1VEU5TmFXcDVTMFJvYUZSM2VDOXFaSFV3ZVhKYVJFSjJSbkFLS3pSQlNuUm5jMUl3V1ZsMWExTkhURUZKVG5WWlNHczNUWEJXTjJzeFNXWkRWRVY1T1ZocWRUQk5WMEpDWnl0bFduRlBRMEZyTUhkblowcEtUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZxZFVRMUNsQlZXV1ZDUW1kalJ6ZGxVWHB0VjA5RVlYUnBVMmhqZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UWpWa1IyaDJZbWs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRGWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSUldOSVZucGhSRUV5UW1kdmNncENaMFZGUVZsUEwwMUJSVVJDUTJoc1RXcGFhMDlFUVhkT2FrNXBUVVJHYUUxVVdtcE5NazB4VFhwWk1rNVVVbWxPTWtWNFRrZE5lVTlIVW1sYWJWVjNDazE2WnpGTlFuZEhRMmx6UjBGUlVVSm5OemgzUVZGUlJVUnJUbmxhVjBZd1dsTkNVMXBYZUd4WldFNXNUVU5aUjBOcGMwZEJVVkZDWnpjNGQwRlJWVVVLUjBkT2IxbFhiSFZhTTFab1kyMVJkR0ZYTVdoYU1sWjZURE5DTldSSGFIWmlha0ZrUW1kdmNrSm5SVVZCV1U4dlRVRkZSMEpCT1hsYVYxcDZUREpvYkFwWlYxSjZUREl4YUdGWE5IZG5XWE5IUTJselIwRlJVVUl4Ym10RFFrRkpSV1pSVWpkQlNHdEJaSGRFWkZCVVFuRjRjMk5TVFcxTldraG9lVnBhZW1ORENtOXJjR1YxVGpRNGNtWXJTR2x1UzBGTWVXNTFhbWRCUVVGWlVsY3lXV1ZFUVVGQlJVRjNRa2xOUlZsRFNWRkVOamx6Vm1JckwxRnVieTl4VmtKd1JWUUtkRFZCZFhKSkwzWmhZamhHV1VFNU1FdFhlQ3RHV0V4TFVVRkphRUZMTTJSMFVqaEJNRFpwZG01cFkzWTViVzFDYVdaQ1pVVnNjMnN3ZVdOVGIwRkxaZ3BNVlRJeVJ5OXFkVTFCYjBkRFEzRkhVMDAwT1VKQlRVUkJNbU5CVFVkUlEwMUNOMjk1V21VeVlWRXhOMUF3TW5OdU1HbEpURFpoT1hCbFNEQnJSRU5LQ2pob1MwTXpjbmhFTmpNeldXZE5XVlJWV1ZCc1pIQlRTbU5GS3pkeWVHc3lUV2RKZDBKaWFsRnZiRmgwVGtJMlVIQTVWVE5PUjFGb1VXSTBiRFZKUlZNS2NVVTJXVEpuZGpNM1pYbDNNekpYZFdSMWREVlJjSEprV1ZCQmNTOXBjazkxZHlzeUNpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1667904430,
          "logIndex": 6720786,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/python/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/python",
      "githubWorkflowSha": "e26d80063b01a16c3c536654b7a14c28dbfe0385",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3418656426",
      "sha": "e26d80063b01a16c3c536654b7a14c28dbfe0385"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

