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
| `1.2.3-r1` `latest` | `sha256:c6a617036de765fade5300b539179419ebe01a04db34701a59455615631790c2`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c6a617036de765fade5300b539179419ebe01a04db34701a59455615631790c2) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:c6a617036de765fade5300b539179419ebe01a04db34701a59455615631790c2"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "594cf969f72f9207e0b9c577ed6e63bd4b4f04ae",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/musl-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCJRrQynxmkY82iGhhuwhhpqFsPHykOn0UxAdpvG01ytAIhAIAdXpbdQR2Rc/RrQQLwH7fxdPiRW4TWbPkFP9KrBwu5",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjYzc0NTc3NmIwNDgzMWY5YWI0NzUyYzYyZTY4MDFjMzY3MWQ2OGY0NzJjNzU5OWIyYjQ1MzUzZWY3MzRhMDI3In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQ0VyT2hYWFNWdGZuai9pUzd0a1JpU2hYTm9vdDU1V3BxdnlrTjBKR1hlcUFpRUE4YlpNZjRZQmpLemZzYkJDUUpCdWFHeWRyNWlSNzVOSTI2R0d2ZkZtOUVVPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBha05EUVhwNVowRjNTVUpCWjBsVlptbEdPRE5JVWtKblIwVjROMlZsUjNsRmExZFlaekkwU1hkSmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1RKTlJFVXhUVVJKZWxkb1kwNU5ha2w0VFVSSk1rMUVTWGROUkVsNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ1WkU1M1JIZFpjV3B5ZEhjMlUyUnhRVkpaTUdsS1EyVnFNbk5PTDFONVRFMUlSRGtLT0hkcmVVWXllVWhLTVVaTlQzTnhUREE1TWxoNVIwSlJUVzFCUTFKYWJWRXJSM0JqT1ZGeEszVmtaek5oZFdSUlNHRlBRMEZzYzNkblowcFlUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZOYzJ4WUNqVlNSekpFYjBwMFdsQTJUV0ZaWVcxWlMwUnBXWFpCZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKbldVUldVakJTUVZGSUwwSkhVWGRaYjFwbllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVRGak1uZDBXa2hzZFZsWE1YQlplVGgxV2pKc01HRklWbWxNTTJSMlkyMTBiV0pIT1ROamVUbDVXbGQ0YkZsWVRteE1ibXhvQ21KWGVFRmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFFYTBkRGFYTkhRVkZSUW1jM09IZEJVVVZGU3pKb01HUklRbnBQYVRoMlpFYzVjbHBYTkhVS1dWZE9NR0ZYT1hWamVUVnVZVmhTYjJSWFNqRmpNbFo1V1RJNWRXUkhWblZrUXpWcVlqSXdkMFpuV1V0TGQxbENRa0ZIUkhaNlFVSkJaMUZKWXpKT2J3cGFWMUl4WWtkVmQwNW5XVXRMZDFsQ1FrRkhSSFo2UVVKQmQxRnZUbFJyTUZreVdUVk9hbXh0VG5wS2JVOVVTWGRPTWxWM1dXcHNhazVVWXpOYVYxRXlDbHBVV1hwWmJWRXdXV3BTYlUxRVVtaGFWRUZqUW1kdmNrSm5SVVZCV1U4dlRVRkZSVUpCTlVSamJWWm9aRWRWWjFWdFZuTmFWMFo2V2xSQmMwSm5iM0lLUW1kRlJVRlpUeTlOUVVWR1FrSTFhbUZIUm5CaWJXUXhXVmhLYTB4WGJIUlpWMlJzWTNrNWRHUllUbk5NVjFJMVltMUdkR0ZYVFhkSVVWbExTM2RaUWdwQ1FVZEVkbnBCUWtKblVWQmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFKUjBwQ1oyOXlRbWRGUlVGa1dqVkJaMUZEUWtoelJXVlJRak5CU0ZWQkNrTkhRMU00UTJoVEx6Sm9SakJrUm5KS05GTmpVbGRqV1hKQ1dUbDNlbXBUWW1WaE9FbG5XVEppTTBsQlFVRkhSVVZtZGtaRmQwRkJRa0ZOUVZKcVFrVUtRV2xDVUhaWE5EbFJkRGREUzJzeEswVkRMMkZQYms1TFJYVkdhVVF2TTJnelZUSkhWRlJEVW00M2NEbENVVWxuUWpOSVdGZDVWblpoTm5rck1YWk1RZ3BFV1VoNVRtWlNkWEp5VTFka1pFUldhMjlCT1cweGJFeE5UbWQzUTJkWlNVdHZXa2w2YWpCRlFYZE5SR0ZCUVhkYVVVbDNSMVJ0VjFScFprOXFORlJqQ21SdlRDODBZblpwWVdjMlRVeG1jVnBGTVd0WFlYUTRlRFYxWjNwRkwyMWFORE4zVDNjeVVtWmhWWGhUTVRneU5rcEVPR05CYWtWQmRVSXliRGs0YTJjS1JWQklkMU54WVVWdk1WZHVXbE1yYlRoWGQydFNWaXQ0ZFdaQ01USkJXRlYxTTJOU04wUlJNa3hSVWtVelkwZFNPRGRrWVN0Q2VHd0tMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1666749057,
          "logIndex": 5873576,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/musl-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/musl-dynamic",
      "githubWorkflowSha": "594cf969f72f9207e0b9c577ed6e63bd4b4f04ae",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3325590865",
      "sha": "594cf969f72f9207e0b9c577ed6e63bd4b4f04ae"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

