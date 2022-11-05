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
| `1.2.3-r2` `latest` | `sha256:411c14b0b68e5a7fb5c331a2f2c983e03bb74ad931f8a9243317468a680f5e20`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:411c14b0b68e5a7fb5c331a2f2c983e03bb74ad931f8a9243317468a680f5e20) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
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
        "docker-manifest-digest": "sha256:411c14b0b68e5a7fb5c331a2f2c983e03bb74ad931f8a9243317468a680f5e20"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "b23a699801e8b588043590862b1d8eb5b47daadf",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/musl-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQD4DF6bS8AQ+pILRMzoD5csm+s07zNWji4iymBcRYzzzQIgT+w9lC1FUwSSLvK/Bpim9UHn3uTa7vrJJrPHinviUS4=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIzOWJiMTk4N2IwMDFhYzgxZTRlYTUzODYwZjAxOTc5YzM2YThjZWFmOTk5NTA2OWUwMWQwNDVjZTAxNzRkNmQwIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURzM1BTa245RWtMcFhlb3UvNXZZOFNoR1VTS0FzZG9CQ1VwYmF0UHR6Ty93SWhBUHRsTFY2enQ1dnZOSEd3WldhTU5TQVFNSGZadG5Mc092WG14SldFVCswZiIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBla05EUVhvMlowRjNTVUpCWjBsVlYxaEdPWFYzYmsxT1RWbFVlWFppYkdWR0wxSllRVlJvWWpjMGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRGTlJFVXdUV3BKTlZkb1kwNU5ha2w0VFZSQk1VMUVSVEZOYWtrMVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZDTWxNeVVWSlFjekJ0VGpSdFkwYzVaVXROVXl0Q1pqVTNSVk00WkZSTlRFRkdTM1VLUXpnNFZuSlFhVU5TY2xWTWFqSndlbFk1WkdOdmFtTnNPVzVQYldkbFpIbGFkVE5LTkdzdlJHOVZWekl3TVRaU1ZYRlBRMEZzTUhkblowcGFUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZzSzFkVENsbzNSRXBoYTNOMWVtcEpTSEphV1dOb1p5dHZhM0J2ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKbldVUldVakJTUVZGSUwwSkhVWGRaYjFwbllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVRGak1uZDBXa2hzZFZsWE1YQlplVGgxV2pKc01HRklWbWxNTTJSMlkyMTBiV0pIT1ROamVUbDVXbGQ0YkZsWVRteE1ibXhvQ21KWGVFRmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFFYTBkRGFYTkhRVkZSUW1jM09IZEJVVVZGU3pKb01HUklRbnBQYVRoMlpFYzVjbHBYTkhVS1dWZE9NR0ZYT1hWamVUVnVZVmhTYjJSWFNqRmpNbFo1V1RJNWRXUkhWblZrUXpWcVlqSXdkMFpuV1V0TGQxbENRa0ZIUkhaNlFVSkJaMUZKWXpKT2J3cGFWMUl4WWtkVmQwNW5XVXRMZDFsQ1FrRkhSSFo2UVVKQmQxRnZXV3BKZWxsVVdUVlBWR2QzVFZkVk5GbHFWVFJQUkVFd1RYcFZOVTFFWnpKTmJVbDRDbHBFYUd4WmFsWnBUa1JrYTFsWFJtdGFha0ZqUW1kdmNrSm5SVVZCV1U4dlRVRkZSVUpCTlVSamJWWm9aRWRWWjFWdFZuTmFWMFo2V2xSQmMwSm5iM0lLUW1kRlJVRlpUeTlOUVVWR1FrSTFhbUZIUm5CaWJXUXhXVmhLYTB4WGJIUlpWMlJzWTNrNWRHUllUbk5NVjFJMVltMUdkR0ZYVFhkSVVWbExTM2RaUWdwQ1FVZEVkbnBCUWtKblVWQmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFKUjB4Q1oyOXlRbWRGUlVGa1dqVkJaMUZEUWtnd1JXVjNRalZCU0dOQkNqTlVNSGRoYzJKSVJWUktha2RTTkdOdFYyTXpRWEZLUzFoeWFtVlFTek12YURSd2VXZERPSEEzYnpSQlFVRkhSVkpZVVdwamQwRkJRa0ZOUVZORVFrY0tRV2xGUVROS05EQlBPV2hIU1VwTmJuZGpaVTl6YUVrMmIzRXJkME5wTjJ4dVEyRTFkMmR3ZFU5VFkyazFhMFZEU1ZGRE4wWnlLMGt3YjNaU05GQnNjd3BKVXl0cVFXbGFNVlZ5T0RWVlMyOUVRWEZZZG1seU1qSmlkRFZ0ZEhwQlMwSm5aM0ZvYTJwUFVGRlJSRUYzVG01QlJFSnJRV3BDYzFCNk1pdDJWRWh3Q25oWlZFTllkV2Q1WjNsa00zQnVUMlZJYVhJeldtVmFOVGd4Y1cxSGJWVjZWalprVURkeGRrMWtOMjF1U1U1MFpFVlNiM0k0UlRSRFRVSjNlVWgwVkdFS1YzaHhVa2g0VmxwT2RXSldjMjgzVmxRdlpsTlhXRXR0Y2pkdVlsZEpNMnQySzIxNVlrSnBabGw0WkdGTk9WbHBWVXBPVW5wcGMxaFlRVDA5Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1667612575,
          "logIndex": 6531186,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/musl-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/musl-dynamic",
      "githubWorkflowSha": "b23a699801e8b588043590862b1d8eb5b47daadf",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3398197382",
      "sha": "b23a699801e8b588043590862b1d8eb5b47daadf"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

