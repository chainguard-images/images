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
| `latest` | `sha256:1319d580c12996063a8ab04d1a28946484c52b27a097edbbed253f3389ef21fe`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:1319d580c12996063a8ab04d1a28946484c52b27a097edbbed253f3389ef21fe) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:1319d580c12996063a8ab04d1a28946484c52b27a097edbbed253f3389ef21fe"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "ea2eadb5e6d702667bb4a1cc4c457c31a9f096ea",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIACLTi646LIivUFJNHuvAlk3iROFOBZcm20Bt6H/IkI9AiEA9zeuQ/7semUYIERxVZuM/UiWmdU2aapGrOYsbXz4a8E=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIyOThjYmRmZTcwNjE5ZjJmZjRmZDVhOWZiOTJjMjFlZjRkMzUwODg0NjBmMGJiNjM0YWMyZTI0OWM4ZTJjY2MzIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQjRacStCYkZnbVB1UXp0YURKanZ6d2M1OFg2LzBzRlRVcldsRlVZY2ZLeUFpQWhCWUltQTlkcUEwdUZRRkFDSUEwc0VsS2phY0pDMy9yblJoM0FHTXN5TlE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhla05EUVhwSFowRjNTVUpCWjBsVlVrMHhSRm80YUVreWNGcHRPRlJoYTFsTU5sZEVTV1F3WTA1dmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRSTlJFVXhUV3BCTkZkb1kwNU5ha2w0VFZSQk5FMUVTWGROYWtFMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYxUm1WM09FSjJlRUl2VWxWQlRYTjRWRmMyVWtkSGJYbEhhbFY0Y1VSUU5VUjFibllLU25JM2N6azJVRkZRZW5seFJVdFpWV2RFVGsxRFMwaHFaak5zY1hKQ00yRlFiV3d2VFdOdldXeHhObkJoWjNnMldHRlBRMEZzUVhkblowcE5UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZRZUhCS0NrVnllQ3RNZHpWaFIzaDVNMFJtVGpCSE0zbFZkMlpKZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UWpWa1IyaDJZbWs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRHWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSU1dNeVRtOWFWMUl4WWtkVmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMXBYUlhsYVYwWnJXV3BXYkU1dFVUTk5SRWt5VG1wa2FWbHFVbWhOVjA1cVRrZE5NRTVVWkdwTmVrWm9DazlYV1hkUFZGcHNXVlJCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFXMUNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNhR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9YZGxXRkp2WWpJMGQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFMwSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NIZEZaV2RDTkVGSVdVRXpWREIzWVhOaVNFVlVTbXBIVWpSakNtMVhZek5CY1VwTFdISnFaVkJMTXk5b05IQjVaME00Y0Rkdk5FRkJRVWRGVmxCQlRFNTNRVUZDUVUxQlVucENSa0ZwUlVFME1tOVpNMnBMTmpWQ00zUUtVRGhHYkhCM1pHbGpjMVJYZEhaNlJIRmtlbFF5TDA1SVRrZEVZWGtyUVVOSlIwUm1Za1ozU1U5QmFpdHFjR1V6UWpKNFVEUjNSMUo2Tld4WGQwVXpWUW96YTBkc1JWZHRVbEJIZDNKTlFXOUhRME54UjFOTk5EbENRVTFFUVRKblFVMUhWVU5OVVVOQlNrcGFTUzlMV2s1S1oxZFRVRWRUTWtRNVNqUmtZVTFCQ25keFN6ZDFjR3N5ZWxRMWRubzVaR05GVWtaNFl6aFlXRkEwV0c1dlFtMVdTVkZSUW5JNWQwTk5Sa2RrYkZsT2VFZHpPVGs1T0dGNGNVOWhaekpPVFhFS2VubHhNVEpqWXpoaFNqTkJVeTlSWjJWMlltdGFhSGR1Y0c5MlIwSnZTUzl4VXpSVFF6ZE9jazVuUFQwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1667872362,
          "logIndex": 6705030,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/python/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/python",
      "githubWorkflowSha": "ea2eadb5e6d702667bb4a1cc4c457c31a9f096ea",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3415680844",
      "sha": "ea2eadb5e6d702667bb4a1cc4c457c31a9f096ea"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

