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
| `latest` | `sha256:426590b7747912099cb74c8742694ec549a65f2c9f43f4ab7fdfe74574868b1c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:426590b7747912099cb74c8742694ec549a65f2c9f43f4ab7fdfe74574868b1c) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:426590b7747912099cb74c8742694ec549a65f2c9f43f4ab7fdfe74574868b1c"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "91032ed48d75b95e79102830a3a2bfa8f40a0471",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIDqJgaPUaL9A7MO/W2wx1bIruJCVo/Vd/lD9QHWcWxsOAiBh4HHqxiwvcRpU151OouVmrkkkTB++MOzgUZp3lAcLzg==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjYTZiZThlNWMzNjM3ODI3YTU3MWRmN2FhNzhlYjcyYzAzZjc1NzIwZjIxNGQ0Zjc5MDQwYzJiOTM0NmJkMTZiIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNuTWp6UyszYWY1c2RjaEYzQ0tZTmtOZnVKZldmTlU2UjgvZTVnU0wya2ZBSWdTbGV4RFZBWjlKZWRaZmJsZGIxZUlhVS9uellWcEdVemtzZFZaME9vVG5vPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlSRU5EUVhwSFowRjNTVUpCWjBsVldHRkZhRmRMWkhKRGFHbDVXWGhqUTNkalpVdG1URlpqUWxoRmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlhwTlJFVXdUMVJWTWxkb1kwNU5ha2w0VFZSRmVrMUVSVEZQVkZVeVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVUyUTA1b1UwRmpSRE40YW5NdmJFRkpjWGhwVlcxWmJFNXpaMEl4Wnk5eFZpdHVaa2dLZGtRNE1FaEdZelp1ZFZsd1FXY3dNREEzVUVJck1qbHBTRm8xTlVORGFsWXZjVFZWWkhaR2MxQnNaREpGWkhjMFRuRlBRMEZzUVhkblowcE5UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZKY0ZaTENqY3dPVmxCYW1SSlIybE1VbmdyVmpoVlp6TjVaQ3RCZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UWpWa1IyaDJZbWs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRHWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSU1dNeVRtOWFWMUl4WWtkVmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMDlVUlhkTmVrcHNXa1JSTkZwRVl6RlphbXN4V2xSak5VMVVRWGxQUkUxM1dWUk9hRTF0U20xWlZHaHRDazVFUW1oTlJGRXpUVlJCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFXMUNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNhR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9YZGxXRkp2WWpJMGQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFMwSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NIZEZaV2RDTkVGSVdVRXpWREIzWVhOaVNFVlVTbXBIVWpSakNtMVhZek5CY1VwTFdISnFaVkJMTXk5b05IQjVaME00Y0Rkdk5FRkJRVWRGWW5FelZXWlJRVUZDUVUxQlVucENSa0ZwUVRBek9XSk9ORzB6ZUU5cFkzY0tWMU4wUlVWVGVtODNaVzFCV0dsTWFuTndWekpqVTJoTmFFUlRLMUIzU1doQlVGZG9LM0V2UVhNMVpTOTBWbEpaYTFaWlYxVkJSMGgzYzJKcFpqUnJPQXBzVUZoeVJVcEphalpUZFRKTlFXOUhRME54UjFOTk5EbENRVTFFUVRKclFVMUhXVU5OVVVSaU5uSm1Xa3B5ZDNRMVNXbFhNMnBzUlZaS2JVRjBaRWhRQ2pOVFNsRndNV1pSTkhZd1RVeG1aRkpOWVcxaE1FTnVTbFp4Y0Vjck4xYzJZbk16Um5oMGIwTk5VVU15VUU4dk1Fd3hOVlJDWlhOaFNrWjBNbVJqYzNJS01ERjFOMVJyYVZaeU0xSlJhblpQZWpoaU0wSm9XSGgyWmpoUFJucFBNVEJsUlVoQldtb3hVWE12TUQwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1668304221,
          "logIndex": 6965239,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/python/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/python",
      "githubWorkflowSha": "91032ed48d75b95e79102830a3a2bfa8f40a0471",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3453386396",
      "sha": "91032ed48d75b95e79102830a3a2bfa8f40a0471"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

