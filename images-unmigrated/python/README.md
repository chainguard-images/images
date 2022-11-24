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
| `migration-20221121` | `sha256:0ccde133cd574742173984fbdc4768d728bcd45d6f0685fc2b961b1647cc27c1`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0ccde133cd574742173984fbdc4768d728bcd45d6f0685fc2b961b1647cc27c1) | `amd64` |
| `migration-20221122` | `sha256:2fb92368254ec422ead3d189999868e1c35daf729178681766c4e827dfd6fdf4`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:2fb92368254ec422ead3d189999868e1c35daf729178681766c4e827dfd6fdf4) | `amd64` |
| `migration-20221123` | `sha256:320632b276a7e69039cd9f97bc7172c82a6e9228cf5bb84d5e718a14404f7613`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:320632b276a7e69039cd9f97bc7172c82a6e9228cf5bb84d5e718a14404f7613) | `amd64` |
| `latest` | `sha256:430248f9c907f63d88ef67ee2ce5cf4b94a474bdd9ee3b7fafe90b75925da332`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:430248f9c907f63d88ef67ee2ce5cf4b94a474bdd9ee3b7fafe90b75925da332) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `migration-20221118` | `sha256:0012ef5bfc2d6791c962b1cc99cc2c2934cf216ca5937c9eb2a80935c8ad898a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0012ef5bfc2d6791c962b1cc99cc2c2934cf216ca5937c9eb2a80935c8ad898a) | `amd64` |
| `migration` `migration-20221124` | `sha256:335f4780b3e6b2137db65a0da5df15ab8491af3f2e05c7af00d6f4a212d402b7`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:335f4780b3e6b2137db65a0da5df15ab8491af3f2e05c7af00d6f4a212d402b7) | `amd64` |
| `migration-20221119` | `sha256:bd5fb01c0e49167e21f2a4be26a1e58262b391813bed99bb7fd81a1ec2457974`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:bd5fb01c0e49167e21f2a4be26a1e58262b391813bed99bb7fd81a1ec2457974) | `amd64` |
| `migration-20221120` | `sha256:c43a298d7a5442d3a94b2c09a5eb1690e0bc0d82f7bc967409de0e42668541ef`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c43a298d7a5442d3a94b2c09a5eb1690e0bc0d82f7bc967409de0e42668541ef) | `amd64` |


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
        "docker-manifest-digest": "sha256:430248f9c907f63d88ef67ee2ce5cf4b94a474bdd9ee3b7fafe90b75925da332"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "495c6b1e119987ec94b367217219cc30c1b55fdc",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIGNsDPzlvD1N6/hfO0uutA3GRGGAU1srB2ItHSVlYhi0AiEA9QXlzJX1p+dSMpxdyve8OYfyAHXtvzexw0SSr58ThsU=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIwMTUyMDRlZGRmN2U3NTQ3NGU0YzA1Y2Y3YTUzNDI4Mjg0MzIxNzMzNTc0N2MzZDEyMTZmNjA1NTVkZWI2MzRmIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUQrZ1NrbTliQnAwR2pwZVdBRSsxUUEvbENsbktXSUl4WERRWE1WQlJlSEdnSWhBTytETnRxOUpMMitDbFBHb3d5M3RkZzVXTEZ1VGIwSXhhbmx2bU5YM25TUyIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhha05EUVhwSFowRjNTVUpCWjBsVlUwcHFhMmhOUW1aeFprZHNObUZPYVc5WVUzbzNWRlpzYWpjMGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVU1RCTlJFRjVUV3BCTlZkb1kwNU5ha2w0VFZSSk1FMUVRWHBOYWtFMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ0ZDBKcFpFTXhSRVZ3WTBoVlRHSnJLMWgyVVhJNVIwWlVPVXRVU20xelIwdG1OMFVLU1VKV1JUZ3ZiMDVrY0VKUFZWa3JPWE5FWWpRMVVXTkZZM0JwZEZCTlYzWnBhRUZEZGtkT1RsSmlUWEJhUlVOTGEyRlBRMEZzUVhkblowcE5UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlYzVWtsUUNsVlRTSGxZZEVaVmEwWkJZVGc0WXpacGJXUnVkREpSZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UWpWa1IyaDJZbWs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRHWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSU1dNeVRtOWFWMUl4WWtkVmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMDVFYXpGWmVscHBUVmRWZUUxVWF6VlBSR1JzV1hwck1GbHFUVEpPZWtsNFRucEplRTlYVG1wTmVrSnFDazFYU1RGT1YxcHJXWHBCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFXMUNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNhR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9YZGxXRkp2WWpJMGQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFMwSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NIZEZaV2RDTkVGSVdVRXpWREIzWVhOaVNFVlVTbXBIVWpSakNtMVhZek5CY1VwTFdISnFaVkJMTXk5b05IQjVaME00Y0Rkdk5FRkJRVWRGY0hkT2IwUm5RVUZDUVUxQlVucENSa0ZwUlVFemJsWTVUa3BqYURZM2JWRUtSMmwyTjJSRmRVeFZNekpGVm1ReU16Qk9ja0ZwUjNkdWVVeE5XbkprUVVOSlNEZGhRMWRKVkhKeVpWZEdLMFJCY21aM1VXa3hTREYyZDJaNFFtVk1Sd3BzY3pNeVJtMXFZbmxpU1ZCTlFXOUhRME54UjFOTk5EbENRVTFFUVRKalFVMUhVVU5OUVhOMVlWTXZXR3BqTmpWTGRXRnBUSFkxVkdWU1ZXeFZReTlQQ2pWak4yWjNkRWt4UVhGRVJrcFFhVnAwZDJrM1V6ZG9MMGwxYUN0WFJGbFlNSGgyVVVGUlNYZFlaekJEY2tsWWIwTlJlbXROU0d0NFR6RklkSHBrUkVJS0syazFlbmwwT0ZCTk5scFFVMlZ3VEUxVE1XZHhVRFE1ZG5jdlVsZzJaMmhTUzFwSGRXZEtZZ290TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1669249350,
          "logIndex": 7722730,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/python/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/python",
      "githubWorkflowSha": "495c6b1e119987ec94b367217219cc30c1b55fdc",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3536648277",
      "sha": "495c6b1e119987ec94b367217219cc30c1b55fdc"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

