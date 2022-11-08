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
| `1.2.3-r2` `latest` | `sha256:fa0ccdc9c3a2798a84181f80b2cffe1813cf1c5518f141fefba37f74b733b3d5`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:fa0ccdc9c3a2798a84181f80b2cffe1813cf1c5518f141fefba37f74b733b3d5) | `386` `amd64` `arm64` `armv6` `armv7` `ppc64le` `riscv64` `s390x` |
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
        "docker-manifest-digest": "sha256:fa0ccdc9c3a2798a84181f80b2cffe1813cf1c5518f141fefba37f74b733b3d5"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "90434cb2f2de09faf579873a38e2d66e52369e3b",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/musl-dynamic",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQDN8ntL8+9QCP2GFWbP+eWb8B88XC3aupFMMlVlJsI+fQIhAN7QBKdqj0ZJhTnot9zOYHDJh9kdurlbg8WYPq6EXzaH",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI5ZGRmOTZlYTc5ZTU0ODdjNzE0Y2Q3NDRiNDk5ZGFlZmY4NmY1ZmU1N2ZjN2MyNmZmODZhNGQ1ZTlhMDAzYjU5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJRm5HMnNhbG8rcTI1SFlaQ1d0NElrOTdVYlRvU3VJSXQzcFpmdlluRndOTkFpQVFRcGdCT1JVRDV1OTE0cjJ5aUJYaCswOXVvNDhzWGxiaW45ZTRiOGxRNnc9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUjBha05EUVhwNVowRjNTVUpCWjBsVlYwSldjMHBTZDFCYU9XWnRRWE1yTUU5M1NVSkdVMjU0VVZabmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFVUVRSTlJFVXdUVVJCTkZkb1kwNU5ha2w0VFZSQk5FMUVSVEZOUkVFMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZxVURsUVZsVndaMmRUV2poeE1tUlhSbFV6WW1FeU5HSk1kSGs0TjFsU1RWVmlRV2NLVms4d1NtRjJTRFZIWkN0eUwwOHJhVlpMWTBWQ2VEbHpjVVpQYnpONlRVRmFPRWdyTDJ0c1ZWTXhjVGt4U25WNWQyRlBRMEZzYzNkblowcFlUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlUzYjNWNENsbHZVa1psSzFWUFZtbFJXRkJ5U2t4TlR6bEZjSGs0ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJKbldVUldVakJTUVZGSUwwSkhVWGRaYjFwbllVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVRGak1uZDBXa2hzZFZsWE1YQlplVGgxV2pKc01HRklWbWxNTTJSMlkyMTBiV0pIT1ROamVUbDVXbGQ0YkZsWVRteE1ibXhvQ21KWGVFRmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFFYTBkRGFYTkhRVkZSUW1jM09IZEJVVVZGU3pKb01HUklRbnBQYVRoMlpFYzVjbHBYTkhVS1dWZE9NR0ZYT1hWamVUVnVZVmhTYjJSWFNqRmpNbFo1V1RJNWRXUkhWblZrUXpWcVlqSXdkMFpuV1V0TGQxbENRa0ZIUkhaNlFVSkJaMUZKWXpKT2J3cGFWMUl4WWtkVmQwNW5XVXRMZDFsQ1FrRkhSSFo2UVVKQmQxRnZUMVJCTUUxNlVtcFpha3B0VFcxU2JFMUViRzFaVjFreFRucHJORTU2VG1oTmVtaHNDazF0VVRKT2JWVXhUV3BOTWs5WFZYcFpha0ZqUW1kdmNrSm5SVVZCV1U4dlRVRkZSVUpCTlVSamJWWm9aRWRWWjFWdFZuTmFWMFo2V2xSQmMwSm5iM0lLUW1kRlJVRlpUeTlOUVVWR1FrSTFhbUZIUm5CaWJXUXhXVmhLYTB4WGJIUlpWMlJzWTNrNWRHUllUbk5NVjFJMVltMUdkR0ZYVFhkSVVWbExTM2RaUWdwQ1FVZEVkbnBCUWtKblVWQmpiVlp0WTNrNWIxcFhSbXRqZVRsMFdWZHNkVTFKUjBwQ1oyOXlRbWRGUlVGa1dqVkJaMUZEUWtoelJXVlJRak5CU0ZWQkNqTlVNSGRoYzJKSVJWUktha2RTTkdOdFYyTXpRWEZLUzFoeWFtVlFTek12YURSd2VXZERPSEEzYnpSQlFVRkhSVlpQVlZBMVowRkJRa0ZOUVZKcVFrVUtRV2xDWlVkU2VrZE1VRWhVVFdWSVExSnVXbXhwYjBWS00wTkZXbkZDV0ZONVkwMXBjVGxCVmtKUGNuWm5kMGxuVGxGNWQwOXFZV3hSVkhSU00zcGpTZ280VEV0NEsyTklibG80TWpWclNtSk1NRE41TUdWTUszQllSMmQzUTJkWlNVdHZXa2w2YWpCRlFYZE5SR0ZCUVhkYVVVbDRRVXRYY3pkSVpIRjRWa3BNQ25KWlprcDJVWGQxVkhSM1ZWWmFabFoxVWxCME9YQnBhSFJhTTJacGMwUXJaV2xxVkhad1FYTm1VbUZYYTJzcmNXSkJUV2haVVVsM1VUUk9kSHByV1hrS1F6ZHhZMW92ZUZWWFRIUnZiSGRsY2tOMGFEaEZaV3RUZUhORmRubEtPR3hOU2xWamFtWkZSMVpoWkhOVmMwd3pMeXRwU1RkSFV6SUtMUzB0TFMxRlRrUWdRMFZTVkVsR1NVTkJWRVV0TFMwdExRbz0ifX19fQ==",
          "integratedTime": 1667871637,
          "logIndex": 6704635,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/musl-dynamic/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/musl-dynamic",
      "githubWorkflowSha": "90434cb2f2de09faf579873a38e2d66e52369e3b",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3415632234",
      "sha": "90434cb2f2de09faf579873a38e2d66e52369e3b"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [apko](https://github.com/chainguard-dev/apko).

