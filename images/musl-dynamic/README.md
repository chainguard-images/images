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
| `1.2.3-r2` `latest` | `sha256:b59d2846d65e45e527bcec6f6f34bb2c9885d4beb671f0b0cde23663ec7defe6`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:b59d2846d65e45e527bcec6f6f34bb2c9885d4beb671f0b0cde23663ec7defe6) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
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
        "docker-manifest-digest": "sha256:b59d2846d65e45e527bcec6f6f34bb2c9885d4beb671f0b0cde23663ec7defe6"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "76232e5ea7e2a5e045951d81956a2f9b59bed2ad",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/musl-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDOxsPjJ2+2f67KJOxYj1MraiUfps771gELJDedi1XRMgIhAI2UNNU7f4UYE4heQuAq+QxRmVlQORvnH6VFkno2Orsh",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI0OTQzZGNjZjAxOWU4ZDAwMzMxMDhkYjhlOTFlYzA1MTM1Y2Y0NTQzMDkwN2JmMzRiODI1NzcxOGIwMTJhYTQ3In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUURJMHNhQkV5dnFrZkw5NjZ1TlFRSDQ1RkFlYWZObEJHNHVkU1Vwb21adW9BSWhBT2NiOWhYTXFBR2s0TUdkUWlNS1R0T3NleVFzQlNlUzV4K21ITzFQcE1uciIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFSRU5EUVhveVowRjNTVUpCWjBsVlpFcHhRVUpwVkVGTmVsWllhVE13YUdGaEsxUnJOME5qWjA5VmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRWTlJFVXhUVVJCTTFkb1kwNU5ha2w0VFZSQk5VMUVTWGROUkVFelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVV6WVZNelpVTnpVak5qZVhaRVlYVm1SbEZuTVZWR1VUWjZSbWgwVTBGdFpVRm1aMHdLT0cxRVRGQkhPR2sxYXk4eWNrTTJRV05aUVVFNGQyZFRSVTFCUm1WNGVuYzNMMlpqT0UxaWFVMW9aRzFzTDBKM1JVdFBRMEZzZDNkblowcFpUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZKVkVaeUNqSlNjMHN4UzBSMGFGVmliMUZSVDNCV1RHcDJRVVZSZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKbldVUldVakJTUVZGSUwwSkhVWGRaYjFwbllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVRGak1uZDBXa2hzZFZsWE1YQlplVGgxV2pKc01HRklWbWxNTTJSMlkyMTBiV0pIT1ROamVUbDVXbGQ0YkZsWVRteE1ibXhvQ21KWGVFRmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFFYTBkRGFYTkhRVkZSUW1jM09IZEJVVVZGU3pKb01HUklRbnBQYVRoMlpFYzVjbHBYTkhVS1dWZE9NR0ZYT1hWamVUVnVZVmhTYjJSWFNqRmpNbFo1V1RJNWRXUkhWblZrUXpWcVlqSXdkMFpuV1V0TGQxbENRa0ZIUkhaNlFVSkJaMUZKWXpKT2J3cGFWMUl4WWtkVmQwNW5XVXRMZDFsQ1FrRkhSSFo2UVVKQmQxRnZUbnBaZVUxNlNteE9WMVpvVGpKVmVWbFVWbXhOUkZFeFQxUlZlRnBFWjNoUFZGVXlDbGxVU20xUFYwa3hUMWRLYkZwRVNtaGFSRUZqUW1kdmNrSm5SVVZCV1U4dlRVRkZSVUpCTlVSamJWWm9aRWRWWjFWdFZuTmFWMFo2V2xSQmMwSm5iM0lLUW1kRlJVRlpUeTlOUVVWR1FrSTFhbUZIUm5CaWJXUXhXVmhLYTB4WGJIUlpWMlJzWTNrNWRHUllUbk5NVjFJMVltMUdkR0ZYVFhkSVVWbExTM2RaUWdwQ1FVZEVkbnBCUWtKblVWQmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFKUjB0Q1oyOXlRbWRGUlVGa1dqVkJaMUZEUWtoM1JXVm5RalJCU0ZsQkNqTlVNSGRoYzJKSVJWUktha2RTTkdOdFYyTXpRWEZLUzFoeWFtVlFTek12YURSd2VXZERPSEEzYnpSQlFVRkhSVmRvVTA0MWQwRkJRa0ZOUVZKNlFrWUtRV2xDVUV0MU5EZEpiMUV3TTNWVldsaDZUelF5Wnk4eWNsTnhSRUZuYmtGV1dHcE5kRGsyTlVKcmJ6aFJRVWxvUVUxMVRVRkRSR295TVd4SlYwc3pWUW8yYW5wT1JIa3JNeXRKZEZVMWRWQjBlbVJSTjFjM1JUSnBSelF4VFVGdlIwTkRjVWRUVFRRNVFrRk5SRUV5YTBGTlIxbERUVkZEYlc5Q2VUQjJlRGRaQ21SdlUySTFVVTlwYWpaWE4yWXZkMUo2V0hkR1FuaG9UVlF4VDNWalpIRXhRV2xtY1VoNE9VcGpRWGhtUzJGU2VXTTNRMmg0YkhORFRWRkRXa2gyUjNjS0syeE9aemhsVFVaM1VrMHlRbTVoT1c5alpVRlpPRzlaUlZGVFZFeHFUV1ZDSzNGbkwxTm1iSGRGT1habmRubG9jR2x4TVRjMFkxaHNaekE5Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1667958632,
          "logIndex": 6758032,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/musl-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/musl-dynamic",
      "githubWorkflowSha": "76232e5ea7e2a5e045951d81956a2f9b59bed2ad",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3424677214",
      "sha": "76232e5ea7e2a5e045951d81956a2f9b59bed2ad"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

