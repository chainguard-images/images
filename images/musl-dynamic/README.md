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
| `1.2.3-r2` `latest` | `sha256:53c5e3beb61ba6518b238d87cf1b89db72700aa49273ebb8e583ecccbc976ed7`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:53c5e3beb61ba6518b238d87cf1b89db72700aa49273ebb8e583ecccbc976ed7) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.2.3-r1` | `sha256:d90edc1058857946aa925234d35d1eb01d274c1645050ef55804adda1276f990`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d90edc1058857946aa925234d35d1eb01d274c1645050ef55804adda1276f990) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:53c5e3beb61ba6518b238d87cf1b89db72700aa49273ebb8e583ecccbc976ed7"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "2f4dd6dca3a4090be0d2c419c83f239d400ffd53",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/musl-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCD0a9gqoxLaA/LRkoMMv1qr/J6WSZH/UJySBV04gEw3gIhAJAt6e4R42Rh+j80YdPlViGJjE0hcVNb0Dqpd7huEm7c",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjYWQ3YjFmNWM0NjIxMmQzNDdlYzljYmQ5ZWFlNzYzMGE1NWJlNDM5MmZjZjE5MDhiMDRlOTJhMWM0YzQ3NDNlIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRHdHNDJYZlc0N285WlhVYW91emduKzFWZmdLNWp4MWpCaTZyRWRWQkRqVEFpRUF2ZjZ6SGVDdnB4S0kwRHpHbmZkV1VZTDNBZFdRUmRIWmg3Y3J1NWxLRTJrPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnpla05EUVhwdFowRjNTVUpCWjBsVlRYZElNbUk1TUdsYWIzTk9WazVLTVZKbE5qZFJNemxzT1M5SmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRSTlZFRXhUVVJGTTFkb1kwNU5ha2w0VFZSQk5FMVVSWGROUkVVelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVV6VTBkV1dtUm1OUzkxWVZKRlZtWXpMeko2UWtaRVNtRnNaMXBRU0VFd2QxVkZhRE1LZVVOWU4wTlFkbVpIT0ZaWE1qaFVOV1J2ZGpKTU5EWm1TSFZpVnpsVVNWQTFTRzl1UzBkaFptdFNZemhQY0VJcmJtRlBRMEZzWjNkblowcFZUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlY2VWt0TkNuVlRkVXhUYTA1cFowRnFUbVpLVG1aeVNubFJXRGhKZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKbldVUldVakJTUVZGSUwwSkhVWGRaYjFwbllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVRGak1uZDBXa2hzZFZsWE1YQlplVGgxV2pKc01HRklWbWxNTTJSMlkyMTBiV0pIT1ROamVUbDVXbGQ0YkZsWVRteE1ibXhvQ21KWGVFRmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFFYTBkRGFYTkhRVkZSUW1jM09IZEJVVVZGU3pKb01HUklRbnBQYVRoMlpFYzVjbHBYTkhVS1dWZE9NR0ZYT1hWamVUVnVZVmhTYjJSWFNqRmpNbFo1V1RJNWRXUkhWblZrUXpWcVlqSXdkMFZuV1V0TGQxbENRa0ZIUkhaNlFVSkJaMUZGWTBoV2VncGhSRUV5UW1kdmNrSm5SVVZCV1U4dlRVRkZSRUpEWjNsYWFsSnJXa1JhYTFreVJYcFpWRkYzVDFSQ2FWcFVRbXROYlUwd1RWUnNhazlFVG0xTmFrMDFDbHBFVVhkTlIxcHRXa1JWZWsxQ2QwZERhWE5IUVZGUlFtYzNPSGRCVVZGRlJHdE9lVnBYUmpCYVUwSlRXbGQ0YkZsWVRteE5RM2RIUTJselIwRlJVVUlLWnpjNGQwRlJWVVZJYlU1dldWZHNkVm96Vm1oamJWRjBZVmN4YUZveVZucE1NakV4WXpKM2RGcEliSFZaVnpGd1dYcEJaRUpuYjNKQ1owVkZRVmxQTHdwTlFVVkhRa0U1ZVZwWFducE1NbWhzV1ZkU2Vrd3lNV2hoVnpSM1oxbHZSME5wYzBkQlVWRkNNVzVyUTBKQlNVVm1RVkkyUVVoblFXUm5SR1JRVkVKeENuaHpZMUpOYlUxYVNHaDVXbHA2WTBOdmEzQmxkVTQwT0hKbUswaHBia3RCVEhsdWRXcG5RVUZCV1ZKWE0weDVORUZCUVVWQmQwSklUVVZWUTBsRFV6QUtNa3gyTVVsQmFrRjNhRXgxTTFsSlZIWkdhR2RhYlZRdmVFbFBXbVZTVmxRMU5IcHJPRUZITWtGcFJVRjNZWGcxT1RSMFpta3lVMlIwTVU5cWFFbHVZd280Y1RSMGVtOUJWbkEyT1hoT2FXUjJaVU5MYVZGeFozZERaMWxKUzI5YVNYcHFNRVZCZDAxRVlVRkJkMXBSU1hkWlprcHBaRlJZY0hCTVRqUjJLMkpMQ2twUlVYQXZibmhQWkVGeVYwOWpUaTlNV2tOaWExZEthRVJHT0RsaWFrUXdlbmx5V0ZvNFRFMWhSRkp3T0dnMGRrRnFSVUV4UVZseFNGSnJaMWxoTjNNS2NrSklaMVpQTm1sR2FVZEZhek0yWlZreVFWTm5UVE56Y0ZKM2VFY3ZVMDFWZWtKS2JqQTRTV1JSUTFReVRIaFBZMnBvTVFvdExTMHRMVVZPUkNCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2c9PSJ9fX19",
          "integratedTime": 1667904644,
          "logIndex": 6721198,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/musl-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/musl-dynamic",
      "githubWorkflowSha": "2f4dd6dca3a4090be0d2c419c83f239d400ffd53",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3418683791",
      "sha": "2f4dd6dca3a4090be0d2c419c83f239d400ffd53"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

