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
| `1.2.3-r1` `latest` | `sha256:33683c719945790f7d566b4a389cc8da3748ee66fca7c9a342fd100690d726ef`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:33683c719945790f7d566b4a389cc8da3748ee66fca7c9a342fd100690d726ef) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:33683c719945790f7d566b4a389cc8da3748ee66fca7c9a342fd100690d726ef"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "22a2eea827302c2f30ab27223392ba891c9545d6",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/musl-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDXhU33omMk7ZOLW3ZT5g1ThV45pHerxZW1iRZ8wlHPeQIhAIsxiBTAmxiuzhBHKIi8Xu70uog66Em4C6iuVj2enqFM",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJhNGNiODQ4MTVhMGQxODVjOTZlMjk3MWE4ZDIzMDk3OGQ2ZWIyMDkzNGQ1NDY2YzJmZTRkN2QzZjc5NWJkZWZjIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNBcDhGcCtGYjZDQ1ZadWRnaFJWT29uUEVSZzRDSVQzMHRMdktGSGJsR0VnSWdLT2svSnNrMXcveVR5cXorcm1SSGZ0R0l4K1NnMDJWMVZCRjBCQWRSSkZNPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBla05EUVhvMlowRjNTVUpCWjBsVlNVNHpZV05CVlU1TVVUazFReXM0YjIxNk5tTm5ja1JIVVZWRmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1hoTlJFVXdUbFJGTWxkb1kwNU5ha2w0VFVSSmVFMUVSVEZPVkVVeVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZzU1dGeFVXcENkRlIwY205SlIxSXJUalo0WVZWbWNHSTVVV3MxT1ZCeFdqTmxjbkVLWlVjMVZWUkVNVlJLWTA5NVZWSkJSV3hWVmxNd1VGZElNM2c0TTJOR2VFOVVhMUZpUjFOM1kwOTZTbWhwTDBsRFJVdFBRMEZzTUhkblowcGFUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlY1WlVwYUNtbEJUMEkwSzA5blRGbFVNazlPYmxaa2NYWnhlbkZqZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKbldVUldVakJTUVZGSUwwSkhVWGRaYjFwbllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVRGak1uZDBXa2hzZFZsWE1YQlplVGgxV2pKc01HRklWbWxNTTJSMlkyMTBiV0pIT1ROamVUbDVXbGQ0YkZsWVRteE1ibXhvQ21KWGVFRmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFFYTBkRGFYTkhRVkZSUW1jM09IZEJVVVZGU3pKb01HUklRbnBQYVRoMlpFYzVjbHBYTkhVS1dWZE9NR0ZYT1hWamVUVnVZVmhTYjJSWFNqRmpNbFo1V1RJNWRXUkhWblZrUXpWcVlqSXdkMFpuV1V0TGQxbENRa0ZIUkhaNlFVSkJaMUZKWXpKT2J3cGFWMUl4WWtkVmQwNW5XVXRMZDFsQ1FrRkhSSFo2UVVKQmQxRnZUV3BLYUUxdFZteFpWR2Q1VG5wTmQwMXRUWGxhYWsxM1dWZEplVTU2U1hsTmVrMDFDazF0U21oUFJHdDRXWHByTVU1RVZtdE9ha0ZqUW1kdmNrSm5SVVZCV1U4dlRVRkZSVUpCTlVSamJWWm9aRWRWWjFWdFZuTmFWMFo2V2xSQmMwSm5iM0lLUW1kRlJVRlpUeTlOUVVWR1FrSTFhbUZIUm5CaWJXUXhXVmhLYTB4WGJIUlpWMlJzWTNrNWRHUllUbk5NVjFJMVltMUdkR0ZYVFhkSVVWbExTM2RaUWdwQ1FVZEVkbnBCUWtKblVWQmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFKUjB4Q1oyOXlRbWRGUlVGa1dqVkJaMUZEUWtnd1JXVjNRalZCU0dOQkNrTkhRMU00UTJoVEx6Sm9SakJrUm5KS05GTmpVbGRqV1hKQ1dUbDNlbXBUWW1WaE9FbG5XVEppTTBsQlFVRkhSQ3RFWkVwMWQwRkJRa0ZOUVZORVFrY0tRV2xGUVcxMGJGcHdZM3BoVTBoeWNqVnBkVk5TUVdsR05tRTBPVFJRTjJZM1NHaFhWSGx4UVZSVWVXRjFNakJEU1ZGRWQxaEZhRGxqVjJsa1V5dG9SQXBwWVRoSlJrdGhSVGxoWWpaSE0yNW9iVmR5TkRaVmVEUm9OVkJFU0VSQlMwSm5aM0ZvYTJwUFVGRlJSRUYzVG01QlJFSnJRV3BCZURSNVdGQlJVMVpHQ21oUWNGaFBWRlYyTkU1bk9ESjNaVFpOTW10alZuaEJSRGwzUTNoMFVuVk1ZM0F2TjFreU9YTkdjSGRDTWtSTGRVSk1VVzlUUVc5RFRVaFpUR0lyVkRFS01VOW5aR2R0UVVWQmNHcG1PWFZxTjNwallrWkxTMnBsZEdKV0x6QlNVRkJaVm5Jd1NUSlhabVZ3V0dwNFdVOVBjVzV3YldoVFpraFdRVDA5Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1666316742,
          "logIndex": 5531528,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/musl-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/musl-dynamic",
      "githubWorkflowSha": "22a2eea827302c2f30ab27223392ba891c9545d6",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3294189034",
      "sha": "22a2eea827302c2f30ab27223392ba891c9545d6"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

