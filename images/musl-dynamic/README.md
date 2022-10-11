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
| `1.2.3-r1` `latest` | `sha256:d335078171d0577cd04d6ea000ea837367199cbc28eeb53cc7f0d42e81a61490`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d335078171d0577cd04d6ea000ea837367199cbc28eeb53cc7f0d42e81a61490) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:d335078171d0577cd04d6ea000ea837367199cbc28eeb53cc7f0d42e81a61490"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "f2de80ee598d5a944e049af866754c38ae1c08b4",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/musl-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIFyFNgXEk9FSzCQg9gjiNy9KeUpKRTp24mjYah+MHFXoAiEAozu/j30lWd4YlNmws8ueC3vvnDXasMUeqMjmYTCd00Y=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIyODkyZmNmNDU2NDZmMDMzZTJkYzMxMjBkYjg5ZTJlOTgzYzE5ODdlZjRjNjY4OWNhYmY4YmZiZWIxYmM1YTJhIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQnlLbGdBRDMyQmJZMC9ZbnlRZTdRbUZWRC9JQWJQbkozTWdDSlZ5V2Jsd0FpQjVoNENzYldpSzVzUjgxNVNGTVhnbXFMY3RKdlpsMTRvaitmbC9wWGZ2V2c9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBha05EUVhwNVowRjNTVUpCWjBsVllUSmtRM1ZWY2tZeGJVNXpURVJMTWpKcEszbGFUbW92SzNJNGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhoTlJFVXhUbXBWZUZkb1kwNU5ha2w0VFVSRmVFMUVTWGRPYWxWNFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZYWldSeGQwZERXVXBTTVROeWVEZEVZWE5ITVVnNVRqWXhSbWhHVlZabVZ6STRTMG9LTVdObWRGUjNaRTlCTVU1M05VUnFWV052WmxkakwwcGlPR0p5TDNCM2QwNTNiRFJtSzNRck9GSlJWMWxZY2tOelJuRlBRMEZzYzNkblowcFlUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZEUm1SeENtbGhSbkJNTW5NNFNIUmpiMUpwWkdkMFJXdElkMHQzZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKbldVUldVakJTUVZGSUwwSkhVWGRaYjFwbllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVRGak1uZDBXa2hzZFZsWE1YQlplVGgxV2pKc01HRklWbWxNTTJSMlkyMTBiV0pIT1ROamVUbDVXbGQ0YkZsWVRteE1ibXhvQ21KWGVFRmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFFYTBkRGFYTkhRVkZSUW1jM09IZEJVVVZGU3pKb01HUklRbnBQYVRoMlpFYzVjbHBYTkhVS1dWZE9NR0ZYT1hWamVUVnVZVmhTYjJSWFNqRmpNbFo1V1RJNWRXUkhWblZrUXpWcVlqSXdkMFpuV1V0TGQxbENRa0ZIUkhaNlFVSkJaMUZKWXpKT2J3cGFWMUl4WWtkVmQwNW5XVXRMZDFsQ1FrRkhSSFo2UVVKQmQxRnZXbXBLYTFwVVozZGFWMVV4VDFSb2EwNVhSVFZPUkZKc1RVUlJOVmxYV1RST2Fsa3pDazVVVW1wTmVtaG9XbFJHYWsxRWFHbE9SRUZqUW1kdmNrSm5SVVZCV1U4dlRVRkZSVUpCTlVSamJWWm9aRWRWWjFWdFZuTmFWMFo2V2xSQmMwSm5iM0lLUW1kRlJVRlpUeTlOUVVWR1FrSTFhbUZIUm5CaWJXUXhXVmhLYTB4WGJIUlpWMlJzWTNrNWRHUllUbk5NVjFJMVltMUdkR0ZYVFhkSVVWbExTM2RaUWdwQ1FVZEVkbnBCUWtKblVWQmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFKUjBwQ1oyOXlRbWRGUlVGa1dqVkJaMUZEUWtoelJXVlJRak5CU0ZWQkNrTkhRMU00UTJoVEx6Sm9SakJrUm5KS05GTmpVbGRqV1hKQ1dUbDNlbXBUWW1WaE9FbG5XVEppTTBsQlFVRkhSSGhOU2t4dFowRkJRa0ZOUVZKcVFrVUtRV2xCZFdOUlduVmtSbWQzUTA4NE5EZHJkM05SWm05TlpGWnhNVkJtUkc5TFVsWjVNM1JIWjFCSVptdzNVVWxuWlU1V1VXTnhTV3BrYTFacGFuZEpTQXBOTVcwd2RXaE9ieXRsUW5KelYzTlljMjFMWm1FelFrVlJWekIzUTJkWlNVdHZXa2w2YWpCRlFYZE5SR0ZCUVhkYVVVbDNRMDlyTldWUlIweENkRmxIQ21weGQzQnlZMGx2WVdGT05GQlpVaXQyS3pKb1VuZHRiRXRVWjFkNlJUUnROVXBDVVRJMU1FVlRNRE5xZEVWSGEySkpOVEZCYWtWQmFESnBhVGhuYXk4S2VFcFlNRlJFTWpZMlYzQXlWRXRMY1ROQ2NXTTJkM3A0T0dSdFlVbGtWMWRtVEdWNGMza3ljWE5KZVZodFJIUTRaM05hUTBWbFkxb0tMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1665453432,
          "logIndex": 4860500,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/musl-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/musl-dynamic",
      "githubWorkflowSha": "f2de80ee598d5a944e049af866754c38ae1c08b4",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3223585198",
      "sha": "f2de80ee598d5a944e049af866754c38ae1c08b4"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

