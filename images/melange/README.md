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
| `latest` `v0.1.0` | `sha256:49e7c1211370727989ebea4171a01f6f5fd07c9d464fdd574d63031f33704c81`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:49e7c1211370727989ebea4171a01f6f5fd07c9d464fdd574d63031f33704c81) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:49e7c1211370727989ebea4171a01f6f5fd07c9d464fdd574d63031f33704c81"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "6f035e6ac0c539defeb51d2a4bd32057196bdfd5",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/melange",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEQCIDTeYbDEKL2XIxcu+jvCJZdPhW1MvK2aavz4/TR8bs2KAiB9whn5dLNbRb2Oq5nl9x5AQYgyngE68SShr9nED/5Vew==",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIyYjRlM2FjZWQ3ZjA1N2YxOGU0NGQ1NTI4ZTliZDQ4ZWUwYWVkMDkwOTEzZDFlY2Y4M2NkZTQ1NDVlOWFiODJiIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FUUNJQU9XN2cwZnpZQnBITlNBRkxLclIxRTRjRWYxYW82R2E4RTVrYmxDQXFkK0FpQXZObVI1b3lwWlJpeStuR1k4YU1wblFBaXZRRS95R3VZM0JPdXVtOW1nU2c9PSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnlWRU5EUVhwUFowRjNTVUpCWjBsVlRuVmFVR1ZLU0hkbWJFODRRMjl4VlV4bU1EUnVOR1J3TTJ4VmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFVFhoTlJFVjNUVlJCTTFkb1kwNU5ha2w0VFVSTmVFMUVSWGhOVkVFelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZKTXk4NGRrWTRXWGRLVVc0d1FVRkNlbkpJYjJreU1qVkxXRTUzUkZwSFdHdGtOMUFLVlVaM1kzSm5TV28xWmpWb00zZHVjRWd5VkZOWlEyZFdTV0k0ZDJKSVYwcFRlWGw2WkdSalMwRllZblU1TUVWNVpuRlBRMEZzU1hkblowcFBUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlYzUzFKdENscDBjUzlQYldOVVYyaGFla2g1VW1ST1F5dFZkakJyZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVd4aVIwWjFXakpWZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRFV20xTlJFMHhXbFJhYUZsNlFtcE9WRTAxV2tkV2JWcFhTVEZOVjFGNVdWUlNhVnBFVFhsTlJGVXpDazFVYXpKWmJWSnRXa1JWZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWmlWMVp6V1ZjMWJscFVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFpiMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaa0ZTTmtGSVowRmtaMEZKV1VwTWQwdEdUQzloUlZoU0NqQlhjMjVvU25oR1duaHBjMFpxTTBSUFRrcDBOWEozYVVKcVduWmpaMEZCUVZsUmNtcHVaWGhCUVVGRlFYZENTRTFGVlVOSlVVTjROREZXYjJaaGFFTUtSamwwY25GR1VubHRkMUl5VlRCdlJWaG1OSEVyUVUxNlREWkNXRGsyVmpoNFVVbG5aa2M1Y21SeFJGSXZTakJsV1dKU1dDOXFibkZCVVhKemFVODRaUXBGTWpCTU9IZFdhRFU0Y1ZoVGVHdDNRMmRaU1V0dldrbDZhakJGUVhkTlJHRkJRWGRhVVVsM1NYaDVVVnBwVmprdlprOUJTSGhZUWpkeVkyVlJPWFJJQ214QlFXTjFNMDU0WlVsNU9VTjVaR1pRWVhWckwwdG1LMEZKVGxoTU0wNXBXWEZ6YWpSMVdqWkJha1ZCZGpKWWFVTTFZbmQxS3pkU1pHaHBaVkU1TUVNS1JIaFhRMmR2UlM5RFNEVjJWVkZPTTJWblRVUTBOVTlaUzNONVVURllObGcyYzBOTlozSXhWMVZhWTFvS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1667178084,
          "logIndex": 6190281,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/melange/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/melange",
      "githubWorkflowSha": "6f035e6ac0c539defeb51d2a4bd32057196bdfd5",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3357747342",
      "sha": "6f035e6ac0c539defeb51d2a4bd32057196bdfd5"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

