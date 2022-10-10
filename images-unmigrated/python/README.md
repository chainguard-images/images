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
| `latest` | `sha256:e4aa101e98788998fb4703047182ed7abdafea699c47e48b15a4c697da9b2bfb`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:e4aa101e98788998fb4703047182ed7abdafea699c47e48b15a4c697da9b2bfb) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:e4aa101e98788998fb4703047182ed7abdafea699c47e48b15a4c697da9b2bfb"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "bf6c3effa4d432614bda5943e6e6aca8767380e0",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDy96ca/eMpZ5WzvVLEMYJCti+rg0MyPJRlO1x0z+AYqQIgWpDIvTQC1uYjPxvUEsU1fOKiVTzAmd0vpdtX04FP1rQ=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIzYzRkYzZkNWQ3OTU2NmU2NmJhN2I3MDAyYmQ5ZjVlYzI5ZGQxZWFjN2ZmNDJiMzE1NjgwZDI1MTFhNjgwNjk2In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQkU2ek9scTNMUEEyMUhEWkhVU0d4ODJubk1nbGJESXU5cFVIU0k1MzZVbEFpQWFSTVFOK1BBUjIrTy9qYWVjR2lheFp5d0xIaFZXZkQ2UzYyS01NNVJmSlE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhla05EUVhwSFowRjNTVUpCWjBsVlZtWk9ialpuYmt0YVkydG1hRTFRUVVSUmJFMUNURmN6VUdWemQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhkTlJFbDVUVlJCTVZkb1kwNU5ha2w0VFVSRmQwMUVTWHBOVkVFeFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVY1TTFoaFZWQkxUVmx3UlhRMmJuaDBaRFoyUmk5NFR6RmpWMEZxYURsTlZtNW9OMkVLTm5JNVVUUTNVM2xCZVRnNE9FUXdTbTFUTTNJeWFVVnVUazh6TDB3clJ6ZHNhVUpWVDFsUk1qZFhZVkk1Tlc5VVREWlBRMEZzUVhkblowcE5UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlUwTkRadUNtbzFOMDByZG5GT2NrUkhlSE5LUVhseGJVcE9jVE5WZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UWpWa1IyaDJZbWs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRHWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSU1dNeVRtOWFWMUl4WWtkVmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMWx0V1RKWmVrNXNXbTFhYUU1SFVUQk5la2t5VFZSU2FWcEhSVEZQVkZGNldsUmFiRTV0Um1wWlZHY3pDazVxWTNwUFJFSnNUVVJCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFXMUNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNhR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9YZGxXRkp2WWpJMGQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFMwSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NIZEZaV2RDTkVGSVdVRkRSME5UT0VOb1V5OHlhRVl3WkVaeUNrbzBVMk5TVjJOWmNrSlpPWGQ2YWxOaVpXRTRTV2RaTW1JelNVRkJRVWRFZGpkSmFITlJRVUZDUVUxQlVucENSa0ZwUlVGcU9EQlVhbTB3VWtOVVFuSUtRMjlyYXpGUk0xZEZSRkV5YXpSM1NqUjNValIzZFdseVYyRldjMmxJVFVOSlNHbERlVUpqTDJsUVExTTVRekZOZDBSTU56RlFTMjF0VFhvNVFVUnZhZ3BWVUV0SGExcGFTMVJoWjJOTlFXOUhRME54UjFOTk5EbENRVTFFUVRKblFVMUhWVU5OVVVOaGNHWlhSWE5YTDJkSmVqZ3phemxtUW0wNU0yeG1jM1ppQ21KUFYxUkhObGd4TlhoMmEyaEZVVFZ2T0U5UGNtaDFkek5uY1ZOMVNDdDFUekp3UTNGYVZVTk5SMGRVYW5WSEsyOXlTVXRUY21sTVRYVnFTMUpXWXpRS1dGaHhVek5vWkU1S1JVbFdObVEyTWtoemF6RkdlREZZTjJKa1pITlJTMlpoV0ZjNFJEbDFUblJCUFQwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1665368489,
          "logIndex": 4788042,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/python/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/python",
      "githubWorkflowSha": "bf6c3effa4d432614bda5943e6e6aca8767380e0",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3216474182",
      "sha": "bf6c3effa4d432614bda5943e6e6aca8767380e0"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

