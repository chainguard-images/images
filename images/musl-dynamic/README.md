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
| `1.2.3-r1` `latest` | `sha256:6fac1b5e08941a6d757b980faab2904be7bd3cde35950f994bc1f01a6c842d13`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:6fac1b5e08941a6d757b980faab2904be7bd3cde35950f994bc1f01a6c842d13) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:6fac1b5e08941a6d757b980faab2904be7bd3cde35950f994bc1f01a6c842d13"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "69839de9cd49bd8105524d6209cad2b19ee8df67",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/musl-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIHS0rf9AnI+PfHOp1ECEA4Q5tsmguAvdXHCugSL3FApfAiAAsQvnccU8xafJnbv89iicq3hpk+XhZ9J3sSp4mOqOQg==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5OWRmODc2MDYyZGI3ZDgzNDRiYzEwNDc5MTZhYTkxN2M3ZjBhZDQ5ZDAxNjI2NWQwNjE2NzA5ZGMxMTY1NTRmIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJRlVNNFRWR1ZDQXNOaGdJZkVhZkhkWDNnczBHNkt6NC9JL3d0cWsrNW1DL0FpRUFwZUF2UzRDMDNZakJhL0lwTWhzOHBIOXo0VUIyTmEvbEZ6K0VWS2xHOTFVPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBha05EUVhveVowRjNTVUpCWjBsVlRXTm1XSFJoZHpoSFNGcDBhMDlxUzJaaWRVRjVkRVl4WWtFNGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhkTlJFbDNUV3BOTkZkb1kwNU5ha2w0VFVSRmQwMUVTWGhOYWswMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVUxUWpSTldDdHdkbkpLZFZOMmR6QlpjRGRMYkcxUGFFSm9iMDAzZG1sbFNGRmlTVlVLU1Vkdk5HVllTekZ2VTFoRWN6ZEVlRVEzZGxkWmRGVnJXVUZyVURaSGNGWmhXbmRzY0d0dEsxazNPQ3QzVVRkb2FqWlBRMEZzZDNkblowcFpUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZRTVZsd0NuSmlWVFJUY1dwaVpVSkpTMDAzWlU4NEwyRllOMFJuZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKbldVUldVakJTUVZGSUwwSkhVWGRaYjFwbllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVRGak1uZDBXa2hzZFZsWE1YQlplVGgxV2pKc01HRklWbWxNTTJSMlkyMTBiV0pIT1ROamVUbDVXbGQ0YkZsWVRteE1ibXhvQ21KWGVFRmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFFYTBkRGFYTkhRVkZSUW1jM09IZEJVVVZGU3pKb01HUklRbnBQYVRoMlpFYzVjbHBYTkhVS1dWZE9NR0ZYT1hWamVUVnVZVmhTYjJSWFNqRmpNbFo1V1RJNWRXUkhWblZrUXpWcVlqSXdkMFpuV1V0TGQxbENRa0ZIUkhaNlFVSkJaMUZKWXpKT2J3cGFWMUl4WWtkVmQwNW5XVXRMZDFsQ1FrRkhSSFo2UVVKQmQxRnZUbXByTkUxNmJHdGFWR3hxV2tSUk5WbHRVVFJOVkVFeFRsUkpNRnBFV1hsTlJHeHFDbGxYVVhsWmFrVTFXbGRWTkZwSFdUSk9la0ZqUW1kdmNrSm5SVVZCV1U4dlRVRkZSVUpCTlVSamJWWm9aRWRWWjFWdFZuTmFWMFo2V2xSQmMwSm5iM0lLUW1kRlJVRlpUeTlOUVVWR1FrSTFhbUZIUm5CaWJXUXhXVmhLYTB4WGJIUlpWMlJzWTNrNWRHUllUbk5NVjFJMVltMUdkR0ZYVFhkSVVWbExTM2RaUWdwQ1FVZEVkbnBCUWtKblVWQmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFKUjB0Q1oyOXlRbWRGUlVGa1dqVkJaMUZEUWtoM1JXVm5RalJCU0ZsQkNrTkhRMU00UTJoVEx6Sm9SakJrUm5KS05GTmpVbGRqV1hKQ1dUbDNlbXBUWW1WaE9FbG5XVEppTTBsQlFVRkhSSFkyUlRndlowRkJRa0ZOUVZKNlFrWUtRV2xDZUZCSFVtZFVNVXN4TkRkdFZWRlBWM2hKVDNaVllUaExXRGQxV0ZOTldHVnVaVFZGYkdWUEwycE1aMGxvUVU5dlREQkZZbnA0SzJ4NWNHUmlNZ3BOVFVOc09UbFVSMGgwZFZaSk1rdERWV0pZUVhKalpHZDFjMUZyVFVGdlIwTkRjVWRUVFRRNVFrRk5SRUV5WTBGTlIxRkRUVWR0TDNsRE9VVllSMXBXQ2paRk1ETnpWVkFyUlVkdmFIUmpVWEIwUkdSQ04yeGxjSEZ1V0RkeGF6UkZjVlYzTVM5elFXTlZkbVl2VldJNFpuaHRiamxQZDBsM1RrTm9jazlKU1ZJS09YWjZSVXgzTWpWUlVVWlRTbWxOVTFCeWFUVTVXR1oxTDJVM2VtNWpabEZsVjFGaU1YSlhPSEpyZDI5emVUQTFTMUptYldwMWJqTUtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1665367382,
          "logIndex": 4787221,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/musl-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/musl-dynamic",
      "githubWorkflowSha": "69839de9cd49bd8105524d6209cad2b19ee8df67",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3216414301",
      "sha": "69839de9cd49bd8105524d6209cad2b19ee8df67"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

