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
| `latest` | `sha256:9429f14e29f5a675c590728bfa5104cab835e284e778079b48ee4387c5bfa313`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:9429f14e29f5a675c590728bfa5104cab835e284e778079b48ee4387c5bfa313) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:9429f14e29f5a675c590728bfa5104cab835e284e778079b48ee4387c5bfa313"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "a9c0e2c4c05c3019a2bb101e7d7926e36ab131ed",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIDzkp0/fxm06B/weR2GlIC6668IO9g0AiFobVgARBulIAiEA111Wd7jXNgiKek2otER67mgRNXMaSOjMLhTFrB91iFk=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjZDZmOWEwNzE5MmNkMWU1ZWY3MmNiYTdiMTkxYjNlODgyOGFkZGEzYjBkZTY1ZDg5MmFmZWVjMWUwMjk5MDc1In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQlpMN2RNcEVEREI0alpWRGZ2eHc5c3JjQUJXajJiNHgxWXZCN21GTk1oTEFpQXJPeXEvc2NUQ1ptNUlFYnp2Mkp2aGhNOUp0QkZGaldNeXRSSHJkM2ZFNUE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlSRU5EUVhwTFowRjNTVUpCWjBsVlZEbDFVVWx1Vm1oMVdYRjVUbHB3TldreU5ISTNlV1EwWVVwbmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhwTlJFbDVUVVJSZVZkb1kwNU5ha2w0VFVSRmVrMUVTWHBOUkZGNVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYzVUhwRldFazBPREZWZDNwWk9IWlRkelY2VjJOdk1rMVhPRVZ0WjNwb1REY3hPSEVLWWxoMVJISndUQzlzUjBzMFRHNU9PR1J3UmtaRFFVdHpjazVEWnk5TlFqSjZiRWhKTlV3elVHWldVR0pXZEVsM2NrdFBRMEZzUlhkblowcE9UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZNZUhScUNrbFJVSGQ0ZUdkR1p6ZFlkRVEyUVcxdFpGRTNVWEF3ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UWpWa1IyaDJZbWs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRHWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSU1dNeVRtOWFWMUl4WWtkVmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMWxVYkdwTlIxVjVXWHBTYWsxRVZtcE5la0Y0VDFkRmVWbHRTWGhOUkVac1RqSlJNMDlVU1RKYVZFMHlDbGxYU1hoTmVrWnNXa1JCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFXMUNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNhR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9YZGxXRkp2WWpJMGQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFRFSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NEQkZaWGRDTlVGSVkwRkRSME5UT0VOb1V5OHlhRVl3WkVaeUNrbzBVMk5TVjJOWmNrSlpPWGQ2YWxOaVpXRTRTV2RaTW1JelNVRkJRVWRFZW5sVVltUm5RVUZDUVUxQlUwUkNSMEZwUlVGd2MzcDZTV1YwU25GYU9HTUtibGhtWWtNd2RUUmlWRko1Y2xCR055dG9NSFphVlZSSFExcEVOazAzVlVOSlVVTnNRMUpNZFZoVFRWb3ZSMkV4YUVNelVUbExjbVpwZVdzMlIya3JNd3BLY21wclRYaGpjbXBhWVVZeGFrRkxRbWRuY1docmFrOVFVVkZFUVhkT2IwRkVRbXhCYWtWQmJXeEpPRXRUV2xoalRVeHBjazFPTHpCU1VVVlpXSFl5Q25ReFJVNHdlblZEUm1welZGVnlPWEppUkZRMGMweHlSVVJGVGs0NVUyeFlVSFFyZVRGV1YwZEJha0ZLU0RJM1QwaHhkVWRxTDJOU1EwSjJRbk50UWtnS2IyMUdZbkpzV1c1UVNXdEJTbGhDYUdoU01EVkxieXQ2TDJkdVYzaGxaR1pTWmtKc1ZqaGlOMmRKT0QwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1665627661,
          "logIndex": 4999306,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/python/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/python",
      "githubWorkflowSha": "a9c0e2c4c05c3019a2bb101e7d7926e36ab131ed",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3239226049",
      "sha": "a9c0e2c4c05c3019a2bb101e7d7926e36ab131ed"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

