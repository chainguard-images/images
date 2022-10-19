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
| `latest` | `sha256:8610ae8d2886f0136a531bb9cdbee08432832e175e367a63b84bcd6186a3190a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:8610ae8d2886f0136a531bb9cdbee08432832e175e367a63b84bcd6186a3190a) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:8610ae8d2886f0136a531bb9cdbee08432832e175e367a63b84bcd6186a3190a"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "5bb19c04f95f0136225b86841452b97438e22dbf",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDlBOyKqZO/dKJkEnbmdldjNvupu90Dlxs9v99tsIojPQIgTfJEqVVkxW+i8SLqPbqZ20tOH/ADOfo8D8bKVVmX3M8=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJlZTFmMjNkMmFjN2RjMGQwMGMxZjA3ZTE2MzUzZTBjNzIwY2VkZTU4NGY2YzE0ZjU2OWM3OWNjMzFjM2E5MGFmIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNkY3RZUG4vMVRCQlNPYVNoaTF1UEg2TUhVMEMyQXFBZ0x6RFd3cDFnQTB3SWdPN01zNkFDd2R3SUJxak9vS0M3dDNLTzlFdGpRY3Zac3dTODB6VHdCOFJFPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhWRU5EUVhrMlowRjNTVUpCWjBsVldGZ3dNMnhFUkZsS2FVaDJaell3ZUV4SU9IWlNhRlJ6UzBjMGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRWTmFra3hUMVJKZWxkb1kwNU5ha2w0VFVSRk5VMXFUWGRQVkVsNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZMTUdodVNsQXlibXBxZGxkalUyNXZabEpUVVRCWE1tWkhRWFUxTkdoeFkxcFpOMmNLTmxRNGJIcExWV3hEY0N0SU9FVk1hamhEWldoRldUbHNTMjF3TnprNVpWUmpkVEVyYUdzclJYbzBUakpsUmpCSk1IRlBRMEZyTUhkblowcEtUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZMYUZGVkNtVnJTMHRSTm1OTWVXSXJURTUyWkVsdmFUY3ljVXhWZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UWpWa1IyaDJZbWs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRGWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSUldOSVZucGhSRUV5UW1kdmNncENaMFZGUVZsUEwwMUJSVVJDUTJjeFdXMUplRTlYVFhkT1IxazFUbGRaZDAxVVRUSk5ha2t4V1dwbk1rOUVVWGhPUkZWNVdXcHJNMDVFVFRSYVZFbDVDbHBIU20xTlFuZEhRMmx6UjBGUlVVSm5OemgzUVZGUlJVUnJUbmxhVjBZd1dsTkNVMXBYZUd4WldFNXNUVU5aUjBOcGMwZEJVVkZDWnpjNGQwRlJWVVVLUjBkT2IxbFhiSFZhTTFab1kyMVJkR0ZYTVdoYU1sWjZURE5DTldSSGFIWmlha0ZrUW1kdmNrSm5SVVZCV1U4dlRVRkZSMEpCT1hsYVYxcDZUREpvYkFwWlYxSjZUREl4YUdGWE5IZG5XWE5IUTJselIwRlJVVUl4Ym10RFFrRkpSV1pSVWpkQlNHdEJaSGRCU1ZsS1RIZExSa3d2WVVWWVVqQlhjMjVvU25oR0NscDRhWE5HYWpORVQwNUtkRFZ5ZDJsQ2FscDJZMmRCUVVGWlVIbGxVa0p0UVVGQlJVRjNRa2xOUlZsRFNWRkRVa2RhTW5oSlpYUklUVFJyTWpoc1JsTUtaRlY2ZEVRMldscDBMMUZxUzBwRVYzWnhMMjVhVW5WVWRtZEphRUZNYzBaalpXaHpUR05UTldVNGJXMTRiV293Y1ZGQ2FIVTVSR2xLUzFwU05USjNNZ28wZDNKR1JrWlZhRTFCYjBkRFEzRkhVMDAwT1VKQlRVUkJNbXRCVFVkWlEwMVJSRTl4Y1dJeGJHeERTRnB3VlZaSGMzVnJWVFZhZGxneVVISklVMHd5Q2xWUUwwSklhREV3UWpaU1oxQjFabmRUU2xCYU1HUldTa2hMUTJGNFVuZHZSMGswUTAxUlEyUk9PVFZ6YlVkSFVsRndPV1JpYTJOd1VYQXlTWE5aVEZJS2FXeGtVbkZzYkRJNVRsZzBkV2hyTnpSMmVqQnhNa3htYmtWcVRFSXhaMGwxWkdaWWRFeFJQUW90TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1666220383,
          "logIndex": 5459712,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/python/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/python",
      "githubWorkflowSha": "5bb19c04f95f0136225b86841452b97438e22dbf",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3285558484",
      "sha": "5bb19c04f95f0136225b86841452b97438e22dbf"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

