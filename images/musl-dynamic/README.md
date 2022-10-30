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
| `1.2.3-r1` `latest` | `sha256:d8bf503afd5cede0b15ebad18016ace5d4c9a36afa775d29181b12359c62d5eb`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d8bf503afd5cede0b15ebad18016ace5d4c9a36afa775d29181b12359c62d5eb) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:d8bf503afd5cede0b15ebad18016ace5d4c9a36afa775d29181b12359c62d5eb"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "b25b3183fba334591ece9ec846e878abc467b2a8",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/musl-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCICRU/YH+4Ewg053ReoNbIgAgYJZu8Xc+i4+qJMKTeUYyAiEApCGs5fk3hArdn9QXjtGHld710wjzTnEj4iJZHSYQ8a4=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjYTJiM2RjNDkyMTMyODhlMDQ3NGE0MTk4MWEwZTAwZjBiODQ0NjZlZjY5YjJkODg0YmRmYTRjM2M0NGQ1ZGVkIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURDRlAyaDZkdmNKZlgzb01wTzl1Y01qR3lQUS9RaXJWVlkxbWtYQkoxVG93SWhBTXZwZ2sxdjVEN0ExWHY2b05ObUFDTS8yangwTmY5ZlplbTZDeFY2aXJkdCIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBha05EUVhveVowRjNTVUpCWjBsVlYzY3JPR1ZPU0daR1dWQldVRzA0U1hZeFoxaG9XV2h4ZGtKamQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFVFhkTlJFVXhUMVJKZWxkb1kwNU5ha2w0VFVSTmQwMUVTWGRQVkVsNlYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZwUldWUE5YQllTRWxMTWpaRWJ6VlFZbUZFUjBJeWNVdFVRbVpJZWxGdFdXMTBZWFlLUjJseVJqRlpWR05OTVdob1VtaEZNblJYWlV0c1dXcFBieXMxWjFWWWR6ZHBkVlJCWkhoV1FtOXZURU5aY0ZwWVZHRlBRMEZzZDNkblowcFpUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZUUzB4NUNtdDZUVlZUT1N0UmJqWm5XV2d4V0RaUWVXMUJVeXRWZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKbldVUldVakJTUVZGSUwwSkhVWGRaYjFwbllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVRGak1uZDBXa2hzZFZsWE1YQlplVGgxV2pKc01HRklWbWxNTTJSMlkyMTBiV0pIT1ROamVUbDVXbGQ0YkZsWVRteE1ibXhvQ21KWGVFRmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFFYTBkRGFYTkhRVkZSUW1jM09IZEJVVVZGU3pKb01HUklRbnBQYVRoMlpFYzVjbHBYTkhVS1dWZE9NR0ZYT1hWamVUVnVZVmhTYjJSWFNqRmpNbFo1V1RJNWRXUkhWblZrUXpWcVlqSXdkMFpuV1V0TGQxbENRa0ZIUkhaNlFVSkJaMUZKWXpKT2J3cGFWMUl4WWtkVmQwNW5XVXRMZDFsQ1FrRkhSSFo2UVVKQmQxRnZXV3BKTVZscVRYaFBSRTV0V1cxRmVrMTZVVEZQVkVac1dUSlZOVnBYVFRST1JGcHNDazlFWXpSWlYwcHFUa1JaTTFscVNtaFBSRUZqUW1kdmNrSm5SVVZCV1U4dlRVRkZSVUpCTlVSamJWWm9aRWRWWjFWdFZuTmFWMFo2V2xSQmMwSm5iM0lLUW1kRlJVRlpUeTlOUVVWR1FrSTFhbUZIUm5CaWJXUXhXVmhLYTB4WGJIUlpWMlJzWTNrNWRHUllUbk5NVjFJMVltMUdkR0ZYVFhkSVVWbExTM2RaUWdwQ1FVZEVkbnBCUWtKblVWQmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFKUjB0Q1oyOXlRbWRGUlVGa1dqVkJaMUZEUWtoM1JXVm5RalJCU0ZsQkNrTkhRMU00UTJoVEx6Sm9SakJrUm5KS05GTmpVbGRqV1hKQ1dUbDNlbXBUWW1WaE9FbG5XVEppTTBsQlFVRkhSVXB3TVhrMlVVRkJRa0ZOUVZKNlFrWUtRV2xGUVhVMFRWRnJWM2N6VDJwQlZsRlNNR04xYVVzd1dscGtlbUZQU1hac1RETnRUV1YyYVdoa2QzTldlRlZEU1VWUmRqSk1iQzlYWkZGRE4xWkdMd3BRTVVRNWJHUk1Xak16VkVZMmJUTlJRa2gzTTBGYVltY3ZhREJpVFVGdlIwTkRjVWRUVFRRNVFrRk5SRUV5WTBGTlIxRkRUVVJ3VFZOaFJrdGlkVVZZQ2pSekwwUkNMMUZ3U2pGcllrNUROVlpsYkM5dUswazROa3hhUjNCMmQyUkVaamRpTkZWRVFTczRkV3hGY0hGNlVVSm5RbXBWUVVsM1JUUm5ZWGhsTkZVS2RXcDNSbUpMWVRkU1RVWnVjRzUwWjJ4R2R6TXdObTVCUVU1dGIwaHpWM1ZvV1dobGQxTkpiMUEwWXpKS1V6aFhUR055UWxGTVZFTUtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1667095204,
          "logIndex": 6134625,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/musl-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/musl-dynamic",
      "githubWorkflowSha": "b25b3183fba334591ece9ec846e878abc467b2a8",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3353719621",
      "sha": "b25b3183fba334591ece9ec846e878abc467b2a8"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

