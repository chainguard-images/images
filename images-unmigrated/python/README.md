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
| `latest` | `sha256:ff7355f5e39c711a3787c7fd7168c0692f26052ce41818af9ff16db9b04d3d95`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ff7355f5e39c711a3787c7fd7168c0692f26052ce41818af9ff16db9b04d3d95) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `migration-20221118` | `sha256:0012ef5bfc2d6791c962b1cc99cc2c2934cf216ca5937c9eb2a80935c8ad898a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0012ef5bfc2d6791c962b1cc99cc2c2934cf216ca5937c9eb2a80935c8ad898a) | `amd64` |
| `migration` `migration-20221120` | `sha256:c43a298d7a5442d3a94b2c09a5eb1690e0bc0d82f7bc967409de0e42668541ef`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c43a298d7a5442d3a94b2c09a5eb1690e0bc0d82f7bc967409de0e42668541ef) | `amd64` |
| `migration-20221119` | `sha256:bd5fb01c0e49167e21f2a4be26a1e58262b391813bed99bb7fd81a1ec2457974`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:bd5fb01c0e49167e21f2a4be26a1e58262b391813bed99bb7fd81a1ec2457974) | `amd64` |


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
        "docker-manifest-digest": "sha256:ff7355f5e39c711a3787c7fd7168c0692f26052ce41818af9ff16db9b04d3d95"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "ba7023cd88198c3ef384ca88f11b37b94ed54af6",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCICLzwUXcSZ/BqWm4YUdCT+lkhGXF62L3ynoSTPqu5KEmAiAHZufxHWh3t6UNn0cxl9DBzG46vVN8PfYnrCls9gLQ0A==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJkODQ1MTQyYTc0ZDNiMzYxNDg1NjBlMjM5MDc5Mjc5M2FiMmQ1MzVmNGQ0NmZkYTZkMjBkNzViOGZkMjgwYzVkIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJR1htYUpuL0xpYyszV0c0SHl5Umd5V0lwdXdjT2dqdysyVVUrUGlJaEFaVEFpRUEvK2hRSmFKajZITTZSTVVjbG1nZWxUalpwZUZHQWhwWEMyTlVsQjYzaXBnPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhla05EUVhwRFowRjNTVUpCWjBsVlpEaFlTQzlxWm5CTU9TdHpjMFl3VEdoYVRtOUJTVmRXYjBGdmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVU1hoTlJFVXdUMFJWTTFkb1kwNU5ha2w0VFZSSmVFMUVSVEZQUkZVelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZSYlV3eWVsSTFjblo1WTBGa1NIZzJObVJUVldKUE56VjVZV05yWWxKcFNXZHNVSGNLTDFCR1MxbDVPSE5oWnpBNFJIVlRZbTE0WW5SbVV6VlZUbUo2YzIxdWVrVkxRVVV3VTBObk5GbHllR3d5WVZaSlJYRlBRMEZyT0hkblowcE1UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZYY25OVENtSkdla2RzVUVaWFZrbDFVM1p5TUZVdmFXMDNXWE5yZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UWpWa1IyaDJZbWs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRHWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSU1dNeVRtOWFWMUl4WWtkVmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMWx0UlROTlJFbDZXVEpSTkU5RVJUVlBSMDE2V2xkWmVrOUVVbXBaVkdjMFdtcEZlRmxxVFROWmFtc3dDbHBYVVRGT1IwWnRUbXBCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFXMUNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNhR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9YZGxXRkp2WWpJMGQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFNrSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NITkZaVkZDTTBGSVZVRXpWREIzWVhOaVNFVlVTbXBIVWpSakNtMVhZek5CY1VwTFdISnFaVkJMTXk5b05IQjVaME00Y0Rkdk5FRkJRVWRGYkRrdlRqVlJRVUZDUVUxQlVtcENSVUZwUVU4dk1qUmtSbkZJYjBnMWF6SUtUMmd2YVZSTFUzTm9ZMWhJTUd3eWMzUlhVR2xQUldsTmJVRnpNRE5uU1dkRlFrVkxTbE5hTW5OelVqSnRZbU5aTUVZeGNHa3lVWEY0WkhWalRYUkhhZ3BRWm1sTU5FczRkVlpPTUhkRFoxbEpTMjlhU1hwcU1FVkJkMDFFWVZGQmQxcG5TWGhCVGpkSll6ZzVRbTU1VVdOTEsxVlJTa05hTWt4Sk5YWk5lVGc0Q2pNMVMyeFFTbkZtYlhCblZVRnRUelp4TTBjNU9YZEpRMVpyUVROcmVuTXZTMjlUY21SUlNYaEJUVkpoY3pkS1NVSm1NekJoUkVOQlJXOUxibFUyV1hvS1NWZDFlRlI0WkV0dmFURjVWRGRDT0VGVVdtRTFWVU5ZYld4eVMwdEJSbVF5VFdJMVJuSjJUR3RCUFQwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1668995362,
          "logIndex": 7509974,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/python/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/python",
      "githubWorkflowSha": "ba7023cd88198c3ef384ca88f11b37b94ed54af6",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3510774443",
      "sha": "ba7023cd88198c3ef384ca88f11b37b94ed54af6"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

