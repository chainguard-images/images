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
| `latest` | `sha256:a65e131ecbca96160aa4e3c680ea1e24b46bfb4c760e2ee7ff365245da1a9e0d`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:a65e131ecbca96160aa4e3c680ea1e24b46bfb4c760e2ee7ff365245da1a9e0d) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:a65e131ecbca96160aa4e3c680ea1e24b46bfb4c760e2ee7ff365245da1a9e0d"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "c3734f72d52076dd891fdf83b3aeb6eb0c5d9b76",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDR9leERRQhk9jIYVPEdp6Zq7A+TZHTCz3d0SJ96JvufwIgA+KMLg18P0W0D/ikvX872DJKItKD7D82JYRfd6gChp8=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJiYzEzYzAzNzAwNWVhZWFjNDE0MjFlODc0MDEzMTU4NWM1OWU5MzVmZWFkYzQ5ZjhjNTk0MDc5NzNlMDU1YWQ3In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNHVjFzSm54Y1dJQ2VyOW5GTjIyZzhlWE53WE9KRHFSVmFwTVNpRXZNeW5nSWdTNk4ySGQ2aTNhV1ZDSUpOVVhydGxhbFRYeFdUK09mUTl0VXk2ZFJtZCtjPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlSRU5EUVhwSFowRjNTVUpCWjBsVlZrdE5aMFl3VVc1U1IwY3pNMlZDVDBkNlduVTNlRzVGWXpCamQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRWTlJFbDNUWHBCTkZkb1kwNU5ha2w0VFZSQk5VMUVTWGhOZWtFMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZISzJzelVETTFZVUp4Y1ZWS2JpdHlVRzk0V2xrMU1rRjVWVzQwUWxSdFVteDJaR2dLVm14Nk9FMXNhMmxpYzBGeFdHRTBRbVZvTjBoUVprcExaVlJZYnpOVlRIcFJWblJNTDBwSGExSXlRMWxZV2tzelkyRlBRMEZzUVhkblowcE5UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZVYmxGd0NtSTJhREF3TWtKUFR6aFJhelZqZUhkUlpUVm9hRFJaZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UWpWa1IyaDJZbWs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRHWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSU1dNeVRtOWFWMUl4WWtkVmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMWw2VFROTmVsSnRUbnBLYTA1VVNYZE9lbHByV2tSbk5VMVhXbXRhYW1kNldXcE9hRnBYU1RKYVYwbDNDbGw2Vm10UFYwa3pUbXBCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFXMUNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNhR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9YZGxXRkp2WWpJMGQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFMwSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NIZEZaV2RDTkVGSVdVRXpWREIzWVhOaVNFVlVTbXBIVWpSakNtMVhZek5CY1VwTFdISnFaVkJMTXk5b05IQjVaME00Y0Rkdk5FRkJRVWRGVjJsQ05FMTNRVUZDUVUxQlVucENSa0ZwUVZWblRGRTVRbk5xVWpOdFRrTUtUMEpKVG5aU1EyVXhNVGQ1UWs5SlZHaHNNekZzWVdSd2NGVmFjRmhCU1doQlNUSnFNelY1T1RoVWJITnJlQ3RvV2xwTlVESjRiR1ZSVmtoaFdtTklSUXAzYnpjMFQyeHBORmRvWlRaTlFXOUhRME54UjFOTk5EbENRVTFFUVRKclFVMUhXVU5OVVVOcVRVbFNUbk5pZVZkcFdscEhaV05SSzJadlExSkhRa1p5Q2xGVmVtUlhUakJoYmtSaE4xTm9aa2xHT1hSRllqSTJkR1IyV214MlIwaHVNRGR5UVhSSFJVTk5VVVJuYnpSTFlYSlVNVkJUUzJNdmRYTlFNMEZUT1RVS1p6UldTVXRhUTJ0VVpDOWhRV3gzTkV0U01EZEdaa0YxVnpsMVMwVklXbXBpWkhWdllYZDJXRFpNY3owS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1667959419,
          "logIndex": 6758427,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/python/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/python",
      "githubWorkflowSha": "c3734f72d52076dd891fdf83b3aeb6eb0c5d9b76",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3424729164",
      "sha": "c3734f72d52076dd891fdf83b3aeb6eb0c5d9b76"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

