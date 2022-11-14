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
| `latest` | `sha256:52ba086e9d5a75028be4712810764c35d2a9d852e10c5eda69100f70139ccf47`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:52ba086e9d5a75028be4712810764c35d2a9d852e10c5eda69100f70139ccf47) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:52ba086e9d5a75028be4712810764c35d2a9d852e10c5eda69100f70139ccf47"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "4d7700981f5e7c40d33a4d633ee8d6fafcb247e5",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIAKlR+WEz8abo6psL1Gd9eCGuyL/ju4PhiT7/+wbvJsbAiEAk84CG1tMGt91hu8eDC7ls6iH3EhtQaqOezX05wFtix8=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI3N2RmNzZmYmYyMzUyODI5ZWQ4YmI4MjdjMGZjZDY1OTM4ODkwNzc3MGM1NGVhNTZhNTc1ZjUyMGU3ZGI3YjUzIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUNtOHFvNERRaW8yb083dEtsVzl1V2d5Ti9iSWt3Qjl5SHBkU215NWJwTVVnSWhBSVFYVXhHZnZscVFlSVk4ME5jb0dER2xwdGlrbzhOSGtHcVZyZ2NyRi9nSSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhla05EUVhwSFowRjNTVUpCWjBsVlRYbE5UblJLTmxoUU0zVXJPVzltV1hwWmJEVklla1ZXVlRVd2QwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlRCTlJFVXhUVVJGZWxkb1kwNU5ha2w0VFZSRk1FMUVTWGROUkVWNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZIZWxOdmFIWTNSbnA0WW1GUFVtSlRVbGgyT1c5MU5GWmhVSE5qTldacFluTlNSM1lLYkVJM1FUQXZWVTVaUkhsaFNqSkhlR2hTVm10R1FXSXdNVTlYUldGSlVsUk9VVkJyV0cwd1dtOW5OR1l6ZWsxbFNYRlBRMEZzUVhkblowcE5UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZXYmtWR0NuZHlNMlZQVkcxamRIVkhWM3AxVjNOWmVFMUlkRlpWZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UWpWa1IyaDJZbWs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRHWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSU1dNeVRtOWFWMUl4WWtkVmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMDVIVVROT2VrRjNUMVJuZUZwcVZteE9NazB3VFVkUmVrMHlSVEJhUkZsNlRUSldiRTlIVVRKYWJVWnRDbGt5U1hsT1JHUnNUbFJCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFXMUNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNhR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9YZGxXRkp2WWpJMGQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFMwSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NIZEZaV2RDTkVGSVdVRXpWREIzWVhOaVNFVlVTbXBIVWpSakNtMVhZek5CY1VwTFdISnFaVkJMTXk5b05IQjVaME00Y0Rkdk5FRkJRVWRGWXpsU2VsaDNRVUZDUVUxQlVucENSa0ZwUlVGNU5tUkRTMXB0ZVZCdFNGTUtVM1JJYlN0SGJXVnVkelF2V1hRek4wOVhjV2wxVW5wMFMwdHJkMjFYT0VOSlIwZGhTbXBHZWl0UlF5dFZlVkJhVDBSSldpdHBVRVpQV0RSU04wODNVZ3ByVlVGalpXUk9aekY1ZHpWTlFXOUhRME54UjFOTk5EbENRVTFFUVRKblFVMUhWVU5OUlZkeU5HRk5kR2h5TkRoUFZuVkhRbE5DVmpWUFIycDNPUzlVQ2t0clJuQjBLemhMUVZWblVHUnlkR2gxTjBsWVNWZ3JLMk5vZGtSM1JEbE9XRmx1ZUdwM1NYaEJVRlpTUzAweFQzcFdjV2x0YzBwVlpVdGlRbkZoU200S1ZGSjVSVEJWYkcwMk5XbEhRMFozVEhkWVJVcDFhalpLUVRoVEx6Z3JXbFp4VW1veE5ucFZkbUYzUFQwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1668390632,
          "logIndex": 7024282,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/python/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/python",
      "githubWorkflowSha": "4d7700981f5e7c40d33a4d633ee8d6fafcb247e5",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3457902804",
      "sha": "4d7700981f5e7c40d33a4d633ee8d6fafcb247e5"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

