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
| `latest` | `sha256:fbf5d909ed1e56f41ef9bcb07e2654a2e185e79ab526eba4170e7ff978c03ad1`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:fbf5d909ed1e56f41ef9bcb07e2654a2e185e79ab526eba4170e7ff978c03ad1) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:fbf5d909ed1e56f41ef9bcb07e2654a2e185e79ab526eba4170e7ff978c03ad1"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "dcbfdebf6cc2803e0f8994b31b617e3fd9b20a78",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDJadBik75PnW+TLq7FsMdqvHZd29BrOBFcuzR+l05AJAIhALrM2pBOPVM4idQw4I8GGypQr6kniZVNsNW0wmRQyJ+o",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI3NWJhMTNmMjJlYTY3MWIwYjA0NTJhNDM2OGJhYTZlZGNiN2Q3ZDc4NmZlMGEyMTNiMTkwYjUxNDgyM2IxNjcyIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQ2xuMTdKY0RKZStNendMOHBBbnBlTzdOdnJ2VFF5ZDJ6R0FHdmFKeDk1SEFpQU5kRVcvdTlJUHYxL3crU3dlN3JBT1h6K0ZzYXFWWndhZHl5T3NEVlFpTWc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhla05EUVhwSFowRjNTVUpCWjBsVlZWVjRURWRKVW1kTGEyUnphRWRIT0hZM1puVm9Na2x4YTFjd2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVhoTlJFbDVUWHBCTTFkb1kwNU5ha2w0VFZSQmVFMUVTWHBOZWtFelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZXVUhWS05UUlBiM1IzVDIxRE5sQlliVzVPWWtGbGFrbG9WMjFsYzJwYU5XaFBabWdLUmpGVGMydGhVVmhVWTNCeGN6RkJMMWRaZUVKNmQwaElWMmhzVFU5clQyMUNMMWhyUTJORWQzSTNLMUJ5WjFKUFZXRlBRMEZzUVhkblowcE5UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZRT1hNMUNuRkNOM05aWkdGclpVRkJSa1pvUTJ0aFdXUXJRaTgwZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UWpWa1IyaDJZbWs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRHWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSU1dNeVRtOWFWMUl4WWtkVmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMXBIVG1sYWJWSnNXVzFaTWxreVRYbFBSRUY2V2xSQ2JVOUVhelZPUjBsNlRWZEpNazFVWkd4Tk1scHJDazlYU1hsTlIwVXpUMFJCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFXMUNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNhR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9YZGxXRkp2WWpJMGQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFMwSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NIZEZaV2RDTkVGSVdVRXpWREIzWVhOaVNFVlVTbXBIVWpSakNtMVhZek5CY1VwTFdISnFaVkJMTXk5b05IQjVaME00Y0Rkdk5FRkJRVWRGVFZBdmEydEJRVUZDUVUxQlVucENSa0ZwUW1RNU5GSnJNVGRtU1VKd1NUWUtXVmhuY21NMWJHOXRNRXRvUlVaeFp6aDBkVFphVlhkdlJWWXlRbUpSU1doQlMxVkljalphVTJJeGJsUkxTRzgyUzJkVVdrUldWWFZZZW5WeU9GSm5TUXBVTXpSd05WSXhPR2xPVTJaTlFXOUhRME54UjFOTk5EbENRVTFFUVRKblFVMUhWVU5OVVVRd2NrVmFjQzltVG5oTVF6WmpSRE0wT0ZSdlFtdzVOREUwQ2k5S09VTlpjamx0ZUhvMWREaHNSbU5qWTBkdVZYUm9aM0JCVDFOSGFERkRZMFJpVnpGWVJVTk5SVzl0VWxVMU5EZHphbkJ1VEdac1FUVkZRVFl4YjFvS09IRjRUVmRPZWtOdWJrNW1TbWhuTkdwUGNrSlhOako2ZDBGaFFVMTFhR2RPYzBWTFZ6UkNRMVJCUFQwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1667269412,
          "logIndex": 6264103,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/python/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/python",
      "githubWorkflowSha": "dcbfdebf6cc2803e0f8994b31b617e3fd9b20a78",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3366293936",
      "sha": "dcbfdebf6cc2803e0f8994b31b617e3fd9b20a78"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

