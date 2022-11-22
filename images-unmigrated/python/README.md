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
| `latest` | `sha256:076ca7e9088c06a7e204e6d1335bdd5c596a7e4295d9fb302895807cd72cf3c4`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:076ca7e9088c06a7e204e6d1335bdd5c596a7e4295d9fb302895807cd72cf3c4) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `migration-20221118` | `sha256:0012ef5bfc2d6791c962b1cc99cc2c2934cf216ca5937c9eb2a80935c8ad898a`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0012ef5bfc2d6791c962b1cc99cc2c2934cf216ca5937c9eb2a80935c8ad898a) | `amd64` |
| `migration` `migration-20221122` | `sha256:03c5e2fa9276d2e42ceacdb7a523f4f70b9a0311aa775e2faa70b103e6fd90b0`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:03c5e2fa9276d2e42ceacdb7a523f4f70b9a0311aa775e2faa70b103e6fd90b0) | `amd64` |
| `migration-20221119` | `sha256:bd5fb01c0e49167e21f2a4be26a1e58262b391813bed99bb7fd81a1ec2457974`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:bd5fb01c0e49167e21f2a4be26a1e58262b391813bed99bb7fd81a1ec2457974) | `amd64` |
| `migration-20221120` | `sha256:c43a298d7a5442d3a94b2c09a5eb1690e0bc0d82f7bc967409de0e42668541ef`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c43a298d7a5442d3a94b2c09a5eb1690e0bc0d82f7bc967409de0e42668541ef) | `amd64` |
| `migration-20221121` | `sha256:0ccde133cd574742173984fbdc4768d728bcd45d6f0685fc2b961b1647cc27c1`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0ccde133cd574742173984fbdc4768d728bcd45d6f0685fc2b961b1647cc27c1) | `amd64` |


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
        "docker-manifest-digest": "sha256:076ca7e9088c06a7e204e6d1335bdd5c596a7e4295d9fb302895807cd72cf3c4"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "f8cc141d783d66a5edad2841a94b78fc2247334f",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIATHVwXfIdpTFvP+xv254nWxDV89x1XGxo+PxzyZONG6AiACaGY9alDCgYjJLfn5URK9MhFA5Ie+JVZfhHbe26yqZw==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI3MzdjNThlMjFhM2FlMzNiMGI5Njk5YTI2OTU1ZDllYzczYTllZDY1MDE3YzVlMDBmNjkzNzUyYzk5YTU2ODFiIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJR0t5MjFWTXBYR2VZK3JXRUQ2WWN4L1dyRmlQZm9IQWxEWUN0enY3MEM4ckFpRUFnZTJNVmU2SGo5c1MxTXpMdnBMRXhJNFV6S25GREhRU0JsUmszZmdHOEZBPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhWRU5EUVhwRFowRjNTVUpCWjBsVlkxQnBaRWRhYVRBeVRESnZNM0V5V0RSc1ZVTkVkM2wyTTFkSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVU1hsTlJFRjVUV3BCZDFkb1kwNU5ha2w0VFZSSmVVMUVRWHBOYWtGM1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZOZUZZM1RHeHRPRE13T0c0NWFYb3pRa0ZQVTBSUE9XWkVWMmQzTVc5aVVqVlFaMndLVlVGbFNuRnViV2xDYTNKRFQzZzJUVWh6YWtSRVRuSmxXall3WlM5cVkxSTNWREJuVFN0clNqWkZObFpRVWs1c2RFdFBRMEZyT0hkblowcE1UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZoT0ZKcENsRXlOV2x6YVd4RVoyTTRVVFZFZWtoV1Z5c3dPWFpGZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UWpWa1IyaDJZbWs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRHWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSU1dNeVRtOWFWMUl4WWtkVmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMXBxYUdwWmVrVXdUVmRSTTA5RVRtdE9hbHBvVGxkV2ExbFhVWGxQUkZGNFdWUnJNRmxxWXpSYWJVMTVDazFxVVROTmVrMHdXbXBCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFXMUNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNhR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9YZGxXRkp2WWpJMGQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFNrSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NITkZaVkZDTTBGSVZVRXpWREIzWVhOaVNFVlVTbXBIVWpSakNtMVhZek5CY1VwTFdISnFaVkJMTXk5b05IQjVaME00Y0Rkdk5FRkJRVWRGYmt4aFVISkJRVUZDUVUxQlVtcENSVUZwUVcxaE9XSnFLMUZIU0hwNGJGQUtSVk5oTUdvMWRrSnVja2xFUzFGNUwwcGxVemd6WTBkMVJYSnhWRGQzU1dkaVVFaHFXR0ZCUmtKTFkzVmhlblJoVUhwU1JHRmFWR2N2Wm5Wb2FWazJiUXBXTmpSS1VXSmlOMVpCYjNkRFoxbEpTMjlhU1hwcU1FVkJkMDFFV25kQmQxcEJTWGRGVDNaUFJsZ3JjMHgxVlRKWldVOHJSVWhKYkZWRGJIWktVbGczQ2xCMlkwNVlTVEJ3Y0ZFMFdrcEZkbGRxZGxKd05ERlRNa3hzTlZFM1QzbEVaemg1VlVGcVFXVnZRV3g1TUV0b1JXZERRVmhGY0UxMllUQkxSakEyYW1nS1JscHJVMnBwVG5nelQxWjRZelZZVVU4eE5pOXZWbEZSWTBRMFJDdE1abVkyZG5Ob2FEaHJQUW90TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1669076549,
          "logIndex": 7576688,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/python/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/python",
      "githubWorkflowSha": "f8cc141d783d66a5edad2841a94b78fc2247334f",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3519228153",
      "sha": "f8cc141d783d66a5edad2841a94b78fc2247334f"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

