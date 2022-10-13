# musl-dynamic

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/musl-dynamic/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/musl-dynamic/actions/workflows/release.yaml)

Base image with just enough files to run static binaries!<br/><br/>This image is meant to be used as a base image only, and is otherwise useless. It contains the `alpine-baselayout-data` package from Alpine, which is just a set of data files needed to support glibc and musl static binaries at runtime.<br/><br/>This image can be used with `ko build`, `docker`, etc, but is only suitable for running static binaries.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/musl-dynamic:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `1.2.3-r1` `latest` | `sha256:ed536f49dce522b08db5486965ed50d9cbbd8811ce661fc3e5c0ed11d99af5d5`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ed536f49dce522b08db5486965ed50d9cbbd8811ce661fc3e5c0ed11d99af5d5) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


## Usage

See the [examples/](./examples/) directory for
an example C program and associated Dockerfile
that can be used with this image.


## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/musl-dynamic:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/musl-dynamic:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/musl-dynamic"
      },
      "image": {
        "docker-manifest-digest": "sha256:ed536f49dce522b08db5486965ed50d9cbbd8811ce661fc3e5c0ed11d99af5d5"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "a8bcd0931608bd904140c802499e7cab51729d0f",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/musl-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIAL4HuSXlfni/GhXlSK4qphOehuON0A2+KN6rnt1Tq9+AiEA6Ogg3awKd+hmb3hpVG8qB6zyoZ1LsIWt+27r8691804=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI0NTBmNjc3NGQxYjYxMTI1ZDhjNjU4ZGE1MmQzYWExMjI4ZTcxYzY0Y2ViYjQ2ZDUwNzM1OGVmYjViODE0Y2IyIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJSEQ3MjVGZEIzaVlnYSs5Y2ZFZFE3WmpxMnIzQml1YTc3VFR4RmR6NFdBWEFpRUF4RWNxajlRaEdVZ3VGUG9ZbEJzS0toUE5BYnVucENxYmhBc20vd1FRQTlBPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpla05EUVhweFowRjNTVUpCWjBsVlZ6ZHlSREl2ZDFsdVVXZHliVlI0ZDJOb1NIZHBLMlpvTW5oSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhwTlJHc3dUWHBOTlZkb1kwNU5ha2w0VFVSRmVrMUVhekZOZWswMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ1Y1VzeE5rWnJkMkV5VlRsM1NHOUdXamxWVWxoaVpGbENjWHBVY0RCRFNGSkxhMmtLVGl0NlJqTnFlazB6Wm1oalUwZEdLMjF4VVVWcU5rOTVWbXhzVDNsRU1XZEtaaTlKYlU1TWRGSk9iWFJpVG14R1ZEWlBRMEZzYTNkblowcFdUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZsY1VkVENrcGxSM2xYVmxGU1NGVk9Va3hXYlZKTlR6QnZSblJCZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKbldVUldVakJTUVZGSUwwSkhVWGRaYjFwbllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVRGak1uZDBXa2hzZFZsWE1YQlplVGgxV2pKc01HRklWbWxNTTJSMlkyMTBiV0pIT1ROamVUbDVXbGQ0YkZsWVRteE1ibXhvQ21KWGVFRmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFFYTBkRGFYTkhRVkZSUW1jM09IZEJVVVZGU3pKb01HUklRbnBQYVRoMlpFYzVjbHBYTkhVS1dWZE9NR0ZYT1hWamVUVnVZVmhTYjJSWFNqRmpNbFo1V1RJNWRXUkhWblZrUXpWcVlqSXdkMFZuV1V0TGQxbENRa0ZIUkhaNlFVSkJaMUZGWTBoV2VncGhSRUV5UW1kdmNrSm5SVVZCV1U4dlRVRkZSRUpEYUdoUFIwcHFXa1JCTlUxNlJUSk5SR2hwV2tScmQwNUVSVEJOUjAwMFRVUkpNRTlVYkd4T01rNW9DbGxxVlhoT2VrazFXa1JDYlUxQ2QwZERhWE5IUVZGUlFtYzNPSGRCVVZGRlJHdE9lVnBYUmpCYVUwSlRXbGQ0YkZsWVRteE5RM2RIUTJselIwRlJVVUlLWnpjNGQwRlJWVVZJYlU1dldWZHNkVm96Vm1oamJWRjBZVmN4YUZveVZucE1NakV4WXpKM2RGcEliSFZaVnpGd1dYcEJaRUpuYjNKQ1owVkZRVmxQTHdwTlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbHpSME5wYzBkQlVWRkNNVzVyUTBKQlNVVm1VVkkzUVVoclFXUjNRVWxaU2t4M0NrdEdUQzloUlZoU01GZHpibWhLZUVaYWVHbHpSbW96UkU5T1NuUTFjbmRwUW1wYWRtTm5RVUZCV1ZCUmRXMUtXVUZCUVVWQmQwSkpUVVZaUTBsUlExWUtWM1Y2ZDFSVFpqRlVUVzV3TmpGVWExWjJOMEoyWTBoeWNuVkpkVmhDU2tOVEwxWkxlR3c1TVZkM1NXaEJUek54WVRCS2FWRndNRXBaUzFoUmVtZHFTQXBYZFhoRmFWQkVXSFJKT0hndmFVNDFVa3hRWWtrMldFUk5RVzlIUTBOeFIxTk5ORGxDUVUxRVFUSmpRVTFIVVVOTlNFeFBhR2d4TmxST2VDOXpRMlZsQ2tNdlQwUnJTVmxtVjBwTWJVZG5Na2hITlc1RVVVYzVhMWd6Y25kR2FWUmlUblJNVTNFeU1XTnVNbWhqTTBWR2IwSjNTWGRWVEROcmR5c3lkVU5CYUdvS2VHVk1UVEZRV2pSeWNubE9XR2R4V0haWk9GcGtjbnB4ZERGVlltSklZMDVLUkV3eGNFb3pURTFNVVZWd2NXUjNaWGhGVEFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1665654240,
          "logIndex": 5018591,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/musl-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/musl-dynamic",
      "githubWorkflowSha": "a8bcd0931608bd904140c802499e7cab51729d0f",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3241307060",
      "sha": "a8bcd0931608bd904140c802499e7cab51729d0f"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

