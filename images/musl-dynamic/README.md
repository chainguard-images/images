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
| `1.2.3-r1` `latest` | `sha256:ce5657f11e7aba859f176db05a08c6d08a28cf0348724d562873cda5647a8fc3`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:ce5657f11e7aba859f176db05a08c6d08a28cf0348724d562873cda5647a8fc3) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |


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
        "docker-manifest-digest": "sha256:ce5657f11e7aba859f176db05a08c6d08a28cf0348724d562873cda5647a8fc3"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "b6c224b5c54abbc5e85960bd4c69ef957af47d1c",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/musl-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQCTZ9y11i8/cFFLCucKthrG6Qt9g7BcqbnxHGPwZeudIQIhANL8vFMvVGBEbFVV8qG1IpkDbOOzEesxooKFluzskIFJ",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIxZDY3MjZhZjQ4NTA2OWZjNTI1NzQ3YWE0ZDY0MzMyMTZiZTBmN2RlYTM1YWZmM2U4YmY4OTg5YTBiYWUzYjJlIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FWUNJUUM1TlpiNEZFYU1zYVRBUHZWZkgxa2FxUTFpR2xkdE8xbHJGVHp6R1d6ZWpRSWhBSkRVeElBdGs0cmwrM2ZVdjZZTkdkcVoxQ1Zpd1BXWXY1bXhRcVdPTmtJciIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBla05EUVhvMlowRjNTVUpCWjBsVlJucFlXRTk2ZEZGTFdVZG1aMVJ6U1dVMVVXTk1aRll6T1hwamQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFU1hsTlJFVXhUa1JCTWxkb1kwNU5ha2w0VFVSSmVVMUVTWGRPUkVFeVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZUT0c0MEwwczRTWGNyVlVsUk56TkpOVmc0UXpKVGFXMHpOVGh5WkdsMFVUUjZZa0VLZUhsRFMzQk5TVmMxTDNBMlVpOVhVSG92U0d4YWJrbG9lbkp6VDFkU1NHSlhPVUlyY0ZOYVpVTkliak5rV0RCalVYRlBRMEZzTUhkblowcGFUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZCZEVnMENqTlNkakpETlU0M1JXRmlSbFJrY0V4Uk1GQTFUek5KZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKbldVUldVakJTUVZGSUwwSkhVWGRaYjFwbllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVRGak1uZDBXa2hzZFZsWE1YQlplVGgxV2pKc01HRklWbWxNTTJSMlkyMTBiV0pIT1ROamVUbDVXbGQ0YkZsWVRteE1ibXhvQ21KWGVFRmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFFYTBkRGFYTkhRVkZSUW1jM09IZEJVVVZGU3pKb01HUklRbnBQYVRoMlpFYzVjbHBYTkhVS1dWZE9NR0ZYT1hWamVUVnVZVmhTYjJSWFNqRmpNbFo1V1RJNWRXUkhWblZrUXpWcVlqSXdkMFpuV1V0TGQxbENRa0ZIUkhaNlFVSkJaMUZKWXpKT2J3cGFWMUl4WWtkVmQwNW5XVXRMZDFsQ1FrRkhSSFo2UVVKQmQxRnZXV3BhYWsxcVNUQlphbFpxVGxSU2FGbHRTbXBPVjFVMFRsUnJNazFIU210T1IwMHlDazlYVm0xUFZGVXpXVmRaTUU0eVVYaFpla0ZqUW1kdmNrSm5SVVZCV1U4dlRVRkZSVUpCTlVSamJWWm9aRWRWWjFWdFZuTmFWMFo2V2xSQmMwSm5iM0lLUW1kRlJVRlpUeTlOUVVWR1FrSTFhbUZIUm5CaWJXUXhXVmhLYTB4WGJIUlpWMlJzWTNrNWRHUllUbk5NVjFJMVltMUdkR0ZYVFhkSVVWbExTM2RaUWdwQ1FVZEVkbnBCUWtKblVWQmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFKUjB4Q1oyOXlRbWRGUlVGa1dqVkJaMUZEUWtnd1JXVjNRalZCU0dOQkNrTkhRMU00UTJoVEx6Sm9SakJrUm5KS05GTmpVbGRqV1hKQ1dUbDNlbXBUWW1WaE9FbG5XVEppTTBsQlFVRkhSQzlYVnpadFFVRkJRa0ZOUVZORVFrY0tRV2xGUVdoSFVYbG1SME5NYkdSVGNEWmFjVzFXVVZjelRrWnhiVlZDZG10dGVEY3dkVEZUZW5WbmR5dGpNVTFEU1ZGRFJWbGlOWGN2U0dKS1EzVXdTZ3BMU21FeU5VdEtkM2R0YTJKUlZuQlhRVUZLUXpWelJsaDZjbE5uTTNwQlMwSm5aM0ZvYTJwUFVGRlJSRUYzVG01QlJFSnJRV3BCTW0xSVRVd3pkbXBxQ2tGWVZGQkZaMUZxV2tSdFEyMVBZa0ZQVUZkU1pEa3llV1V5Wm1GR2NFeG5jR28zUzFkSWRqTXdjVzlHWkU4MFJUZFRSelEwVWxsRFRVVnlkSE5pYW5FS1ozSmFhR3R2Y1Roa2RUQkZjWE12TDNreFZXdG9XVGxzTkM5TVVsazFZMVJ1WTJOa1JWZGtZVlJCT1hkalRrVjJOVVp0SzFWd2NHNXJVVDA5Q2kwdExTMHRSVTVFSUVORlVsUkpSa2xEUVZSRkxTMHRMUzBLIn19fX0=",
          "integratedTime": 1666403666,
          "logIndex": 5611041,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/musl-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/musl-dynamic",
      "githubWorkflowSha": "b6c224b5c54abbc5e85960bd4c69ef957af47d1c",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3301522653",
      "sha": "b6c224b5c54abbc5e85960bd4c69ef957af47d1c"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

