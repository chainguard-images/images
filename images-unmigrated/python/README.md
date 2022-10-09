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
| `latest` | `sha256:1c56d860265587072b62ba34e99b447f5cdfa94e8d20af80750dce894932b63c`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:1c56d860265587072b62ba34e99b447f5cdfa94e8d20af80750dce894932b63c) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:1c56d860265587072b62ba34e99b447f5cdfa94e8d20af80750dce894932b63c"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "4c3d44df093dac531c70b95b75acb071cc676ef4",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/python",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIAMCl2TnaaPdRxUoEQzSiibsJVm2LE0H9W/HI6LFXiZ2AiAVm4M/iL5X/f5YOG2SL+xgnrF6r7WHZJCpWtQs9Jm5bw==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI4NzE0NWUwYzNkYjE5ODFjMmEwYzg2MGVkNGQ1MDk5OTc1YWMwNjUzMmRhYTcyYjM2NGRmYTZhYWU5YzEyMzY3In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUURlZDJRa0Zjb2RXVEFsR09Ia3d6dlUxMDFJQ2NJZmZqazNCV1BjY1BwUTFRSWdVYVpzeW10MmxBVUw5ODBlRWZGUklNdG9NSEpHU2NLRlJTUTRYVS9GdEVzPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhla05EUVhwSFowRjNTVUpCWjBsVlQzYzBOVzlZT0ZsWlNIZzRZekUxUnpGRlpEUnhUMWx4WnpscmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUVRWTlJFbDRUa1JWZWxkb1kwNU5ha2w0VFVSQk5VMUVTWGxPUkZWNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZZUjNCdGFEa3ljRzFXZEcxemNsWk9ja0pXT1ZCSmMzSkhNRmRtV1M5UWIwOWlWV2NLVEd0cVUxazJabFZ2Wmxsdk5rSkdlRGhVT1VwbVNVSTRlVnBPZFRSSVNrUkdRakIxVjBSTWRIaFZZVmM0ZGpSSFlUWlBRMEZzUVhkblowcE5UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZJTjNweENrUkdhbmxWT0hCRE1uTmlhbTFsU1VRek0wOVVOMlZOZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGQldVUldVakJTUVZGSUwwSkdOSGRZU1ZwaFlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d6UWpWa1IyaDJZbWs0ZFZveWJEQmhTRlpwVEROa2RtTnRkRzFpUnprelkzazVlVnBYZUd4WldFNXNURzVzYUdKWGVFRmpiVlp0Q21ONU9XOWFWMFpyWTNrNWRGbFhiSFZOUkd0SFEybHpSMEZSVVVKbk56aDNRVkZGUlVzeWFEQmtTRUo2VDJrNGRtUkhPWEphVnpSMVdWZE9NR0ZYT1hVS1kzazFibUZZVW05a1Ywb3hZekpXZVZreU9YVmtSMVoxWkVNMWFtSXlNSGRHWjFsTFMzZFpRa0pCUjBSMmVrRkNRV2RSU1dNeVRtOWFWMUl4WWtkVmR3cE9aMWxMUzNkWlFrSkJSMFIyZWtGQ1FYZFJiMDVIVFhwYVJGRXdXa2RaZDA5VVRtdFpWMDB4VFhwR2FrNTZRbWxQVkZacFRucFdhRmt5U1hkT2VrWnFDbGw2V1ROT2JWWnRUa1JCWTBKbmIzSkNaMFZGUVZsUEwwMUJSVVZDUVRWRVkyMVdhR1JIVldkVmJWWnpXbGRHZWxwVVFXMUNaMjl5UW1kRlJVRlpUeThLVFVGRlJrSkNhR3BoUjBad1ltMWtNVmxZU210TVYyeDBXVmRrYkdONU9YZGxXRkp2WWpJMGQwaFJXVXRMZDFsQ1FrRkhSSFo2UVVKQ1oxRlFZMjFXYlFwamVUbHZXbGRHYTJONU9YUlpWMngxVFVsSFMwSm5iM0pDWjBWRlFXUmFOVUZuVVVOQ1NIZEZaV2RDTkVGSVdVRkRSME5UT0VOb1V5OHlhRVl3WkVaeUNrbzBVMk5TVjJOWmNrSlpPWGQ2YWxOaVpXRTRTV2RaTW1JelNVRkJRVWRFZFc5WldETlJRVUZDUVUxQlVucENSa0ZwUlVGemNtUnViSFV6VDNwcFZDc0tlR1pVTW1aYVUwd3hjV2R5VkVrMFNuaDNNVTV6Y2pKamNFVkVPVmhxVlVOSlJsVk9UWHBpVDFSaFdGbEVUa3R2V0ZaUGNERk1jbGQyU2toVVVqaDRid3BVVGxrMk1tcEtkbUYxYURWTlFXOUhRME54UjFOTk5EbENRVTFFUVRKblFVMUhWVU5OVVVSd1oyNVRkeTlSVjJ3MFJuWnJWMXBpVUd0VU5tMTVWMWg2Q25rdlVTOXNPVlp0ZDBKblVEWlZkbkJRUkZSelpFVnpaaTlLYnpKR2JVZDBXVU5LV2xwTFkwTk5RMmN5VlhwSGJrNWFjM05vT1VWUGNuWmxPWFpYUmpZS1pUUjNRVmh0ZW5Gak5EbEZWa05ZTkRodldHVXJiRFJxUVhaYWFXbzBUVEkyTjJWUWJFTlNTV0pCUFQwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1665281739,
          "logIndex": 4727683,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/python/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/python",
      "githubWorkflowSha": "4c3d44df093dac531c70b95b75acb071cc676ef4",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3212559119",
      "sha": "4c3d44df093dac531c70b95b75acb071cc676ef4"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

