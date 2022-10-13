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
| `1.2.3-r1` `latest` | `sha256:fcf2f679614370d30d2e3d300bb2810edae831cf82533e89db181aa714241908`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:fcf2f679614370d30d2e3d300bb2810edae831cf82533e89db181aa714241908) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:fcf2f679614370d30d2e3d300bb2810edae831cf82533e89db181aa714241908"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "367f0af28656b237bcdea920205823af620f06d6",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/musl-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIB1D9/Bqe/WqedulOJ1cazZwZXkX6PUUN7VyamJy8wQXAiEAp7dtRgxBZYHl1CcK3fcuZ0wwhfyfC+RMvHm3JyuEH/A=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJiZTFjMzhiMzk0Y2E0MzEyZjkzN2NmN2U4ZjkxNjM0MWY5Mzk5ZTYwYzk3OWMxN2FmNzlhNTM3YTY2MGZiM2QyIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRjJ0eUZ5VjZ6cmFRTkpuczNkYlE5V0dTY0d5Z2VrWmpSRU5rRXorTjBUUUFpQk9SWWFYMU9IQWNsWXl1TkpRNlVUL2UvcW8yUWdUYWdjbitPaDB0NW50SFE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpWRU5EUVhwcFowRjNTVUpCWjBsVlJraHdabk0zVHpkVWIxaE9TVU51Tm1obVFYbHJibmwzZDI5bmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhwTlZHdDRUWHBGTlZkb1kwNU5ha2w0VFVSRmVrMVVhM2xOZWtVMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ0YWpNclJURkZNbGx4Y0ZwVVpsazRlV00xZEZrMGNUUklhbG81YW13Mk1FTnRaRVlLTVdWdlpHeEtNRkI1VEVoQ1JVSTRSa0pETW1scmEwWkZWbTFxY0ZoaVEyaDRTbVJHVEhGU09TOUNXa1phZERVeVZUWlBRMEZzWTNkblowcFVUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlYwZFhSSENqZGtOVGx2VlRWa1VWWktlbkZvYjI1QlpTc3hNWEl3ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKbldVUldVakJTUVZGSUwwSkhVWGRaYjFwbllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVRGak1uZDBXa2hzZFZsWE1YQlplVGgxV2pKc01HRklWbWxNTTJSMlkyMTBiV0pIT1ROamVUbDVXbGQ0YkZsWVRteE1ibXhvQ21KWGVFRmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFFYTBkRGFYTkhRVkZSUW1jM09IZEJVVVZGU3pKb01HUklRbnBQYVRoMlpFYzVjbHBYTkhVS1dWZE9NR0ZYT1hWamVUVnVZVmhTYjJSWFNqRmpNbFo1V1RJNWRXUkhWblZrUXpWcVlqSXdkMFZuV1V0TGQxbENRa0ZIUkhaNlFVSkJaMUZGWTBoV2VncGhSRUV5UW1kdmNrSm5SVVZCV1U4dlRVRkZSRUpEWjNwT2FtUnRUVWRHYlUxcVp6Sk9WRnBwVFdwTk0xbHRUbXRhVjBVMVRXcEJlVTFFVlRSTmFrNW9DbHBxV1hsTlIxbDNUbTFSTWsxQ2QwZERhWE5IUVZGUlFtYzNPSGRCVVZGRlJHdE9lVnBYUmpCYVUwSlRXbGQ0YkZsWVRteE5RM2RIUTJselIwRlJVVUlLWnpjNGQwRlJWVVZJYlU1dldWZHNkVm96Vm1oamJWRjBZVmN4YUZveVZucE1NakV4WXpKM2RGcEliSFZaVnpGd1dYcEJaRUpuYjNKQ1owVkZRVmxQTHdwTlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbHJSME5wYzBkQlVWRkNNVzVyUTBKQlNVVmxkMUkxUVVoalFXUlJRVWxaU2t4M0NrdEdUQzloUlZoU01GZHpibWhLZUVaYWVHbHpSbW96UkU5T1NuUTFjbmRwUW1wYWRtTm5RVUZCV1ZCVGR5dDZUVUZCUVVWQmQwSkhUVVZSUTBsR1VWWUtWMll6VFhoM1JTOUZTVk5yVFRWT1NVWXdMMjlsYldkdmVUSXpNRTFJY21reWRrUm1PVWxPY1VGcFFtOVFWRkZFYXpSVlV5ODVTbVpPVTJkWVVXdHVkZ3BLVFZkT2RpczFjRkEyWkZaeGFYTnhiMjkxZEdaVVFVdENaMmR4YUd0cVQxQlJVVVJCZDA1dVFVUkNhMEZxUVd0T1RrMDFkMjB5VlcxclkzZHJjSEF5Q25wRE9YWTVSVFZFZUd4RksxbGpVRmw2ZEhsVVQwTktPRU5qVUVRcmFubDJjVEZsWVVGWVQzSXlRVkJyWW5oSlEwMUdNMVJPZUdkSVprUnZhRGx0TTBrS2JtRkxZVVp3U1VwTE1qSk5hRVF6YURWUGEyUjBiVXAxUjFnM1RHMW9PVVF4ZDNoNlJFNURTRWx4VG1aQk1tUmlibEU5UFFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1665688419,
          "logIndex": 5045706,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/musl-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/musl-dynamic",
      "githubWorkflowSha": "367f0af28656b237bcdea920205823af620f06d6",
      "githubWorkflowTrigger": "push",
      "run_attempt": "2",
      "run_id": "3245005002",
      "sha": "367f0af28656b237bcdea920205823af620f06d6"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

