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
| `latest` | `sha256:d89958307cc5004336fe5670cb07d9a36c29f9cf5695d25c5586d27a26cc23f2`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d89958307cc5004336fe5670cb07d9a36c29f9cf5695d25c5586d27a26cc23f2) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:d89958307cc5004336fe5670cb07d9a36c29f9cf5695d25c5586d27a26cc23f2"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "a8267d67a3733fc828282f3914413a96fab25aef",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIF+B5sLXLZLVFozaBOsFJ9jD2ZmMP9nOK1icXCTWIvAVAiEAkD8BAzVKNF+ZsRjcN6YdweIctSkUq29tJv46z7K1yq0=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI3ZTk3YzkxODFlY2ViNmY2Nzg2YzFmZDAxYWY3YzMzYTBiNDVlZTgwOWI2ZTdiMzA3YWI2YmQ3NGUzOGU2NGI0In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNjNjAwZFBJOElrSWFVYkticExVQ3VnOE40TVlRV1U3Ny9uMFltbGpBTHlRSWhBTnNzZ0VEMVZjUTIxNUxVNDFmT1djTmRVMlRXMXg4alRPeG1PWWNUUmpTZiIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlSRU5EUVhwSFowRjNTVUpCWjBsVlJqWkxUVVJGUTJkblUwUjZiWEZaWkhvcmRUSjJTRGxtVTBOUmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlROTlJFbDZUa1JGTTFkb1kwNU5ha2w0VFVSRk0wMUVTVEJPUkVVelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVV2VlZObVUweFJjMFZEVjFwMmVFaDVkVkl2TUZodlFYVXpVMnhEVG5RM1MwSXZMMUFLTHlzNFdWTjFkelZNZDJWbmJqZFlkMEkzWkVKdFRraFJXRmhMZWtSVGFuSjNTbXBJYzBobVVsQmhPRE5sTUhkTmNUWlBRMEZzUVhkblowcE5UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZKWmk5RkNtcHBZbVpuWlZSa05rVTFTRFpXVFZSMVFXdE1ibHBCZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UWpWa1IyaDJZbWs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRHWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSU1dNeVRtOWFWMUl4WWtkVmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMWxVWjNsT2FtUnJUbXBrYUUxNlkzcE5NbHBxVDBSSk5FMXFaM2xhYWswMVRWUlJNRTFVVG1oUFZGcHRDbGxYU1hsT1YwWnNXbXBCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFXMUNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNhR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9YZGxXRkp2WWpJMGQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFMwSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NIZEZaV2RDTkVGSVdVRkRSME5UT0VOb1V5OHlhRVl3WkVaeUNrbzBVMk5TVjJOWmNrSlpPWGQ2YWxOaVpXRTRTV2RaTW1JelNVRkJRVWRFTkRoeE9FWjNRVUZDUVUxQlVucENSa0ZwUVROTGVtOUZWa0ZOTmtoSmRYa0tTWHAxYlV0T0wySlNLM0JtVUhVMFIwWjVhR1F6YVhVM2MwVllUM0pCU1doQlR6Qm5SVGswUzFOYWJHRnVaVVl2TXl0VFFrRXhia05GTUhnMFNsQnliQXA1VDNSU1pUbDZUVEYwTjJ0TlFXOUhRME54UjFOTk5EbENRVTFFUVRKclFVMUhXVU5OVVVOV1QxRnFOalJ2YTFoUlltZFBWM0V3WmpSM1NqWlJUMUJRQ2xWcFpHRjFTbTh3VVZGbU4yVkNURlpFZVhsblpWUlFaSFpFVm1GaU0zRXdOVlZpZUhGeFFVTk5VVVF2VW1SbE9VbFdjalJ1YVc4NFRraHhkVFZGYUdnS2RtZ3dSR2t2TURoV01UbExRMjFWV2xZeFMzTnFkSEZOYUVrclZHOVFkMXBKZHlzNVRXOHpRM1ZQYnowS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1665974077,
          "logIndex": 5250479,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/python/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/python",
      "githubWorkflowSha": "a8267d67a3733fc828282f3914413a96fab25aef",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3261956069",
      "sha": "a8267d67a3733fc828282f3914413a96fab25aef"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

