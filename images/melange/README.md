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
| `latest` `v0.1.0` | `sha256:3f21427862cf97a94cbfde85ac42e8a08881cb7eaaac7aed6141cff4ea189b12`<br/>[View entry in Rekor](https://rekor.tlog.dev/?hash=sha256:3f21427862cf97a94cbfde85ac42e8a08881cb7eaaac7aed6141cff4ea189b12) | `amd64` `arm64` `armv7` |


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
        "docker-manifest-digest": "sha256:3f21427862cf97a94cbfde85ac42e8a08881cb7eaaac7aed6141cff4ea189b12"
      },
      "type": "cosign container image signature"
    },
    "optional": {
      "1.3.6.1.4.1.57264.1.1": "https://token.actions.githubusercontent.com",
      "1.3.6.1.4.1.57264.1.2": "schedule",
      "1.3.6.1.4.1.57264.1.3": "cf2f6ea071902e9b7d1917100a4e095e59fad1a1",
      "1.3.6.1.4.1.57264.1.4": "Create Release",
      "1.3.6.1.4.1.57264.1.5": "chainguard-images/melange",
      "1.3.6.1.4.1.57264.1.6": "refs/heads/main",
      "Bundle": {
        "SignedEntryTimestamp": "MEUCIQCP4ot7rC+EyvBPxtPctpeuUGARG9S3i0Hp8N8Yz5xt7wIgRJaqEGfi/VAkbPFCAYY+yj2ljg783JabtdSFavcRAKs=",
        "Payload": {
          "body": "eyJhcGlWZXJzaW9uIjoiMC4wLjEiLCJraW5kIjoiaGFzaGVkcmVrb3JkIiwic3BlYyI6eyJkYXRhIjp7Imhhc2giOnsiYWxnb3JpdGhtIjoic2hhMjU2IiwidmFsdWUiOiIwMTFlMmRmZGQ4MDQ5Y2EzZWZlMzc3NmI5Y2ZlMGU2NmNmNmI5NDhmMWFjMmNkNTQ0YzRlNDM1YjE0YjNlOTY5In19LCJzaWduYXR1cmUiOnsiY29udGVudCI6Ik1FVUNJQ3JmbElSeHNmK2dwSHdNZ3RwRGFVTURzdTdFTWM4ak5rTjdJT1dueUpJZkFpRUFtc0pERnJnZ2lZZnozeTdvMDdYVVBhWENwOGRGV01WSEhwRzRGdEF2dTJnPSIsInB1YmxpY0tleSI6eyJjb250ZW50IjoiTFMwdExTMUNSVWRKVGlCRFJWSlVTVVpKUTBGVVJTMHRMUzB0Q2sxSlNVUnhla05EUVhwTFowRjNTVUpCWjBsVlZrMTJUMUp3ZDNSbWRTdDRiMlJMTldocWJXWk1OM1JpWTFBMGQwTm5XVWxMYjFwSmVtb3dSVUYzVFhjS1RucEZWazFDVFVkQk1WVkZRMmhOVFdNeWJHNWpNMUoyWTIxVmRWcEhWakpOVWpSM1NFRlpSRlpSVVVSRmVGWjZZVmRrZW1SSE9YbGFVekZ3WW01U2JBcGpiVEZzV2tkc2FHUkhWWGRJYUdOT1RXcEplRTFFUVRWTlJFRXhUbFJGTTFkb1kwNU5ha2w0VFVSQk5VMUVSWGRPVkVVelYycEJRVTFHYTNkRmQxbElDa3R2V2tsNmFqQkRRVkZaU1V0dldrbDZhakJFUVZGalJGRm5RVVYyZVVKdVJuY3JkbEl2TjIxTE1HdGpVbFpIZVdKdVIyeHNVM1ZQVUU5d1JDOUxTazhLVlRVNU1FRnBZVUo2ZUU5Q1ZHZFlTbU5PTXpsa2RVZG1abXQzV2sxWU1uRXJjRTk2UTFFNWNYVlNXSEJhYmpoM2VqWlBRMEZzUlhkblowcE9UVUUwUndwQk1WVmtSSGRGUWk5M1VVVkJkMGxJWjBSQlZFSm5UbFpJVTFWRlJFUkJTMEpuWjNKQ1owVkdRbEZqUkVGNlFXUkNaMDVXU0ZFMFJVWm5VVlY0WkVzMENtTk1ZMFpoT1dWamIxb3JZVEV6VG01a1NVTlhRME5WZDBoM1dVUldVakJxUWtKbmQwWnZRVlV6T1ZCd2VqRlphMFZhWWpWeFRtcHdTMFpYYVhocE5Ga0tXa1E0ZDJGUldVUldVakJTUVZGSUwwSkdPSGRZV1ZwaVlVaFNNR05JVFRaTWVUbHVZVmhTYjJSWFNYVlpNamwwVERKT2IxbFhiSFZhTTFab1kyMVJkQXBoVnpGb1dqSldla3d5TVd4aVIwWjFXakpWZGt4dFpIQmtSMmd4V1drNU0ySXpTbkphYlhoMlpETk5kbU50Vm5OYVYwWjZXbE0xTlZsWE1YTlJTRXBzQ2xwdVRYWmhSMVpvV2toTmRtSlhSbkJpYWtFMVFtZHZja0puUlVWQldVOHZUVUZGUWtKRGRHOWtTRkozWTNwdmRrd3pVblpoTWxaMVRHMUdhbVJIYkhZS1ltNU5kVm95YkRCaFNGWnBaRmhPYkdOdFRuWmlibEpzWW01UmRWa3lPWFJOUWxsSFEybHpSMEZSVVVKbk56aDNRVkZKUlVOSVRtcGhSMVpyWkZkNGJBcE5SRmxIUTJselIwRlJVVUpuTnpoM1FWRk5SVXRIVG0xTmJWa3lXbGRGZDA1NlJUVk5SRXBzVDFkSk0xcEVSVFZOVkdONFRVUkNhRTVIVlhkUFZGWnNDazVVYkcxWlYxRjRXVlJGZDBoQldVdExkMWxDUWtGSFJIWjZRVUpDUVZGUFVUTktiRmxZVW14SlJrcHNZa2RXYUdNeVZYZEtkMWxMUzNkWlFrSkJSMFFLZG5wQlFrSlJVVnBaTW1ob1lWYzFibVJYUm5sYVF6RndZbGRHYmxwWVRYWmlWMVp6V1ZjMWJscFVRV1JDWjI5eVFtZEZSVUZaVHk5TlFVVkhRa0U1ZVFwYVYxcDZUREpvYkZsWFVucE1NakZvWVZjMGQyZFphMGREYVhOSFFWRlJRakZ1YTBOQ1FVbEZaWGRTTlVGSVkwRmtVVUZKV1VwTWQwdEdUQzloUlZoU0NqQlhjMjVvU25oR1duaHBjMFpxTTBSUFRrcDBOWEozYVVKcVduWmpaMEZCUVZsUE5sQlVWVzFCUVVGRlFYZENSMDFGVVVOSlJDc3hSamswZGxoUFIwa0tZMmRQWWpWNlJHZG5Ra2xPUW1WRlRGUlNPVVZ4VkZNd1JWbzNjRTl2ZFZSQmFVSjRNVVZhV2xkdlJYTmFiWEJuUVRnMFl5dElkVGRRUzB0NVNXMVZSQXB5VkZoeU1XdGtTWFJCVlhWSmFrRkxRbWRuY1docmFrOVFVVkZFUVhkT2JrRkVRbXRCYWtKbWVGTlhLMFJZUmtzek5VNVdTRFZKYVc5dFZrcEhaRmRtQ21SR1dtNU1jVzFOYkdKWmMxQk5iMUJ5Unl0VkwydENibWxETlVOUlFTOUJWVzFqTlRkVVNVTk5SVWczYlc1Wk5GSklVMWR2SzFBdlpERkpWbW8yY1hBS2N6Uk5iRFI2U0VwR1RFdHRPRkJQT0VkelVrTkxkV1I1VFhOWWNqVXdVMEpzUW5aaWRXNURSM1pCUFQwS0xTMHRMUzFGVGtRZ1EwVlNWRWxHU1VOQlZFVXRMUzB0TFFvPSJ9fX19",
          "integratedTime": 1665276925,
          "logIndex": 4724199,
          "logID": "c0d23d6ad406973f9559f3ba2d1ca01f84147d8ffc5b8445c224f98b9591801d"
        }
      },
      "Issuer": "https://token.actions.githubusercontent.com",
      "Subject": "https://github.com/chainguard-images/melange/.github/workflows/release.yaml@refs/heads/main",
      "githubWorkflowName": "Create Release",
      "githubWorkflowRef": "refs/heads/main",
      "githubWorkflowRepository": "chainguard-images/melange",
      "githubWorkflowSha": "cf2f6ea071902e9b7d1917100a4e095e59fad1a1",
      "githubWorkflowTrigger": "schedule",
      "run_attempt": "1",
      "run_id": "3212343151",
      "sha": "cf2f6ea071902e9b7d1917100a4e095e59fad1a1"
    }
  }
]
```

You can verify that the image was built in Github Actions in this repository from the `Issuer` and `Subject` fields.
</details>

## Build

This image is built with [melange](https://github.com/chainguard-dev/melange) and [apko](https://github.com/chainguard-dev/apko).

