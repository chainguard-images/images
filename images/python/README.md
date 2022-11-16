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
| `latest` | `sha256:f8d7f26225e7ba30b5bfee7e5a9115523eb21529a6ff37010dd130b20cdd04fe`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:f8d7f26225e7ba30b5bfee7e5a9115523eb21529a6ff37010dd130b20cdd04fe) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:f8d7f26225e7ba30b5bfee7e5a9115523eb21529a6ff37010dd130b20cdd04fe"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "869efd11ebe16c22a75b63f6700d2f6f085aa83c",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIDif4kQHJd8naS+V79uKAAHgH3r6e+lILjlqlFXpqiWZAiABAQC8H+sXFvcG27qJUg4ppC2+U2kn3csT9y4TSsjO2A==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJkMWRmOTg2YmMwMzhiNjllMmRjNjZmNTE4ZjNmZjczMTZiZTBlZTJkOTU1Mjk2NzQ0YTg4MzE5MzYzOWRmY2RkIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUQvWHFyNmh6ckZFYjdJb1lERTdMWjROdmtUNjM4YkFqT0xUbE5veFBWbHRBSWdNTzlYNE5FQ2xaL2ZxZ1loYUgzR0YrOUJRK1U4cnFPZWJDR3FwSHBMWGx3PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlSRU5EUVhwTFowRjNTVUpCWjBsVlpXY3lTVEZoWlVvemNrWXhOWE5aYWxkTE1XRnFkVkZUT1dSamQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlRKTlJFVXdUMFJSTWxkb1kwNU5ha2w0VFZSRk1rMUVSVEZQUkZFeVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVUwZFZkNmJrVjZlbkJuTWpsUFRXaE9ZMVZWWlVWTVpYcGFOMVJqWmt4eE9IWTJSazhLTUdJd05raHhObFJFVGtST2RHWlBWbGxUWmxKRVYzZEZObVozYzBob1dVb3pZVVJDUkdsSmIwMVlOM1p3ZDJrNU1qWlBRMEZzUlhkblowcE9UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZqYTJJMUNubFliRWg2SzJFNGVGRlJjMkYxY0dWaU1UbHpTVVZCZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UWpWa1IyaDJZbWs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRHWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSU1dNeVRtOWFWMUl4WWtkVmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMDlFV1RWYVYxcHJUVlJHYkZsdFZYaE9iVTE1VFcxRk0wNVhTVEpOTWxreVRucEJkMXBFU20xT2JWbDNDazlFVm1oWlZHZDZXWHBCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFXMUNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNhR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9YZGxXRkp2WWpJMGQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFRFSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NEQkZaWGRDTlVGSVkwRXpWREIzWVhOaVNFVlVTbXBIVWpSakNtMVhZek5CY1VwTFdISnFaVkJMTXk5b05IQjVaME00Y0Rkdk5FRkJRVWRGWm1ndlZrOW5RVUZDUVUxQlUwUkNSMEZwUlVFNVQydG5WR2gxV0dkSVZHNEtXRU16Tms4d1YwVnBhUzgxY1hwM05qWk1OVkl4WkZaak1Ib3lPWEJUTkVOSlVVUmFiVWRhZVRKQlJIRktVR0p4VmtGcFRXdDJPV3haVlZwak0yVXJWUXA2TUhsUmEzTmlRV295UkRsMlJFRkxRbWRuY1docmFrOVFVVkZFUVhkT2IwRkVRbXhCYWtWQmVERlJRalJLZVhWTGVubEZVa1VyYkc1V1dGRTNTVWxEQ25wUWFuQlNTblF5ZWtRMFl6RldUMGRyUWpGblpWVmxNa0paUVRKblpIWmhXWFJGY25jMlZ5dEJha0paVDBGM2FHbDFWMmhvYW5aTVNGTnhOMjh4TkZRS1JHc3liSGwwVTJkbU1qRlFVREpzUVROcldYRkhSM0JqUWs0ek1GcGtNMWxMU1dKamJGbEhOa1kzWnowS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1668563357,
          "logIndex": 7170707,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/python/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/python",
      "githubWorkflowSha": "869efd11ebe16c22a75b63f6700d2f6f085aa83c",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3475680491",
      "sha": "869efd11ebe16c22a75b63f6700d2f6f085aa83c"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

