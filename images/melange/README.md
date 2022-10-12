# melange

<!---
Note: Do NOT edit directly, this file was generated using https://github.com/chainguard-images/readme-generator
-->

[![CI status](https://github.com/chainguard-images/melange/actions/workflows/release.yaml/badge.svg)](https://github.com/chainguard-images/melange/actions/workflows/release.yaml)

Container image for running [melange](https://github.com/chainguard-dev/melange) workflows to build APK packages.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/melange:latest
```

## Supported tags

| Tag | Digest | Arch |
| --- | ------ | ---- |
| `latest` `v0.1.0` | `sha256:0e002c238e9179d57ca6062d380d6b99876937249d11dd1fdb06df21d1625e6b`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:0e002c238e9179d57ca6062d380d6b99876937249d11dd1fdb06df21d1625e6b) | `amd64` `arm64` `armv7` |


## Usage

To build the melange workflow in [examples](examples/gnu-hello.yaml):

```
docker run --privileged -v "$PWD":/work cgr.dev/chainguard/melange build /work/examples/gnu-hello.yaml
```

Output will be in the `packages` directory.

To build the melange package for the host architecture:

```
docker run --privileged -v "$PWD":/work cgr.dev/chainguard/melange build --empty-workspace --arch $(uname -m) /work/melange.yaml
```

To get a shell, you can change the entrypoint:

```
docker run --privileged -v "$PWD":/work -it --entrypoint /bin/sh cgr.dev/chainguard/melange

/ # melange version
...
```
Note that melange uses bubblewrap internally, which requires various Linux capabilities, hence the
use of `--privileged`. Because of this requirement, we recommend this image is used only for local
development and testing.


## Signing

All Chainguard Images are signed using [Sigstore](https://sigstore.dev)!

<details>
<br/>
To verify the image, download <a href="https://github.com/sigstore/cosign">cosign</a> and run:

```
COSIGN_EXPERIMENTAL=1 cosign verify cgr.dev/chainguard/melange:latest | jq
```

Output:
```
Verification for cgr.dev/chainguard/melange:latest --
The following checks were performed on each of these signatures:
  - The cosign claims were validated
  - Existence of the claims in the transparency log was verified offline
  - Any certificates were verified against the Fulcio roots.
[
  {
    "critical": {
      "identity": {
        "docker-reference": "ghcr.io/chainguard-images/melange"
      },
      "image": {
        "docker-manifest-digest": "sha256:0e002c238e9179d57ca6062d380d6b99876937249d11dd1fdb06df21d1625e6b"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "aef54f82e95bfa0e850ab70644b1cce2b543e7c7",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/melange",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQDlNz+o7k6gzLDbz6vAS4grV+1kq+0WT6Z8BeLrutYegwIgJcYFiUgxgxAzqZ/Ui3OPciye4lO1oLo8NgMiOnopkPU=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIxZDg2NjM5N2UxNzc2NmMwYmRkNzhiZTM0N2NjNTkyODkxN2Y2YWJiZDk2NDZiNDRiZDdjMGJmYzBhOGM4NzA3In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQTVGZTVFVHlzN0FRNGtjVjNwdjU1NVNsWmE5UUE1Rkxmdi93WThGU1BlZUFpQThPRHpXTUFQSUNKQXlnaWhxeUIwbVA0OTFFdzJpdHY1eW1UVmFHRGRaMUE9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhha05EUVhrclowRjNTVUpCWjBsVlRHMDVSbUZFV1VSQ2JXeEhVbU4zWlM5UGJGWmtNblVyVm5GemQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUlhsTlZHdDZUbXBWTUZkb1kwNU5ha2w0VFVSRmVVMVVhekJPYWxVd1YycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZZWWlzemRVeEZTMGxZUVRSaVRIZGxWRVJ5WWt0bldtUkZibnBWTm5kWFEwRm1LMWtLYVhkUWJWSXJUbFZPZWpKSlNqWTFkM2h0ZDJ0RWRtRkNhR1pUYXpoc04ybHVUak5LWkRsTlUycHNkV0puUW10UE1uRlBRMEZyTkhkblowcExUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZKVVhCaENtVkRWRkJJY1UxeFlsRmthVkl3Ympad0syOXBVV0pWZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVd4aVIwWjFXakpWZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWtsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVKSVFqRmpNbWQzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdldWZFdiVTVVVW0xUFJFcHNUMVJXYVZwdFJYZGFWR2N4VFVkR2FVNTZRVEpPUkZKcFRWZE9hbHBVU21sT1ZGRjZDbHBVWkdwT2VrRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYmtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKc2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZEZwWGVHaGliV1JzVFVJd1IwTnBjMGRCVVZGQ1p6YzRkMEZSV1VWRU0wcHNXbTVOZGdwaFIxWm9Xa2hOZG1KWFJuQmlha05DYVdkWlMwdDNXVUpDUVVoWFpWRkpSVUZuVWpoQ1NHOUJaVUZDTWtGQmFHZHJka0Z2VlhZNWIxSmtTRkpoZVdWRkNtNUZWbTVIUzNkWFVHTk5OREJ0TTIxMlEwbEhUbTA1ZVVGQlFVSm5PREo2U3paQlFVRkJVVVJCUldOM1VsRkpaMlJPY2pKUlNtRnpjMjlRU1dOWFZTOEtRWGR6WkcxWFMxRlJaMUJSTlVSblFYWktSVXBWWlVsVFpHcFZRMGxSUkdsTWEwRXhURkZPUVcxaGMxY3lZMjFNUTFSQ1RrVm1kbGx3ZFhsb1ZuUkhaZ3BNTnpneWFUQnRTbk5FUVV0Q1oyZHhhR3RxVDFCUlVVUkJkMDV3UVVSQ2JVRnFSVUY2TXpKYWFuWnZjMDVFVWtOUGNrSXlLMGRFTTJkMWFrRm5OMngwQ2sxR01tOHdjaXRyVEdONmFEVTFkSEV3WkRFMFpVVktNbmR1ZVZVMlJEQmhkMEpGVlVGcVJVRnlUVU0xUTFKb1pXaGlTMFpsU0hGdk5rSkxVVmN6WkZBS2VWcHlWVGRhYURKcFp6Sm9SSEZ4TkV4VU1uRjBNbGt5ZW5BM1JHVkRhRGh3UVVKNE5WQmFOQW90TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1665603431,
          "logIndex": 4981575,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/melange/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/melange",
      "githubWorkflowSha": "aef54f82e95bfa0e850ab70644b1cce2b543e7c7",
      "githubWorkflowTrigger": "push",
      "run_attempt": "1",
      "run_id": "3237265895",
      "sha": "aef54f82e95bfa0e850ab70644b1cce2b543e7c7"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

