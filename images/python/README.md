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
| `latest` | `sha256:11d662bb8dd066de8dc420a435b46b5d1a99fe9866e7a03e076c796f60ab44a1`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:11d662bb8dd066de8dc420a435b46b5d1a99fe9866e7a03e076c796f60ab44a1) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:11d662bb8dd066de8dc420a435b46b5d1a99fe9866e7a03e076c796f60ab44a1"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "0e87f3054bbbc0ae6c121310b991479a55b8e782",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDcb2xk09nm4zbmegxer39d58L1L5sTljxhQ4wHBpj1gwIgVwflMj3zryyyIkKn64Tl5vI5dZC8IEJ28mW0DxfApNU=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIzNmMyYjNhODhlZWI1YWM3ZjE2MGY3YzM1NTVmY2U4M2I3YWUyNmM4MzI4N2E0MWQwMTU5Y2E0ZTFjZTU2ZWY5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQkRtZEF3aFZDZ2I2ZlVIZktTaURneTNXM1F2eGFwOUdjYzFqWHV2dlp1a0FpRUFsTjYvOS9rSmdsTDE2ZVhVZXdNckovQ1A1bW5nR05GbXd6LzRmOGtXUnBjPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhla05EUVhwRFowRjNTVUpCWjBsVllWaGlkbHAwV2xWSmNqWTJjRWxwYUN0bVJHNUljMllyVFhGM2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUVRSTlJFVXhUbXBSTWxkb1kwNU5ha2w0VFVSQk5FMUVTWGRPYWxFeVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYxYVV4NGNXaHpZbGd6YjJKeVFXMVRSSFJXWkcxdFJYaE9UM2hMYUZBdk1qY3Ziak1LTTJoSGVWWkROMmx6U1ZCSU1rSkVWV05RTlc5M1MwNUxWbnBXUVZSdVRrRjFOR2h6UTNoVlMwdzRMekJNWVUxTVNtRlBRMEZyT0hkblowcE1UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZKVlhSQkNuZFdXRmt4VG5Ka1VqZHBhSEEwZEhkMVkydHBjRlpSZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UWpWa1IyaDJZbWs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRHWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSU1dNeVRtOWFWMUl4WWtkVmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMDFIVlRST01sbDZUVVJWTUZsdFNtbFpla0pvV2xSYWFrMVVTWGhOZWtWM1dXcHJOVTFVVVROUFYwVXhDazVYU1RSYVZHTTBUV3BCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFXMUNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNhR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9YZGxXRkp2WWpJMGQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFNrSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NITkZaVkZDTTBGSVZVRkRSME5UT0VOb1V5OHlhRVl3WkVaeUNrbzBVMk5TVjJOWmNrSlpPWGQ2YWxOaVpXRTRTV2RaTW1JelNVRkJRVWRFZEZVNGFqRkJRVUZDUVUxQlVtcENSVUZwUVRKb1lYTmxlRWR6UmxadFJub0tPSGQyV0RFdmMxaEdOekp1TTJKQmRtNXRVRXQ0TlZCTVJHcHVjVGhSU1dkU1dDOUljUzgwT0NzMWMwZE5WMkZTUTNNd1dTdG1hVGhhU0U5NVkxQmlTZ3BWWkRVMFRURlRSM0lyYjNkRFoxbEpTMjlhU1hwcU1FVkJkMDFFWVZGQmQxcG5TWGhCVDJWc2VqUldNbTFWY21KWmMzZFNUbTFSVG5SaE0ycE9iSGR2Q2tkdFYyOXhiVEE1V21OTE16SnVNM2ROU214QlNXZEhiMWxyYjBzeWVETXJVa1pCWkZSQlNYaEJUSGxvZEhKNk9HYzNhMHRwTHpNd1RDOXFUblpvY1U4S2FIazRiVzlxYVZCUkszRlViRmNyWkc5dmFFTktUMkl2ZWxCVVQzVjZZbmQxVkVod01IZE5URXRSUFQwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1665194228,
          "logIndex": 4667059,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/python/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/python",
      "githubWorkflowSha": "0e87f3054bbbc0ae6c121310b991479a55b8e782",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3208718843",
      "sha": "0e87f3054bbbc0ae6c121310b991479a55b8e782"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

