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
| `latest` `v0.1.0` | `sha256:138eb804ea3304c1b76bc8fba28465b65352e1d6d2c2d43c2631bb8291a2c65f`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:138eb804ea3304c1b76bc8fba28465b65352e1d6d2c2d43c2631bb8291a2c65f) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:138eb804ea3304c1b76bc8fba28465b65352e1d6d2c2d43c2631bb8291a2c65f"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.2": "push",
      "1.3.6.1.4.1.57264.1.3": "2b3316d285bafb7d76ed563e6c6f57a5c51d433b",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/melange",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEYCIQD6ekU16Ms/Sb97dS+LbRMEm8JV3hbScMYmnNbZ1P9nSAIhAP1CTMbSuFocbg97oU8Z7JR2OgTrbS3FmdJuEKexV5Jo",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiI1NGE0MmRiNDBmNTQ2MmEwZDM4ZDkzMTA0YzA3MzQ0ODU1NTY3M2EwNzlkNWIwNTZhMDM0Nzk1NGY1YmVmZmYwIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQzFrYkxzSmdmV3ZIbE5Wb3JlODlOMTlxSHlBcXhyZFZnbyswVXZ5MGtJcEFpRUEzYUJUclI0L1F6NGJKRHBZdDJhNXdQWCt3MVFkMS9NOFZmdzRpVTBXSnBzPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhSRU5EUVhrclowRjNTVUpCWjBsVlZrZzJaRXRETmxWRVdtWXdlREZPWm5wQlltbHpWV1p0Wnl0VmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEpkMDlVU1hkTlZHZDRUa1JKTkZkb1kwNU5ha2wzVDFSSmQwMVVaM2xPUkVrMFYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVV3VjBWMlpFdEZTQ3RFZEU1MmFXUkdkbFZ0UWpCS09HcEpjVmRyUVV4b2RtbEhPSGtLVFM5R1IwODFLMFp0UmpOdGFEZHNOMkkyZDJsek1WbG5kWFpSV1VsMVlYVkJNVlZ0WlZONlNsZFJSMU5GU0haSGIwdFBRMEZyTkhkblowcExUVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlZKTVdGRENqSkNaMlp0ZW5wR0wzQndVU3RyTWxKRmMwOHdVMU00ZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVd4aVIwWjFXakpWZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWtsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVKSVFqRmpNbWQzVG1kWlN3cExkMWxDUWtGSFJIWjZRVUpCZDFGdlRXMUplazE2UlRKYVJFazBUbGRLYUZwdFNUTmFSR015V2xkUk1VNXFUbXhPYlUweVdtcFZNMWxVVm1wT1ZFWnJDazVFVFhwWmFrRmpRbWR2Y2tKblJVVkJXVTh2VFVGRlJVSkJOVVJqYlZab1pFZFZaMVZ0Vm5OYVYwWjZXbFJCYmtKbmIzSkNaMFZGUVZsUEwwMUJSVVlLUWtKc2FtRkhSbkJpYldReFdWaEthMHhYYkhSWlYyUnNZM2s1ZEZwWGVHaGliV1JzVFVJd1IwTnBjMGRCVVZGQ1p6YzRkMEZSV1VWRU0wcHNXbTVOZGdwaFIxWm9Xa2hOZG1KWFJuQmlha05DYVdkWlMwdDNXVUpDUVVoWFpWRkpSVUZuVWpoQ1NHOUJaVUZDTWtGQmFHZHJka0Z2VlhZNWIxSmtTRkpoZVdWRkNtNUZWbTVIUzNkWFVHTk5OREJ0TTIxMlEwbEhUbTA1ZVVGQlFVSm5NWGRpZVRCWlFVRkJVVVJCUldOM1VsRkpaMlJxVEVZNGVuY3JaMWwyTjA1S2R6SUtZWEpEZGpsa1ZteHNPV0p0TmtZNWNsaFFSamhoSzNoM1dGUmpRMGxSUTNKcVFXSnJNR3RoYVZWS1ZFdFVOMUEyVW5kV01XTjVUVnBwVjJodVEzUTBOQXBEVTNoMlJEWjJkMjlFUVV0Q1oyZHhhR3RxVDFCUlVVUkJkMDV1UVVSQ2EwRnFRVUp5TUZoR1ZWZGpaV28yWlVOSVVsQm9lRE5oSzJGS01saEdWWFUxQ25VeVNIWlNTWE5SZWxKVWRGcGhPV0ZIWkVsRFFVSlRlbXBMZDNCTE9VMTFNMWhqUTAxSVQya3JObGxxZDBrME9FdHNRVkZOY0ZZeVQwZDBORVpVUVZFS2ExbHhiVlJzUlVwbWNWRkVlRkJMYWxCUmQzRm5kbXhwZGpad2FGcHlTV2d6TlhVMGJXYzlQUW90TFMwdExVVk9SQ0JEUlZKVVNVWkpRMEZVUlMwdExTMHRDZz09In19fX0=",
          "integratedTime": 1663697683,
          "logIndex": 3621563,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/melange/.github/workflows/release.yaml@refs/heads/main",
      "run_attempt": "1",
      "run_id": "3092332560",
      "sha": "2b3316d285bafb7d76ed563e6c6f57a5c51d433b"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

