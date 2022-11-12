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
| `latest` | `sha256:9b22e8f539bc32769225ac77ee75eca3e4dcb754c8f0658d5503314d802141a4`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:9b22e8f539bc32769225ac77ee75eca3e4dcb754c8f0658d5503314d802141a4) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:9b22e8f539bc32769225ac77ee75eca3e4dcb754c8f0658d5503314d802141a4"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "2f68a98b3ba0e896ed617f940eb7966f2ad3389f",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCICSpqJwk+pKsK+Zo+DHrQe6qu1gWi8r0H4FQP5P0ETwAAiEAg8sOSRS/j62/7voqFtVKHSmhIWVMu0hWqp9fF2xnpeQ=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI3ZTAwMDg2ODYzYjE3NDY1MmMxNWI2MDJmMmQ1Njg3ZDA5NjgyZjU4M2MyMzVkYjliOTkwODc3MThiNzFkMGQ5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNWbExzNmZ0eC9vN1hYcUtseWNLeENPbTA4dGcvTDdsMTAyb0pvUDVDSUp3SWdCNlpXY1djN3J6aEJEM2JmQ2lJS0hhTm1KN0Y2Q00vR1NTTVlOYTlha0pZPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhla05EUVhwSFowRjNTVUpCWjBsVlNFSjNLekpQTVcxNVdYcFNRVFZVYm5kMU1tNXhMMDVpWm0xUmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlhsTlJFVXhUVlJCZUZkb1kwNU5ha2w0VFZSRmVVMUVTWGROVkVGNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZCTURobVNFWmpUblp4UzJZM1VTOTNVMlp5Vmtjd2NXWnFlVVpOVWpsVlEycEJTV2dLTlZSdldIaFVTRTB5ZGpKV05qVkpNMEoxVnpCMmIyMWFZbXhuYmpoWVRXUlhkSFpXWVRoWFF6WjRXRlpDYVdscU5IRlBRMEZzUVhkblowcE5UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZLZW5aWUNsRXpLMnBWUmpoVWFYZzBaU3Q0YzFoQ1NYcEZPVmd3ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UWpWa1IyaDJZbWs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRHWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSU1dNeVRtOWFWMUl4WWtkVmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMDF0V1RKUFIwVTFUMGRKZWxsdFJYZGFWR2MxVG0xV2EwNXFSVE5hYW1zd1RVZFdhVTU2YXpKT2JWbDVDbGxYVVhwTmVtYzFXbXBCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFXMUNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNhR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9YZGxXRkp2WWpJMGQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFMwSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NIZEZaV2RDTkVGSVdVRXpWREIzWVhOaVNFVlVTbXBIVWpSakNtMVhZek5CY1VwTFdISnFaVkJMTXk5b05IQjVaME00Y0Rkdk5FRkJRVWRGWVZsb01VWm5RVUZDUVUxQlVucENSa0ZwUlVFdlpGb3lNWG95VDNWRVZGUUtOVXRzV2xoeWFHaHBVVlpUVFRNeFYwRXpORmR3WldnelZTOUVkVE5WVlVOSlJtRnNSV1U0ZFVrMlFWcHJTekY0Y1hSdFp6bHFUbFU0VWtaSlJVbzFjUXBXUmtWWlNVWjBhbGgxU2pKTlFXOUhRME54UjFOTk5EbENRVTFFUVRKblFVMUhWVU5OVVVSdFVFeFVVR0ZhUW5GcFNWZzJUME5WTDI1NE5TczVZa1l5Q210VVFYa3lZMmRzVTJocGVEQkRRMjFESzNkcE9XWTVUMjlPU1hsSlJHOTJjMjF6TmxKV05FTk5SazFFVFcweldXVXJRVkZzYUhoYU4zSmlkMHA2UXpJS05pczBVRlp2ZVVrNVNtWXlLelZ1ZUZjM1VYSllTVU5wU25ORU0xcFNXRGROWjNabk0yNVBiRU5CUFQwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1668217885,
          "logIndex": 6906236,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/python/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/python",
      "githubWorkflowSha": "2f68a98b3ba0e896ed617f940eb7966f2ad3389f",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3449088712",
      "sha": "2f68a98b3ba0e896ed617f940eb7966f2ad3389f"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

