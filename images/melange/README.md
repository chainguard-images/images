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
| `latest` `v0.1.0` | `sha256:4b4be20abc4ff6145245c93a4690fb77ea94139cc0326f0027c8aa1eecf1a5b9`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:4b4be20abc4ff6145245c93a4690fb77ea94139cc0326f0027c8aa1eecf1a5b9) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:4b4be20abc4ff6145245c93a4690fb77ea94139cc0326f0027c8aa1eecf1a5b9"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "fef4d6dd6dc5ad19073e30d6743f9e48f0308c55",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/melange",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCPXSpxCmdX+h8tbGDYKT/6+7BfmtqFcEGMAprzFM/srgIgS/xU9hvSHGBahr+M3OSQK/m9/Vcs7htj8R3OUUrCWSo=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIyN2FjNTY2OWJkYjQ3Mzc1NjZlZjljZmU0M2I1NDk2MzAzY2MwMDgyZDliODc4MDYwN2ZlNDMzOWUzMmMxOGZlIn19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJUUNzM2hidXZBMW5lakxUN2U3MmwvclB6cVMyd2FsS2l2MVliU0lmTXozT1N3SWdRTDJ1T002RjFIRklMaWtYOU9hZFZtK1N5VFhSZ1pZTVFSS1hjYS9OWXhrPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhla05EUVhwTFowRjNTVUpCWjBsVlIwczJVU3RpTjNacVVEaEJSWFk0Y0VRek5FRmFhVk12ZFhWUmQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFVFhkTlJFRXhUMVJSTWxkb1kwNU5ha2w0VFVSTmQwMUVSWGRQVkZFeVYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVZ2Y2xBdmJUZGxkM1JDWlc5TldrbHlTRTkzU0VsQlZrNXJaMWcwTlhGa1FrUXlNRW9LY205WlJtMDRkVVZCTldoVmVGQjZiaTh2YWpSNWJuTlJkVEl5ZDNkRUx5c3JWR2R0UkZCa1pGWlNURGw0YjJ0eU1tRlBRMEZzUlhkblowcE9UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlUwUkRkaUNtMXlaelpYUTJGRk4zcHpVamtyTlhsaFVIbDVVbVpOZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVd4aVIwWjFXakpWZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRIV214YWFsSnJUbTFTYTA1dFVtcE9WMFpyVFZScmQwNTZUbXhOZWtKclRtcGpNRTB5V1RWYVZGRTBDbHBxUVhwTlJHaHFUbFJWZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWmlWMVp6V1ZjMWJscFVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFphMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaWGRTTlVGSVkwRmtVVUZKV1VwTWQwdEdUQzloUlZoU0NqQlhjMjVvU25oR1duaHBjMFpxTTBSUFRrcDBOWEozYVVKcVduWmpaMEZCUVZsUmJWcDBNRTVCUVVGRlFYZENSMDFGVVVOSlIxWm5SeXRrYmtGWGNqUUtjbmxoVUVKSk4wczJNMUpEWXpSaWNVUk5LMDVYVUdaV1dIWkdTamRrTm1GQmFVSlVNR1ZyU0hWaWFYRlNSMmRZTDJONWIyTnZVVEE0VUU5SlExSXZOZ3ByWTBwamREYzFja2syTjJOR1ZFRkxRbWRuY1docmFrOVFVVkZFUVhkT2JrRkVRbXRCYWtJek5UWkphVkUyVTNwSlJFVTFSM2RKU1ZoU2JuZDFVemhrQ2xadE1IZHBjWGh1VjBscGFIRnZSWEZETWpacU5qUXpkbkptYTNCeVdWbEtLemh3VGpkTE1FTk5RM2RRZFhSaUwxbGhVbkJOVGtsc1MwOVZSMVZRUVVnS1NUVXdSeTl6TW5KcVptOUVlVTVZVFRJNU1XNDVNV2w1VmxsSVUyUmpNVkJVYzJWYU5HVXdSREpuUFQwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1667091596,
          "logIndex": 6131919,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/melange/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/melange",
      "githubWorkflowSha": "fef4d6dd6dc5ad19073e30d6743f9e48f0308c55",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3353540089",
      "sha": "fef4d6dd6dc5ad19073e30d6743f9e48f0308c55"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

