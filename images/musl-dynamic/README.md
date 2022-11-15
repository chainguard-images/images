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
| `1.2.3-r4` `latest` | `sha256:e403d81329be7cb1389f24aba4ffd2e3a92fd45ac1176f48e602171009c7e950`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:e403d81329be7cb1389f24aba4ffd2e3a92fd45ac1176f48e602171009c7e950) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.2.3-r1` | `sha256:d90edc1058857946aa925234d35d1eb01d274c1645050ef55804adda1276f990`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:d90edc1058857946aa925234d35d1eb01d274c1645050ef55804adda1276f990) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
| `1.2.3-r2` | `sha256:c20eb50943802a18a47511dd7f4789794a46cc9f73c510cb3966b05fbb665a29`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:c20eb50943802a18a47511dd7f4789794a46cc9f73c510cb3966b05fbb665a29) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:e403d81329be7cb1389f24aba4ffd2e3a92fd45ac1176f48e602171009c7e950"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "b38efeabf8e5631fd1538432c88d1fc2bcf72245",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/musl-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCID1mGhr40eafN9YCZ7rqcB/IqmEImIyyz238NSYKqRZGAiEAhhzavXvW9jqiCWevoh+C8jQUkE/BeqJkFojF9NjJDsI=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiJjYjk5OTEwNjQ5MjRjOTc5MTE3NmU0MGVhMTIyZjBkYzkwZGYwMjEwZWJhMjU0ZmUyYWU0MGY2YmE3NTliOTA4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURlMElRTHhJWE1weGtnSzlXZ1QzdENGR29kaVhNaWUzWmZNeEFVQ0RDUHNBSWhBT0FEOWVBMnRNNC9YeVMrRXZMUFBhelJxalhoU0Q4REZOYUxCYnlVSE5GQiIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBla05EUVhvMlowRjNTVUpCWjBsVlMxUjNORUZUUmtVd1ZsWk9kekl5V2xodVRrNTZlRmsyVTJWdmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUlRGTlJFVjZUbXBOTkZkb1kwNU5ha2w0VFZSRk1VMUVSVEJPYWswMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVV2UVhsaGMxSnlNV3Q2YXpaR2FYWkNiekZxVkZKS1dUVjRNbmRCTkhsM1IxbGFTSGtLUmtkS01ubzBiUzgyY1d4SVNHOWpUSGxaYXpWWVdtWnZhV1JrZWxaTk9EaE1LMGgxTDBSNGJWWmlPV3h4VW5obVV6WlBRMEZzTUhkblowcGFUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZYWmxKT0NtbzROMm94UmtZMVdETm5ZVWgxVGpFNVlYZEljelV3ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKbldVUldVakJTUVZGSUwwSkhVWGRaYjFwbllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVRGak1uZDBXa2hzZFZsWE1YQlplVGgxV2pKc01HRklWbWxNTTJSMlkyMTBiV0pIT1ROamVUbDVXbGQ0YkZsWVRteE1ibXhvQ21KWGVFRmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFFYTBkRGFYTkhRVkZSUW1jM09IZEJVVVZGU3pKb01HUklRbnBQYVRoMlpFYzVjbHBYTkhVS1dWZE9NR0ZYT1hWamVUVnVZVmhTYjJSWFNqRmpNbFo1V1RJNWRXUkhWblZrUXpWcVlqSXdkMFpuV1V0TGQxbENRa0ZIUkhaNlFVSkJaMUZKWXpKT2J3cGFWMUl4WWtkVmQwNW5XVXRMZDFsQ1FrRkhSSFo2UVVKQmQxRnZXV3BOTkZwWFdteFpWMHB0VDBkVk1VNXFUWGhhYlZGNFRsUk5ORTVFVFhsWmVtYzBDbHBFUm0xWmVrcHBXVEpaTTAxcVNUQk9WRUZqUW1kdmNrSm5SVVZCV1U4dlRVRkZSVUpCTlVSamJWWm9aRWRWWjFWdFZuTmFWMFo2V2xSQmMwSm5iM0lLUW1kRlJVRlpUeTlOUVVWR1FrSTFhbUZIUm5CaWJXUXhXVmhLYTB4WGJIUlpWMlJzWTNrNWRHUllUbk5NVjFJMVltMUdkR0ZYVFhkSVVWbExTM2RaUWdwQ1FVZEVkbnBCUWtKblVWQmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFKUjB4Q1oyOXlRbWRGUlVGa1dqVkJaMUZEUWtnd1JXVjNRalZCU0dOQkNqTlVNSGRoYzJKSVJWUktha2RTTkdOdFYyTXpRWEZLUzFoeWFtVlFTek12YURSd2VXZERPSEEzYnpSQlFVRkhSV1ZQTldkalowRkJRa0ZOUVZORVFrY0tRV2xGUVdwUGRsbFdWRkpyVWtWRlVqbDBVVzQxWkc1dWNUZFBaa05CWTBSNGIxRndTSEoxUnpoRVN6WkpXRFJEU1ZGRU5FeHhTbVJpUkdweGR6QmlMd3BQYjJsRmJFRnZWR3hWVm1keVFqa3hTQzkzVWtKbE0wWjBPVU5tTDNwQlMwSm5aM0ZvYTJwUFVGRlJSRUYzVG01QlJFSnJRV3BDVHpNekwxYzVkRk01Q2psT2IwbDFNV0ZvZDI1QmFtVklTR2x0Y2tscldGVlhZMWw2WTBZNFIzUk5TRzl1WXpCek5qVkdSblZ4TkVoRlFtOTJRVE5oVFdORFRVVkRiRGRWYkdjS2FXaFlUVFpRTTA1SmFIVkhSWEo1ZDBzNWRrMXVVMWtyZVdab1RYTXhTV2RHWW10TldYQmlRemhuTVNzMGIzcDFlSHBMVkhoMFRUaFVaejA5Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1668476231,
          "logIndex": 7095002,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/musl-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/musl-dynamic",
      "githubWorkflowSha": "b38efeabf8e5631fd1538432c88d1fc2bcf72245",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3466675337",
      "sha": "b38efeabf8e5631fd1538432c88d1fc2bcf72245"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

