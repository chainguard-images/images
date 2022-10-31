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
| `1.2.3-r1` `latest` | `sha256:15cf7de1bb313e5960ec4f733fe8fb1d5c49f91a4c2bf0e1ed242b87ea78a806`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:15cf7de1bb313e5960ec4f733fe8fb1d5c49f91a4c2bf0e1ed242b87ea78a806) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:15cf7de1bb313e5960ec4f733fe8fb1d5c49f91a4c2bf0e1ed242b87ea78a806"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "5a93a8a23d4107abdd403ff65c7af64f7be81565",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/musl-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQC/1G3290s3Gs1dT3SHlcJWIbVzKexiRqpMU0kKoRFvQwIhAKdkWKB/k8uSLUbFAeGHo+CPv/XyUQyZt1uXF01ffxL6",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJlNzEzYmVkZTU1ZjVhY2FlOTMwY2I3ZTRlZDhiYzJlNjRmYjMzZWE5NmQyYmMwZmZkODhiMzc1ODRmYmI1NjQ5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNkMXRzLzlzVDdKdWkzT05Td0tvY3F5cHF0NTZWL0tUSkhYY1ZDbmpIUllBSWdNWWVGejNJTFllNzJIT0p6dG40QWtEUUQwNWxNbW93WkYzckJ0bjRrZWtJPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBla05EUVhveVowRjNTVUpCWjBsVlJUa3ZPSGt3Um14bVUxcEpja3BtYTNWQ1JsRlVVSGRqYkN0TmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFVFhoTlJFVXhUMVJKZWxkb1kwNU5ha2w0VFVSTmVFMUVTWGRQVkVsNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZpZEZWNGRsSkdjR3QxVkVjeVQyUndaR0pOU0ZCNU0zQlVUbHAyVlZSQ2RVdFBiMlVLUzBSRGJWY3lUVWhHVjJSTFkwVnJSVmhVZWxwblVIbFpRV1I0Y1c5Uk5WWkpZMjFhVm0xak9XZDZkRFJIYW14Q2MyRlBRMEZzZDNkblowcFpUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlV4TUdWaUNpOHpOa1pTVjFkU2QwUkpjVkZNUVdKc1MxaFFkWHBSZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKbldVUldVakJTUVZGSUwwSkhVWGRaYjFwbllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVRGak1uZDBXa2hzZFZsWE1YQlplVGgxV2pKc01HRklWbWxNTTJSMlkyMTBiV0pIT1ROamVUbDVXbGQ0YkZsWVRteE1ibXhvQ21KWGVFRmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFFYTBkRGFYTkhRVkZSUW1jM09IZEJVVVZGU3pKb01HUklRbnBQYVRoMlpFYzVjbHBYTkhVS1dWZE9NR0ZYT1hWamVUVnVZVmhTYjJSWFNqRmpNbFo1V1RJNWRXUkhWblZrUXpWcVlqSXdkMFpuV1V0TGQxbENRa0ZIUkhaNlFVSkJaMUZKWXpKT2J3cGFWMUl4WWtkVmQwNW5XVXRMZDFsQ1FrRkhSSFo2UVVKQmQxRnZUbGRGTlUweVJUUlpWRWw2V2tSUmVFMUVaR2haYlZKclRrUkJlbHB0V1RKT1YwMHpDbGxYV1RKT1Ixa3pXVzFWTkUxVVZUSk9WRUZqUW1kdmNrSm5SVVZCV1U4dlRVRkZSVUpCTlVSamJWWm9aRWRWWjFWdFZuTmFWMFo2V2xSQmMwSm5iM0lLUW1kRlJVRlpUeTlOUVVWR1FrSTFhbUZIUm5CaWJXUXhXVmhLYTB4WGJIUlpWMlJzWTNrNWRHUllUbk5NVjFJMVltMUdkR0ZYVFhkSVVWbExTM2RaUWdwQ1FVZEVkbnBCUWtKblVWQmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFKUjB0Q1oyOXlRbWRGUlVGa1dqVkJaMUZEUWtoM1JXVm5RalJCU0ZsQkNrTkhRMU00UTJoVEx6Sm9SakJrUm5KS05GTmpVbGRqV1hKQ1dUbDNlbXBUWW1WaE9FbG5XVEppTTBsQlFVRkhSVXM0VUU5T1owRkJRa0ZOUVZKNlFrWUtRV2xCZUcxVU1VcE5lRVJ1YUVvMFZ5dGlObXBYVEdoTWRVbGpOVlZJTkdGRmIwOVpkMmRRVFRkdVNHaFNkMGxvUVU1cVQycFVkQzgyTUZkTlVHbDVXZ3BEZGxoeE1YUmxlR3BCTm5GUmRWSkZTREZGV1RWMFIyMXBWbGc0VFVGdlIwTkRjVWRUVFRRNVFrRk5SRUV5WjBGTlIxVkRUVkZEWm1SSFZXMDNZMjVWQ2xKUFpuUTViMDFSWVRaRU1XaEpWaXRQVGxSdFNGSk9PRE5pWm5WMFUyUXZkVTVhV1dVM09WaE5kR3BEVmtkbWJWbE9hekpPVTBsRFRVZE5Wa3QxYWtZS1FtSXJNM1pFVTFGUFlXRjNNekl4YWtGcVJGZE1hakV6VW1aTmEzTXdOR3BPYldkVU9FSlVOamd4VWpoM04zQlNNREpVWkRGU1RrcE9RVDA5Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1667181586,
          "logIndex": 6192771,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/musl-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/musl-dynamic",
      "githubWorkflowSha": "5a93a8a23d4107abdd403ff65c7af64f7be81565",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3358005863",
      "sha": "5a93a8a23d4107abdd403ff65c7af64f7be81565"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

