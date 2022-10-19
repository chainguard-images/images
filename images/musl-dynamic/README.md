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
| `1.2.3-r1` `latest` | `sha256:ecfd17c8a53a745f1a77234bd33a8d60961517162fe45376a4ad05a77aeb1f25`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ecfd17c8a53a745f1a77234bd33a8d60961517162fe45376a4ad05a77aeb1f25) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:ecfd17c8a53a745f1a77234bd33a8d60961517162fe45376a4ad05a77aeb1f25"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "dd147c9bfc529a82607df2dd6c16d89f4d35898b",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/musl-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIBst68I6lY5aOXHXmc36Kz/CtG+YGsxeqOcLcZi6G5QQAiBns1fBXxxJVXKHpCx09yblzLbhpxF4XwCGGokoMIYS6Q==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjMzRjNjMzNWY1ZjdhMWIwYWJlZDU5MDIzYzExZTkxZjE2NzljNDUwMjRmYmJiYzBmNzNlMTBmNjY1OTYxMjFlIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRi93SnltWEg3Q1docktTbTBrUC9WQzNpcHpIa2ZBaldqaGg2NCtKajZTUUFpQXhwVHJDdlJuZHI1T3BrU1A4MWpqMmVzRm1kbHltSm55V3R3bnU2VSswZGc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBla05EUVhveVowRjNTVUpCWjBsVlEzZHNVbmd3ZG5wMVQxZElUVGhRYTJoVVJFNWFLMlF5TlhKamQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlRWTlJFbDNUVlJGTWxkb1kwNU5ha2w0VFVSRk5VMUVTWGhOVkVVeVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVU1Y2toVFpXWjZOMmhQTkRFM1dFNHJaMmxaTkhwSVozUnVRVmhQVlRBMEt6VlpRbTBLWTNocWJsWjNhSFV2YkZGTk1XbGhVa0Z3UlZNNFpXMHZkVkl3UzBoRmQyYzVhVFZUYkRsSFkyVjBhRXh2UlZGVlowdFBRMEZzZDNkblowcFpUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZDTlhwVENtVlRjRUUwVVRGbVlUaG5LMUkwT0ZBeFF5ODJRMFZKZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKbldVUldVakJTUVZGSUwwSkhVWGRaYjFwbllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVRGak1uZDBXa2hzZFZsWE1YQlplVGgxV2pKc01HRklWbWxNTTJSMlkyMTBiV0pIT1ROamVUbDVXbGQ0YkZsWVRteE1ibXhvQ21KWGVFRmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFFYTBkRGFYTkhRVkZSUW1jM09IZEJVVVZGU3pKb01HUklRbnBQYVRoMlpFYzVjbHBYTkhVS1dWZE9NR0ZYT1hWamVUVnVZVmhTYjJSWFNqRmpNbFo1V1RJNWRXUkhWblZrUXpWcVlqSXdkMFpuV1V0TGQxbENRa0ZIUkhaNlFVSkJaMUZKWXpKT2J3cGFWMUl4WWtkVmQwNW5XVXRMZDFsQ1FrRkhSSFo2UVVKQmQxRnZXa2RSZUU1RVpHcFBWMHB0V1hwVmVVOVhSVFJOYWxsM1RqSlNiVTF0VW10T2JVMTRDazV0VVRSUFYxa3dXa1JOTVU5RWF6Ulpha0ZqUW1kdmNrSm5SVVZCV1U4dlRVRkZSVUpCTlVSamJWWm9aRWRWWjFWdFZuTmFWMFo2V2xSQmMwSm5iM0lLUW1kRlJVRlpUeTlOUVVWR1FrSTFhbUZIUm5CaWJXUXhXVmhLYTB4WGJIUlpWMlJzWTNrNWRHUllUbk5NVjFJMVltMUdkR0ZYVFhkSVVWbExTM2RaUWdwQ1FVZEVkbnBCUWtKblVWQmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFKUjB0Q1oyOXlRbWRGUlVGa1dqVkJaMUZEUWtoM1JXVm5RalJCU0ZsQkNrTkhRMU00UTJoVEx6Sm9SakJrUm5KS05GTmpVbGRqV1hKQ1dUbDNlbXBUWW1WaE9FbG5XVEppTTBsQlFVRkhSRGRtYXpKdFowRkJRa0ZOUVZKNlFrWUtRV2xCUm1OVmFVSXdjVWszZERGc1EzVTNWazlRVG0xclMwOXdjbkF3TTNZckwwSTRabEpXUkd3M1NFcGhVVWxvUVVrcldHeHFRbWxZVlVOVFFsRmplUW92TkZwd09XVnNNMDVDYTNaM1ZtNUtVbmRqV0ZkT2JYWllkU3N5VFVGdlIwTkRjVWRUVFRRNVFrRk5SRUV5WjBGTlIxVkRUVkZFVlV4cE1tNDVTVGtyQ2toU1dWUjRkbXR6TTFneWJYbDBhWEJqYXpOT09FNVFOME5VZGtWRFprUnZOVzlFWlRCVU1VVnpZekF2WTJsUk9ISjBPVVZWUjNkRFRVRnpRVzl3UldvS1JWazVUblpNT0hrNU1HaExTRk5hVUcxSWNYZ3dSa3RzVmpoUldIVmlTa1pvZUhvM1kyRlNPVUZDUm5wVU1XeGthVzFSYUUxT1RHTkJaejA5Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1666144895,
          "logIndex": 5401142,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/musl-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/musl-dynamic",
      "githubWorkflowSha": "dd147c9bfc529a82607df2dd6c16d89f4d35898b",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3278265316",
      "sha": "dd147c9bfc529a82607df2dd6c16d89f4d35898b"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

