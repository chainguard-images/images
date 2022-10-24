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
| `latest` | `sha256:703922a5fcaa3573a6826a6c647f6023789ba766bf496d058b2befa32bf4888c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:703922a5fcaa3573a6826a6c647f6023789ba766bf496d058b2befa32bf4888c) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:703922a5fcaa3573a6826a6c647f6023789ba766bf496d058b2befa32bf4888c"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "0e6b0cecb6d4eae740d3850c47fdc2873d539c73",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCfhJVo6256JOal1A4CT1cIlsHDHihj8fkT4SQDmWwKswIhAKCu5HQ/omMKKLqnvFdjaRgbQTaC0iE4JkAcXrJTe5mz",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI2OWY0NTFkMTkzNzI1ODhmZmE0NzQwZDI1OTZjZDExZWQzNGZkYzZiOGVmNTcwNWJiYjEwMDVlYjgxYjk1ODU4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNSWVl3bWpaUmtRZnJ2TE92Y2pDK1U5TlpsMmxMTHhoU2RXb1lRdzhzUjZRSWdXeS9lL1RVeTNDc3l5akt1M245TzNVMUpldFFlNWNhVFp3K0prS08rcWFFPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlSRU5EUVhwSFowRjNTVUpCWjBsVlFVMU1ZM2RzVlhwRWEwcHFZV1F3ZUROWFYzaDBaREZoVkRJMGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RCTlJFbDZUa1JCTTFkb1kwNU5ha2w0VFVSSk1FMUVTVEJPUkVFelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ1Y3pVeVFWQk5SbFF2ZGtoM2VqUXZla1JxUm5aTFpsUklTMU56VkV4bGRVZEhjMVVLUVVWQ1ltcHlZbGxyTlRnNGVWaFZVM3BLYkVGdWNFNDRVamx0S3pJNVZXeG9RbkYwTjNCUE5rOVFUWEpSUjFKemREWlBRMEZzUVhkblowcE5UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV3WWpsR0NqVmlWbGRtSzFReWRHZEZTazlsWjBwMVdYTlZMMjl2ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UWpWa1IyaDJZbWs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRHWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSU1dNeVRtOWFWMUl4WWtkVmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMDFIVlRKWmFrSnFXbGRPYVU1dFVUQmFWMFpzVG5wUmQxcEVUVFJPVkVKcVRrUmtiVnBIVFhsUFJHTjZDbHBFVlhwUFYwMHpUWHBCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFXMUNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNhR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9YZGxXRkp2WWpJMGQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFMwSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NIZEZaV2RDTkVGSVdVRkRSME5UT0VOb1V5OHlhRVl3WkVaeUNrbzBVMk5TVjJOWmNrSlpPWGQ2YWxOaVpXRTRTV2RaTW1JelNVRkJRVWRGUWpsaldHVm5RVUZDUVUxQlVucENSa0ZwUVVsT1dYQlVPVEJpTUdoTllVMEtURkpLUTIxcVowWjZORzFYY25kd1Z6RTFVWEF4TkZOb1NVcGpNblJCU1doQlRVRjZSRVJHTmpVeWJWTkxWRzFzV25GYVRubFFTRTVuYW10bmRqRmhkd3BPYW14cmVtRmlZMU5ITDFsTlFXOUhRME54UjFOTk5EbENRVTFFUVRKclFVMUhXVU5OVVVSc0sxSTNhM05IWVRoWmJHdHZOMFI1TWxKRGVVaDRWR05aQ2pFdlJXVnhiRzR5Um5aQmNVTk1TV296Y0VaR1IxaFNWbTA1U0ZjNFVXRmxhekZ0U3k5YWIwTk5VVU0yWkRaaU1FaDJNMFJNTmtocEwyMVliSGhwYkVJS2FsZzVNV05CTURkQmFHNXJhMlJoWkdZMlkyWnZNRVIxV0RaVWNGQnFTM1ZOYTBOMVRrTlRSbVJDU1QwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1666578868,
          "logIndex": 5734127,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/python/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/python",
      "githubWorkflowSha": "0e6b0cecb6d4eae740d3850c47fdc2873d539c73",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3309582029",
      "sha": "0e6b0cecb6d4eae740d3850c47fdc2873d539c73"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

