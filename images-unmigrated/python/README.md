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
| `latest` | `sha256:347b7cc33e24d208ab72dedb46014934e69f0dd57f91e4ff1aaf07131f759277`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:347b7cc33e24d208ab72dedb46014934e69f0dd57f91e4ff1aaf07131f759277) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:347b7cc33e24d208ab72dedb46014934e69f0dd57f91e4ff1aaf07131f759277"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "7ece2243022c0e51e187bb9dcc0f4eb15276afa3",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQD2xGC3QPXFO/u1ygWcGwfP2KZjuuANQyxvrpTToOJ9ZQIgLFwfwmiKQvZV5+PJ+sCYY7D28kJ53RyyOgUYlMI+LSc=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI0NjQ5ZGY4NzRkOTBmNjVmODFkMTYwNjIxZTFkZTVkMzY0YzVmMjE5MTgwNzBlYWZiZTY2MTdjY2Q3M2U4MjI5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJSDgyT1UyMzY1ektkSytXcTBLQlZTTmZDZmVIbG1qYUhTZThIRWhrNzRVVUFpQWkwN0tBbUxSUk5rWERVd3RmV08yZC85b1NYanFaaHRLUldpWFFKZkY0eHc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhha05EUVhwRFowRjNTVUpCWjBsVlRURjZhbmhpWTJGNmEwNHdLM2xwVjA1NVRYcFFURTF4YldGWmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlRSTlJFVXhUVlJOTVZkb1kwNU5ha2w0VFZSRk5FMUVTWGROVkUweFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ2ZEhSV1ltOW1iako2TmpCQllWa3lkMWxKUlVGRFJHNDVTUzl5U0hNMllXVk9SREVLSzA1cWRIcHRNMlZNVjJFeVUwWnFiVlJCVFhSaU9UazFkbTVtU1c5VFlqZElkRlpDVXk5QlNFeFVOV0ZQVGtWMGIwdFBRMEZyT0hkblowcE1UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV5YkZwd0NrcDZjRFZCWWs1aVdIaEtTSG93TjFveVptSkdjRVJKZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UWpWa1IyaDJZbWs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRHWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSU1dNeVRtOWFWMUl4WWtkVmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMDR5Vm1wYVZFbDVUa1JOZDAxcVNtcE5SMVV4VFZkVmVFOUVaR2xaYW14cldUSk5kMXBxVW14WmFrVXhDazFxWXpKWlYxcG9UWHBCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFXMUNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNhR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9YZGxXRkp2WWpJMGQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFNrSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NITkZaVkZDTTBGSVZVRXpWREIzWVhOaVNFVlVTbXBIVWpSakNtMVhZek5CY1VwTFdISnFaVkJMTXk5b05IQjVaME00Y0Rkdk5FRkJRVWRGYVVjNGFqRlJRVUZDUVUxQlVtcENSVUZwUWpSSVR6RlZkakJ0TjNSUlduTUtUbmRzYTNwMFRFa3pTazlrYlNzM1FVMUJla0Z1UlRocFRXUldUbE5uU1dkTk4xQlljamxQYmxKYVVXdFpUSFpLU1VvclpTOWFVbFZTYWt0U04wdFhXUW93VjFWUFdHWkpTMUpVYjNkRFoxbEpTMjlhU1hwcU1FVkJkMDFFWVVGQmQxcFJTWGhCVGpWUmFqTjVabE5QZEZVck16STNiRGx2WlVSV1FsRnhibWRpQ2sxdEsxVnVaV2gzVUhoYWFsZDRka3hDZUhoaWJsVjNiaTlhVjBRdlUwdEhZekI2U1VWblNYZGpZa2Q1VkhSbGJrTm5WbGRyTm5OVk1UZFpaVFJxYms4S1EzZEhLek5vUlVWQlFWWnVjREo2YkRjNWJYSlZTblZzYUhObFRHbGFWWFV4VlhjNVdGcDZhZ290TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1668736320,
          "logIndex": 7312672,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/python/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/python",
      "githubWorkflowSha": "7ece2243022c0e51e187bb9dcc0f4eb15276afa3",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3493508188",
      "sha": "7ece2243022c0e51e187bb9dcc0f4eb15276afa3"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

