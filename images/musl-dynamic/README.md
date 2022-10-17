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
| `1.2.3-r1` `latest` | `sha256:e35d03cfd5c9b2c6619f33b3adc5c42d4a1e7dd93597291354996fc8f84bc3f5`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:e35d03cfd5c9b2c6619f33b3adc5c42d4a1e7dd93597291354996fc8f84bc3f5) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:e35d03cfd5c9b2c6619f33b3adc5c42d4a1e7dd93597291354996fc8f84bc3f5"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "6a8ec2653bf95e70e316c61ef082b99ba9e737e5",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/musl-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQD6x0Uszc5nkU7o3t5APwWm4FlQjUizi/d2ijL/oJAMEgIhALoSw5B/llGd2nQfmf6pkSxM/DhnFakR2y23FPZsqTqN",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI4NjlkMTFjM2ZiZjYwNzlmNTE2OWYzNTgzOWEzMmRlNTg1ZGRhYjY0YWUwMjk3MGI4ZTA1YjlhMjgwZmJlYjQ4In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUQrakswb1Bhd1kyeC92S3lFUnBTdWxMQjdQL05pQUhtRzd5YXhOcGdmVkdBSWdOMGRxT0t6ZTU5NnpUR1B1VlFIM1dnT25yaDdoa2tSSXIvOWhMWVlobjBvPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjFWRU5EUVhvMlowRjNTVUpCWjBsVlNYWk1PWGhNVFc1M1IxZGpVMHRQY1RsU00wZGtXV3RIYzFoRmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlROTlJFbDRUMVJKTUZkb1kwNU5ha2w0VFVSRk0wMUVTWGxQVkVrd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZKVFhCQ1IxbGpabEowUWxkYVExUnhSMHRoU0dWeVRISXljMnB3TjBOUlZsUnZURllLV0Rkc05VWTRlR3hoWlhkS015dEVVMjlqYTFKSlNqSjNZa1pQT0dKMVQzTnRibk5yZWs1RGJHNVNTWGhyYTI1T1MzRlBRMEZzTUhkblowcGFUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZGYm5VckNrZHBRMHM1VUd0MVYyOXpTakJCWTIxUWMzTXZVV2hGZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKbldVUldVakJTUVZGSUwwSkhVWGRaYjFwbllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVRGak1uZDBXa2hzZFZsWE1YQlplVGgxV2pKc01HRklWbWxNTTJSMlkyMTBiV0pIT1ROamVUbDVXbGQ0YkZsWVRteE1ibXhvQ21KWGVFRmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFFYTBkRGFYTkhRVkZSUW1jM09IZEJVVVZGU3pKb01HUklRbnBQYVRoMlpFYzVjbHBYTkhVS1dWZE9NR0ZYT1hWamVUVnVZVmhTYjJSWFNqRmpNbFo1V1RJNWRXUkhWblZrUXpWcVlqSXdkMFpuV1V0TGQxbENRa0ZIUkhaNlFVSkJaMUZKWXpKT2J3cGFWMUl4WWtkVmQwNW5XVXRMZDFsQ1FrRkhSSFo2UVVKQmQxRnZUbTFGTkZwWFRYbE9hbFY2V1cxWk5VNVhWVE5OUjFWNlRWUmFhazVxUm14YWFrRTBDazF0U1RWUFYwcG9UMWRWTTAxNlpHeE9WRUZqUW1kdmNrSm5SVVZCV1U4dlRVRkZSVUpCTlVSamJWWm9aRWRWWjFWdFZuTmFWMFo2V2xSQmMwSm5iM0lLUW1kRlJVRlpUeTlOUVVWR1FrSTFhbUZIUm5CaWJXUXhXVmhLYTB4WGJIUlpWMlJzWTNrNWRHUllUbk5NVjFJMVltMUdkR0ZYVFhkSVVWbExTM2RaUWdwQ1FVZEVkbnBCUWtKblVWQmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFKUjB4Q1oyOXlRbWRGUlVGa1dqVkJaMUZEUWtnd1JXVjNRalZCU0dOQkNrTkhRMU00UTJoVEx6Sm9SakJrUm5KS05GTmpVbGRqV1hKQ1dUbDNlbXBUWW1WaE9FbG5XVEppTTBsQlFVRkhSRFEzTUdKM1FVRkJRa0ZOUVZORVFrY0tRV2xGUVdnNVdIUk1SRWhCVVdZdlkwZDFiMDUxTkU5VE1XVk1VakZsVW1sMk1uaGhjbGd2YTFCd1lXOXJOSGREU1ZGRFVFNXhTRzFoWnk5cmFXSlZNZ3BQV1ZSeGNuRmhObUpCTWxvNFNrOHZZV05oY2sxb1dETk1kVTUwVEZSQlMwSm5aM0ZvYTJwUFVGRlJSRUYzVG5CQlJFSnRRV3BGUVc4emF6aHlaVFEzQ25aUlFtRnJabFZWVWs5b2RXcFdhR0Y2YTBod2VVTkJWalJPV0N0cGNWZFJjVVJ0SzFGemNUVlNRVXhKVUhGcFpXUnlVMGtyV1VKT1FXcEZRWHAxV0hBS1MyTlhiMVZ5TjFkSE9FNTZjV2x4UzBWT1RrWnlVV2N3UzBzeFJHaFdaRFZQYlVGR1REbFNhVFpOVURFMVdWcHVkMVJXTWtscmRsTlVkVk5JQ2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1665973183,
          "logIndex": 5249853,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/musl-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/musl-dynamic",
      "githubWorkflowSha": "6a8ec2653bf95e70e316c61ef082b99ba9e737e5",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3261900004",
      "sha": "6a8ec2653bf95e70e316c61ef082b99ba9e737e5"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

