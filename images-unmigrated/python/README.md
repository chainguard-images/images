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
| `latest` | `sha256:d9bf325feb116e9a634d667e299759b2cb0e10e6926051953f65560c4a74c3de`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d9bf325feb116e9a634d667e299759b2cb0e10e6926051953f65560c4a74c3de) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:d9bf325feb116e9a634d667e299759b2cb0e10e6926051953f65560c4a74c3de"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "10394756fadebffc33c405e0d3963655bfbb3e41",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQC4aTYr7u/cKXQdZ0Z8wkwI867VcEHux0tFDNpb5lNgfAIhALtKi2jDQxFfWLntVcD1RoIS6Hwzo43izfOEdavI1GT4",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI3Y2Y2NjI2ZjY1ZDE1NjA4OWNhMTkwN2IyNzBkYTViZGRiYTY3MzRjZGUyZWFiZmUxMDNjYTgzYmU4YWYxMDJjIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQk9SampCTDBwZkZLNXZoUzRMY0tLd1ZVVCtoV1cwNDNyZCttbVhFRFFRMEFpRUFqS2J1UTNBOURJYTJ1aS8reXNXRGRBOHpid3dFT3BISVFZaHpJMlpqZXdBPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUndla05EUVhrMlowRjNTVUpCWjBsVlpETXhjRGRhSzNOcU5uZE1jWFpqVVdOeGVsWmhkbFozZG1zMGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhsTlZHZDVUVVJCZUZkb1kwNU5ha2w0VFVSRmVVMVVaM3BOUkVGNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZuTW5ZelRFRkhlbUlyUkZKR1kzVkpTV3hCTUhNMEx5OW1ia2x5VlN0SGJGRlBiMWNLYmpGV2FIY3ZURTU2Tm1KVmQwSjNlVXRaTm5Nd2FUZDZjMnRaV1ZkNmRtSnpaa3ByYlZZNGRYcENhR3RYWkV0bVRIRlBRMEZyTUhkblowcEtUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlY2Y2tWc0NsbE5lR2RUUmxKRGVISkdRVVF5U0Rsck5FRk5iME4zZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UWpWa1IyaDJZbWs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRGWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSUldOSVZucGhSRUV5UW1kdmNncENaMFZGUVZsUEwwMUJSVVJDUTJkNFRVUk5OVTVFWXpGT2JWcG9Xa2RXYVZwdFdtcE5lazVxVGtSQk1WcFVRbXROZW1zeVRYcFpNVTVYU20xWmJVbDZDbHBVVVhoTlFuZEhRMmx6UjBGUlVVSm5OemgzUVZGUlJVUnJUbmxhVjBZd1dsTkNVMXBYZUd4WldFNXNUVU5aUjBOcGMwZEJVVkZDWnpjNGQwRlJWVVVLUjBkT2IxbFhiSFZhTTFab1kyMVJkR0ZYTVdoYU1sWjZURE5DTldSSGFIWmlha0ZrUW1kdmNrSm5SVVZCV1U4dlRVRkZSMEpCT1hsYVYxcDZUREpvYkFwWlYxSjZUREl4YUdGWE5IZG5XWE5IUTJselIwRlJVVUl4Ym10RFFrRkpSV1pSVWpkQlNHdEJaSGRCU1ZsS1RIZExSa3d2WVVWWVVqQlhjMjVvU25oR0NscDRhWE5HYWpORVQwNUtkRFZ5ZDJsQ2FscDJZMmRCUVVGWlVFNWlUV0pNUVVGQlJVRjNRa2xOUlZsRFNWRkVNemR3WlRSbmIwdFFkVWRKYjNaSGJYZ0tRV3BFVVZweWIxSkVabGhET1RGWk1sZExabUZrT1ZwMVYzZEphRUZRU2s4d1QzazBVVEJHU1c1blEzbHJlRzR3ZGxKR2RqVnRTbFprUWxkTVVISjZhQW8xZGt0SGJWazBSazFCYjBkRFEzRkhVMDAwT1VKQlRVUkJNbU5CVFVkUlEwMURZa0ZzTjNGblkxcDVVVWsxTUd0WFoxY3ZSREpMU0d4VlpESmFjMmgyQ25kdmJFa3diM1JLTTNCWVRsbDBVVzR5ZEdKRlNIcERNMDEwTnpSTFdWcDRSSGRKZDJSaFZXaEZRMVpNY3pkUFZraFdlbTh5UWtWYWFUWnhjVTV0Tm5VS1duTnRjWGhwYjJVcmNHaExWMmxhUlRscVpUTnlXSGczSzBaQlRVNVFWRlZPTDBSRENpMHRMUzB0UlU1RUlFTkZVbFJKUmtsRFFWUkZMUzB0TFMwSyJ9fX19",
          "integratedTime": 1665598828,
          "logIndex": 4977924,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/python/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/python",
      "githubWorkflowSha": "10394756fadebffc33c405e0d3963655bfbb3e41",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3236942892",
      "sha": "10394756fadebffc33c405e0d3963655bfbb3e41"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

